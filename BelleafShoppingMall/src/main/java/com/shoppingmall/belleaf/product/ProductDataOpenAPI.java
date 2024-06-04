package com.shoppingmall.belleaf.product;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class ProductDataOpenAPI {
	private static String apiKey = "186395a2-4d8f-4d06-b4b9-5659adbf2b65";
	private static String requestUrl = "http://www.kamis.co.kr/service/price/xml.do?action=dailySalesList";
	private static String returnType = "json";
	private static String requestId = "4050";
	
	
	public static void getProductPrice() throws IOException, ParseException {
		System.out.println("AdminHomeController -> [/product/review]");
		StringBuilder urlBuilder = new StringBuilder(requestUrl);
	    urlBuilder.append("&" + URLEncoder.encode("p_cert_key", "UTF-8") + "=" + apiKey);
	    urlBuilder.append("&" + URLEncoder.encode("p_cert_id", "UTF-8") + "=" + URLEncoder.encode(requestId, "UTF-8"));
	    urlBuilder.append("&" + URLEncoder.encode("p_returntype", "UTF-8") + "=" + URLEncoder.encode(returnType, "UTF-8"));
	    
	    // URL 연결 설정
	    URL url = new URL(urlBuilder.toString());
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	    conn.setRequestMethod("GET");

	    // 응답 코드 확인
	    int responseCode = conn.getResponseCode();
	    System.out.println("Response Code: " + responseCode);

	    // 응답 내용 읽기
	    BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	    String inputLine;
	    StringBuilder response = new StringBuilder();

	    while ((inputLine = in.readLine()) != null) {
	        response.append(inputLine);
	    }
	    in.close();

	    // 응답 내용 출력
	    JSONParser parser = new JSONParser();
	    JSONObject obj = (JSONObject) parser.parse(response.toString());
	    JSONArray price = (JSONArray) obj.get("price");

	    System.out.println("Response: " + price);
	}

	public static String getReturnType() {
		return returnType;
	}

	public static String getApiKey() {
		return apiKey;
	}
		
	public static String getRequestUrl() {
		return requestUrl;
	}
	
	public static String getRequestId() {
		return requestId;
	}
	

}
