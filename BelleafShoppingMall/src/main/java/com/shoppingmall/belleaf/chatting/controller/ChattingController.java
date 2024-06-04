package com.shoppingmall.belleaf.chatting.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.shoppingmall.belleaf.chatting.service.OpenAiService;
import com.shoppingmall.belleaf.chatting.vo.ChatCompletion;
import com.shoppingmall.belleaf.chatting.vo.ChatMessageState;
import com.shoppingmall.belleaf.chatting.vo.ChatVO;


@Controller
public class ChattingController {
	
	@GetMapping(" 'ch")
	public String OpenChatting(Model model, ChatVO chat) {
		
		model.addAttribute("chat", chat);
		
		return "common/chat";
	}
	
	@PostMapping("/chat/response")
	public String getResponseOpenAI(Model model, ChatVO chat) {
		
		String result = OpenAiService.pasingJson(OpenAiService.openAI(chat.getMessage()));
		ChatVO vo = new ChatVO(result,ChatMessageState.STATE_BOT);
		model.addAttribute("chat", vo);
		
		return "common/chat";
	}
	
	/*
	 * @PostMapping(value = "/chat", produces = "application/text; charset=utf-8")
	 * 
	 * @ResponseBody public String chatting(@RequestParam String
	 * message, @RequestParam int type) { // 만약 type이 2 이면 이것을 실행..(type은 user인지
	 * bot인지 알려주는 것. user인것은 2, bot인것은 1. 없어도 되지만 혹시 모르니 추가함) String msg = "!error";
	 * if(type == 2) { // 여기에 chatgpt와 연결하는 코드를 추가 msg =
	 * pasingJson(chatGPT(message)); }
	 * 
	 * return msg; }
	 */
	
	@PostMapping(value = "/chat", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String chatting(@RequestParam("message") String message,
            @RequestParam("messageState") int messageStateIndex) {
		
		// 메시지와 상태를 기반으로 ChatVO 객체 생성
		ChatMessageState messageState = ChatMessageState.IndexToChatMessageState(messageStateIndex);
		ChatVO chat = new ChatVO(message, messageState);
		System.out.println(chat.toString());
		
		// 만약 messageState가 STATE_BOT이면, 이 로직을 실행
		String msg = "!error";
		
		if (chat.getMessageState() == ChatMessageState.STATE_USER) {
			// 여기에 chatgpt와 연결하는 코드를 추가
			msg = OpenAiService.pasingJson(OpenAiService.openAI(chat.getMessage()));
		}
		
		return msg;
	}
	
	 
	
	public static String chatGPT(String message) {
		String url = "https://api.openai.com/v1/chat/completions";
		String apiKey = "sk-proj-9XWfi4VGTGPX8a7uOXdKT3BlbkFJCifbSfoPafsjcxmZRfzP";
		String model = "gpt-3.5-turbo";
		
		try {
			
			// URL 객체 생성: 'url' 변수에 저장된 문자열을 URL 객체로 변환합니다.
			URL obj = new URL(url);

			// URL 연결 객체 생성: URL 객체에서 HttpURLConnection 객체를 생성합니다. 이 객체를 통해 서버와의 연결 및 HTTP 요청을 수행할 수 있습니다.
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();

			// HTTP 메소드 설정: HTTP 요청의 방식을 POST로 설정합니다. POST는 데이터를 서버에 전송할 때 사용합니다.
			con.setRequestMethod("POST");

			// HTTP 헤더 설정: 요청 헤더에 "Authorization"을 추가하고, 값으로 "Bearer "와 apiKey를 결합한 문자열을 사용합니다. 이는 API 사용을 인증받기 위해 필요합니다.
			con.setRequestProperty("Authorization", "Bearer " + apiKey);

			// HTTP 헤더 설정: 요청의 컨텐츠 타입을 JSON으로 설정합니다. 이 헤더는 서버에게 요청 데이터의 형식을 알려주는 역할을 합니다.
			con.setRequestProperty("Content-Type", "application/json");

			// 출력 가능 설정: HttpURLConnection을 통해 출력을 할 수 있도록 설정합니다. 기본적으로 연결은 입력만 가능하므로, 출력을 위해 이 설정을 해주어야 합니다.
			con.setDoOutput(true);

			// 요청 본문 작성: 요청 본문을 작성하기 위해 OutputStreamWriter 객체를 생성합니다. 이 객체는 바이트 스트림을 문자 스트림으로 변환해줍니다.
			OutputStreamWriter writer = new OutputStreamWriter(con.getOutputStream());

			// JSON 요청 본문 작성: JSON 형식의 문자열을 작성하고, 이를 요청 본문으로 서버에 전송합니다.
			String body = "{\"model\": \"" + model + "\", \"messages\": [{\"role\": \"user\", \"content\": \"" + message + "\"}]}";
			writer.write(body);

			// 스트림 버퍼 비우기: 스트림에 남아 있을 수 있는 데이터를 강제로 출력하여 보냅니다.
			writer.flush();

			// 스트림 닫기: 데이터 전송이 끝났으므로 writer 객체를 닫습니다. 이 과정은 더 이상의 데이터 전송이 없음을 시스템에 알리고 자원을 해제합니다.
			writer.close();

			// 응답 받기: 서버로부터 응답을 받기 위해 BufferedReader를 사용합니다. 이 객체는 문자 입력 스트림에 버퍼링을 제공하여 문자, 배열 및 라인의 효율적인 읽기를 도와줍니다.
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));

			// 응답 데이터 읽기: 서버로부터 전달받은 응답 데이터를 한 줄씩 읽어들입니다.
			String inputLine;
			StringBuffer response = new StringBuffer();
			while((inputLine = in.readLine()) != null) {
			    response.append(inputLine);
			}

			// 스트림 닫기: 데이터 읽기가 완료되면 입력 스트림을 닫습니다. 이는 자원 사용을 정리하고 다른 작업을 위해 시스템 리소스를 해제하는 중요한 단계입니다.
			in.close();

			// 응답 출력: 읽어들인 응답 데이터를 문자열로 변환하여 출력합니다.
			System.out.println(response.toString());

			// 응답 반환: 응답 데이터를 문자열 형태로 반환합니다. 이 문자열을 메소드를 호출한 곳에서 사용할 수 있습니다.
			return response.toString();

			
		} catch(IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static String pasingJson(String response) {
		try {
			ObjectMapper mapper = new ObjectMapper();
		    ChatCompletion chatCompletion = mapper.readValue(response, ChatCompletion.class);
		    String content = chatCompletion.choices.get(0).message.content;
		    
		    return content.replace("\n", "<br>");
		    
		    } catch (Exception e) {
		    	throw new RuntimeException(e);
		    }
	}

}
