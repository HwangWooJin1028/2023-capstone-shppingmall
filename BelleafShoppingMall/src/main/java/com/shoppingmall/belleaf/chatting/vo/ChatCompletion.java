package com.shoppingmall.belleaf.chatting.vo;

import java.util.List;


// 2024-11-09 수정 - pasing 내용 변경
public class ChatCompletion {
    public String id;
    public String object;
    public long created;
    public String model;
    public List<Choice> choices;
    public Usage usage;
    public String system_fingerprint;

    public static class Choice {
        public int index;
        public Message message;
        public Object logprobs;
        public String finish_reason;
    }

    public static class Message {
        public String role;
        public String content;
        public Object refusal; // 추가된 필드
    }

    public static class Usage {
        public int prompt_tokens;
        public int completion_tokens;
        public int total_tokens;
        public PromptTokensDetails prompt_tokens_details; // 추가된 필드
        public CompletionTokensDetails completion_tokens_details; // 추가된 필드
    }

    public static class PromptTokensDetails {
        public int cached_tokens;
        public int audio_tokens;
    }

    public static class CompletionTokensDetails {
        public int reasoning_tokens;
        public int audio_tokens;
        public int accepted_prediction_tokens;
        public int rejected_prediction_tokens;
    } 
}

