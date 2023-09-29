package com.accountbook.project.api.kakao;

import com.accountbook.project.SessionConst;
import com.accountbook.project.member.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
public class KakaoController {
    private final KakaoService kakaoService;
    private final LoginService loginService;

    @RequestMapping("/kakao-login")
    public String kakaoLogin(@RequestParam(name = "code", required = false) String code, Map<String, Object> map, HttpServletRequest request) throws Exception {
        if (code != null) {
            String accessToken = kakaoService.getAccessToken(code);
            Map<String, Object> user = kakaoService.getKakaoUserInfo(accessToken);
            long id_ = Long.parseLong((String)user.get("id"));
            long id = kakaoService.getKakaoId(id_);

            if (id == 0) {
                map.put("m_kakao_id", user.get("id"));
                map.put("m_name", user.get("nickname"));
                kakaoService.insertKakaoId(map);
            }

            int m_id = (int)kakaoService.getId(id);
            HttpSession session = request.getSession();
            session.setAttribute(SessionConst.MEMBER_ID, m_id);
            loginService.updateVisitNum(m_id);
        }
        return "redirect:/";
    }
}