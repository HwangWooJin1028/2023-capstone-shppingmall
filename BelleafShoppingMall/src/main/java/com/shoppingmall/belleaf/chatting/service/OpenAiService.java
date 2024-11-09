package com.shoppingmall.belleaf.chatting.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.shoppingmall.belleaf.chatting.vo.ChatCompletion;

public class OpenAiService {
	
	private static ChatCompletion chatCompletion;
	
	public OpenAiService() {
		chatCompletion = new ChatCompletion();
	}
	

	// chatgpt 와 연결하여 
	public static String openAI(String message) {
		String url = "https://api.openai.com/v1/chat/completions";
		String apiKey = "";
		String model = "gpt-4o-mini";
		
		try {
			
			// header
			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "Bearer " + apiKey);
			con.setRequestProperty("Content-Type", "application/json");
			
			// request body 만들기
			String body = "{\"model\": \"" + model + "\", \"messages\": [{\"role\": \"user\", \"content\": \"" + message + "\"}]}";
			con.setDoOutput(true);
			OutputStreamWriter writer = new OutputStreamWriter(con.getOutputStream());
			writer.write(body);
			writer.flush();
			writer.close();
			
			// response 얻기
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while((inputLine = in.readLine()) != null) {
				response.append(inputLine);
				
			}
			in.close();
			System.out.println(response.toString());
			
			return response.toString();
			
		} catch(IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static String pasingJson(String response) {
		try {
			ObjectMapper mapper = new ObjectMapper();
		    chatCompletion = mapper.readValue(response, ChatCompletion.class);
		    String content = chatCompletion.choices.get(0).message.content;
		    
		    return content;
		    
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public static ChatCompletion getChatCompletion() {
		return chatCompletion;
	}

	public static void setChatCompletion(ChatCompletion chatCompletion) {
		OpenAiService.chatCompletion = chatCompletion;
	}
}
