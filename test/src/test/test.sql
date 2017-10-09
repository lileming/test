

/* Event structure for event `event_goods_max_stock` */

DROP EVENT IF EXISTS `event_goods_max_stock`;

DELIMITER $$

CREATE EVENT `event_goods_max_stock` ON SCHEDULE EVERY 1 DAY STARTS '2015-12-28 22:00:00' ON COMPLETION PRESERVE ENABLE DO CALL pro_goods_max_stock() $$
DELIMITER ;

/* Event structure for event `event_order_auto_rec` */

DROP EVENT IF EXISTS `event_order_auto_rec`;

DELIMITER $$

CREATE EVENT `event_order_auto_rec` ON SCHEDULE EVERY 1 DAY STARTS '2015-12-28 22:00:00' ON COMPLETION PRESERVE ENABLE DO BEGIN
  CALL pro_order_auto_rec ();
END $$
DELIMITER ;

/* Procedure structure for procedure `pro_goods_max_stock` */

DROP PROCEDURE IF EXISTS  `pro_goods_max_stock`;

DELIMITER $$

CREATE PROCEDURE `pro_goods_max_stock`()
BEGIN
UPDATE s_goods_stock t SET t.`goods_stock`=t.max_stock WHERE t.max_stock IS NOT NULL AND t.`goods_stock`<t.max_stock;
END $$
DELIMITER ;

/* Procedure structure for procedure `pro_order_auto_rec` */

DROP PROCEDURE IF EXISTS  `pro_order_auto_rec`;

DELIMITER $$

CREATE PROCEDURE `pro_order_auto_rec`()
BEGIN
  UPDATE 
    s_order_info t 
  SET
    t.`order_state` = 4 
  WHERE t.order_state = 3 
    AND t.delivery_time IS NOT NULL 
    AND DATE_ADD(delivery_time, INTERVAL 7 DAY) < NOW() ;
END $$
DELIMITER ;