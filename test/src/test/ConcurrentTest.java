package test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Semaphore;

public class ConcurrentTest {

	public static void main(String[] args) {
		int i= 1;
		try {
			int s = i / 0;
		} catch (Exception e) {
			System.out.println("---------------------------------");
			e.printStackTrace();
		}
		System.out.println("+++++++++++++++++++++++++++++++++++++++");

	}

}