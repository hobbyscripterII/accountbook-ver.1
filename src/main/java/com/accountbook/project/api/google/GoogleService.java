package com.accountbook.project.api.google;

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
public class GoogleService {
    private final GoogleMapper googleMapper;

    @Value("${google.grant_type}")
    private String grant_type;
    @Value("${google.client_id}")
    private String client_id;
    @Value("${google.redirect_uri}")
    private String redirect_uri;
    @Value("${google.client_secret}")
    private String client_secret;

    public int getId(String id) {
        return googleMapper.getId(id);
    }

    public String getGoogleId(String id) {
        return googleMapper.getGoogleId(id);
    }

    public void insertGoogleId(Map<String, Object> map) {
        googleMapper.insertGoogleId(map);
    }


    public String getAccessToken(String code) throws Exception {
        String accessToken = "";
        String requestUrl = "https://oauth2.googleapis.com/token";

        URL url = new URL(requestUrl);
        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setDoOutput(true); // default true

        BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(httpURLConnection.getOutputStream()));
        StringBuilder stringBuffer = new StringBuilder();
        stringBuffer.append("grant_type=" + grant_type);
        stringBuffer.append("&client_id=" + client_id);
        stringBuffer.append("&redirect_uri=" + redirect_uri);
        stringBuffer.append("&code=" + code);
        stringBuffer.append("&client_secret=" + client_secret);
        bufferedWriter.write(stringBuffer.toString());
        bufferedWriter.flush();

        int responseCode = httpURLConnection.getResponseCode();

        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream(), "UTF-8"));
        String line = "";
        String responseBody = "";

        while ((line = bufferedReader.readLine()) != null) {
            responseBody += line;
        }

        JsonParser jsonParser = new JsonParser();
        JsonElement jsonElement = jsonParser.parse(responseBody);

        accessToken = jsonElement.getAsJsonObject().get("access_token").getAsString();

        bufferedWriter.close();
        bufferedReader.close();

        return accessToken;
    }

    public Map<String, Object> getGoogleUserInfo(String code) throws Exception {
        Map<String, Object> googleUserInfo = new HashMap<String, Object>();
        String requestUrl = "https://www.googleapis.com/oauth2/v1/userinfo";

        URL url = new URL(requestUrl);
        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
        httpURLConnection.setRequestMethod("GET");
        httpURLConnection.setRequestMethod("GET");

        // 요청에 필요한 header에 포함될 내용
        httpURLConnection.setRequestProperty("Authorization", "Bearer " + code);

        int responseCode = httpURLConnection.getResponseCode();

        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream(), "UTF-8"));

        String line = "";
        String responseBody = "";

        while ((line = bufferedReader.readLine()) != null) {
            responseBody += line;
        }

        JsonParser jsonParser = new JsonParser();
        JsonElement jsonElement = jsonParser.parse(responseBody);

        String id = jsonElement.getAsJsonObject().get("id").getAsString();
        String name = jsonElement.getAsJsonObject().get("name").getAsString();

        googleUserInfo.put("id", id);
        googleUserInfo.put("name", name);

        return googleUserInfo;
    }
}