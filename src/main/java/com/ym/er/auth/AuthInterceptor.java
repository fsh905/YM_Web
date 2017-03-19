package com.ym.er.auth;

import com.ym.er.util.StatusUtil;
import org.apache.log4j.Logger;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Created by YM on 3/8/2017.
 * 拦截请求, 只用于后台的权限认证
 */
public class AuthInterceptor implements HandlerInterceptor {

    private static Logger logger = Logger.getLogger(AuthInterceptor.class);

    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler) throws Exception {
        logger.debug("interceptor -----" + httpServletRequest.getRequestURI());
        if (handler.getClass().isAssignableFrom(HandlerMethod.class)) {
            HttpSession session = httpServletRequest.getSession(true);
            SchoolManagerAuthPassport schoolManagerAuthPassport = ((HandlerMethod)handler).getMethodAnnotation(SchoolManagerAuthPassport.class);
            SuperManagerAuthPassport superManagerAuthPassport = ((HandlerMethod)handler).getMethodAnnotation(SuperManagerAuthPassport.class);
            if (schoolManagerAuthPassport == null && superManagerAuthPassport == null) {
                return true;
            }
            int roleID = 4;
            Object o = session.getAttribute(StatusUtil.BACKENDROLE);
            if (o == null) {
                // 没有登录，跳转到登录界面
                logger.debug("not login,");
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/backend/login");
                return false;
            }
            roleID = (int)o;
            if (schoolManagerAuthPassport != null) {
                // 已经添加了注解，判断用户类型是否为校园管理员
                if (roleID > StatusUtil.MANAGER) {
                    logger.debug("not school manager, need login");
                    httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/backend/login");
                    return false;
                } else {
                    //符合条件则跳转
                    return true;
                }
            }
            if (superManagerAuthPassport != null) {
                // 是否为超级管理员
                if (roleID != StatusUtil.ADMIN) {
                    logger.debug("not admin, need login");
                    httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/backend/login");
                    return false;
                } else {
                    //符合条件则跳转
                    return true;
                }
            }
        }
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
