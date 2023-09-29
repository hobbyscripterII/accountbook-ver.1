package com.accountbook.project.api.google;

import com.accountbook.project.SessionConst;
import com.accountbook.project.member.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
public class GoogleController {
    private final GoogleService googleService;
    private final LoginService loginService;

    @RequestMapping("/google-login")
    public String googleLogin(@RequestParam(name = "code", required = false) String code, Map<String, Object> map, HttpServletRequest request) throws Exception {
        if (code != null) {
            String accessToken = googleService.getAccessToken(code);
            Map<String, Object> user = googleService.getGoogleUserInfo(accessToken);
            String googleId_ = (String) user.get("id");
            String googleId = googleService.getGoogleId(googleId_);

            if (googleId == null) {
                map.put("m_google_id", user.get("id"));
                map.put("m_name", user.get("name"));
                googleService.insertGoogleId(map);
            }

            int m_id = googleService.getId(googleId);
            HttpSession session = request.getSession();
            session.setAttribute(SessionConst.MEMBER_ID, m_id);
            loginService.updateVisitNum(m_id);
        }
        return "redirect:/";
    }
}
