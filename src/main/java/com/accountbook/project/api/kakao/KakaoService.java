package com.accountbook.project.api.kakao;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Service
@Component
@RequiredArgsConstructor
public class KakaoService {
    private final KakaoMapper kakaoMapper;

    @Value("${kakao.grant_type}")
    private String grant_type;
    @Value("${kakao.client_id}")
    private String client_id;
    @Value("${kakao.redirect_uri}")
    private String redirect_uri;

    public long getId(long id) {
        return kakaoMapper.getId(id);
    }

    public long getKakaoId(long id) {
        return kakaoMapper.getKakaoId(id);
    }

    public void insertKakaoId(Map<String, Object> map) {
        kakaoMapper.insertKakaoId(map);
    }

    public String getAccessToken(String code) throws Exception {
        String accessToken = "";
        String refreshToken = "";
        String requestUrl = "https://kauth.kakao.com/oauth/token";

        URL url = new URL(requestUrl);
        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setDoOutput(true); // default true

        BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(httpURLConnection.getOutputStream()));
        StringBuilder stringBuffer = new StringBuilder();

        log.info("grant_type = {}", grant_type);
        log.info("client_id = {}", client_id);
        log.info("redirect_uri = {}", redirect_uri);

        stringBuffer.append("grant_type=").append(grant_type);
        stringBuffer.append("&client_id=").append(client_id);
        stringBuffer.append("&redirect_uri=").append(redirect_uri);
        stringBuffer.append("&code=" + code)
        ;
        bufferedWriter.write(stringBuffer.toString());
        bufferedWriter.flush();

        int responseCode = httpURLConnection.getResponseCode();
        log.info("responseCode = {}", responseCode);

        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream(), "UTF-8"));
        String line = "";
        String responseBody = "";

        while ((line = bufferedReader.readLine()) != null) {
            responseBody += line;
        }

        log.info("responseBody = {}", responseBody);

        JsonParser jsonParser = new JsonParser();
        JsonElement jsonElement = jsonParser.parse(responseBody);

        accessToken = jsonElement.getAsJsonObject().get("access_token").getAsString();
        refreshToken = jsonElement.getAsJsonObject().get("refresh_token").getAsString();

        log.info("accessToken = {}", accessToken);
        log.info("refreshToken = {}", refreshToken);

        bufferedWriter.close();
        bufferedReader.close();

        return accessToken;
    }

    public Map<String, Object> getKakaoUserInfo(String code) throws Exception {
        Map<String, Object> kakaoUserInfo = new HashMap<String, Object>();
        String requestUrl = "https://kapi.kakao.com/v2/user/me";

        URL url = new URL(requestUrl);
        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
        httpURLConnection.setRequestMethod("GET");
        httpURLConnection.setRequestMethod("GET");

        // 요청에 필요한 header에 포함될 내용
        httpURLConnection.setRequestProperty("Authorization", "Bearer " + code);

        int responseCode = httpURLConnection.getResponseCode();

        log.info("responseCode = {}", responseCode);

        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream(), "UTF-8"));

        String line = "";
        String responseBody = "";

        while ((line = bufferedReader.readLine()) != null) {
            responseBody += line;
        }

        log.info("responseBody = {}", responseBody);

        JsonParser jsonParser = new JsonParser();
        JsonElement jsonElement = jsonParser.parse(responseBody);

        JsonObject properties = jsonElement.getAsJsonObject().get("properties").getAsJsonObject();
        JsonObject kakaoAccount = jsonElement.getAsJsonObject().get("kakao_account").getAsJsonObject();
        String id = jsonElement.getAsJsonObject().get("id").getAsString();
        String nickname = properties.getAsJsonObject().get("nickname").getAsString();

        kakaoUserInfo.put("id", id);
        kakaoUserInfo.put("nickname", nickname);

        return kakaoUserInfo;
    }
}
