package com.accountbook.project.interceptor;

import com.accountbook.project.SessionConst;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.Inet4Address;

@Slf4j
public class LogInterceptor implements HandlerInterceptor {
    public static final String IP = "USER_IP";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        String ip = Inet4Address.getLocalHost().getHostAddress();
        request.setAttribute(IP, ip);
        log.info("REQUEST [{}][{}]", ip, url);

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute(SessionConst.MEMBER_ID) == null) {
            log.info("미인증 사용자 요청 [{}][{}]", ip, url);
            response.sendRedirect("/accountbook/login");
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        log.info("POSTHANDLE [{}]", modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        String url = request.getRequestURI();
        String ip = (String)request.getAttribute(IP);
        log.info("RESPONSE [{}][{}]", ip, url);

        if(ex != null)
            log.error("AFTERCOMPLETION ERROR", ex);
    }
}
