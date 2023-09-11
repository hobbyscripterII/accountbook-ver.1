package com.accountbook.project.interceptor;

import com.accountbook.project.SessionConst;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Slf4j
@Component
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        log.info("인증 체크 인터셉터 실행 = {}", url);
        HttpSession session = request.getSession();
        if(session == null || session.getAttribute(SessionConst.MEMBER_ID) == null) {
            log.info("미인증 사용자 요청");
            response.sendRedirect("/login?redirectURL=" + url);
            return false;
        }
        return true;
    }
}
