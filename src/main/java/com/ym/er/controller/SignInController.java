package com.ym.er.controller;

import com.ym.er.model.Result;
import com.ym.er.model.School;
import com.ym.er.model.User;
import com.ym.er.service.SchoolService;
import com.ym.er.service.UserService;
import com.ym.er.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * Created by YM on 3/13/2017.
 * 登录/注册用
 */
@Controller
public class SignInController {
    private UserService userService;
    private SchoolService schoolService;

    @Autowired
    public SignInController(UserService userService, SchoolService schoolService) {
        this.userService = userService;
        this.schoolService = schoolService;
    }


    /**
     * 接收登录请求
     */
    @PostMapping(value = "/login")
    public ModelAndView login(@RequestParam("username") String userName, @RequestParam("password") String password,
                              HttpSession session,
                              HttpServletResponse response,
                              ModelAndView modelAndView) {
        Result<User> result = userService.login(userName, password);
        modelAndView.addObject("result", result);
        if (result.getStatus() == 200) {
            // 登陆成功, 重定向到首页
            loginSuccess(session, response, result.getData());
            modelAndView.setView(new RedirectView("user/index"));
        } else {
            modelAndView.addObject("msg", result.getMsg());
        }
        return modelAndView;
    }

    // 退出
    @GetMapping("/logout")
    public String logout(@SessionAttribute(StatusUtil.USERIDKEY) int userId, HttpSession session) {
        session.removeAttribute(StatusUtil.USERIDKEY);
        session.removeAttribute(StatusUtil.LOGINSTATUSKEY);
        return "redirect:/index";
    }

    // 注册
    @PostMapping(value = "/signin")
    public ModelAndView signIn(User user,
                               HttpSession session,
                               HttpServletResponse response,
                               ModelAndView modelAndView) {
        if (user.getName() == null && user.getName().equals("")) {
            modelAndView.addObject("msg", "请输入正确的用户名");
            return modelAndView;
        }
        if (user.getEmail() == null && user.getEmail().equals("")) {
            modelAndView.addObject("msg", "请输入正确的邮箱");
            return modelAndView;
        }
        Result<User> result = userService.signin(user);
        modelAndView.addObject("result", result);
        if (result.getStatus() == 200) {
            // login success
            loginSuccess(session, response, result.getData());
            modelAndView.setView(new RedirectView("user/index"));
        }
        return modelAndView;
    }

    /**
     * 登录成功,向session和cookie中放用户的信息
     */
    private void loginSuccess(HttpSession session, HttpServletResponse response, User user) {
        School school = schoolService.selectSchoolById(user.getSchoolId()).getData();
        session.setAttribute(StatusUtil.USERIDKEY, user.getUserId());
        session.setAttribute(StatusUtil.SCHOOLKEY, school);
        session.setAttribute(StatusUtil.SCHOOLIDKEY, user.getSchoolId());
        response.addCookie(new Cookie(StatusUtil.USERIDKEY, String.valueOf(user.getUserId())));
        response.addCookie(new Cookie(StatusUtil.SCHOOLIDKEY, String.valueOf(user.getSchoolId())));
        try {
            response.addCookie(new Cookie(StatusUtil.SCHOOLKEY, URLEncoder.encode(school.getSchoolName(), "UTF-8")));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        session.setAttribute(StatusUtil.LOGINSTATUSKEY, StatusUtil.LOGINSTATUSVALUE);
        session.setAttribute(StatusUtil.LOGINUSERKEY, user);
    }

}
