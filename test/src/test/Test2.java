package test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Semaphore;

public class Test2 {

	public static void main(String[] args) {

		ExecutorService exec = Executors.newFixedThreadPool(30);

		for (int index = 0; index < 1000000; index++) {

			final int NO = index;

			Runnable run = new Runnable() {

				public void run() {

					try {
						long time1 = System.currentTimeMillis();
						URL url = new URL("http://192.168.2.122:8080/yygl/doctor/uploadHospitalLocation/v1?hospitalId=72b8563beef0471abbf842904facf734&longitude=113.049253&latitude=28.243269");
						InputStreamReader isr = new InputStreamReader(url.openStream());
						long time2 = System.currentTimeMillis();
						System.out.print("Thread " + NO + " time:" + (time2 - time1) + "ms");
						BufferedReader br = new BufferedReader(isr);
						String str;
						while ((str = br.readLine()) != null) {
							System.out.println(str);
						}
						br.close();
						isr.close();

					} catch (Exception e) {

						e.printStackTrace();

					}

				}

			};

			exec.execute(run);

		}

		// 退出线程池

		exec.shutdown();

	}

}