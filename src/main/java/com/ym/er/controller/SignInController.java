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
 *
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



    @PostMapping(value = "/login")
    public ModelAndView login(@RequestParam("username")String userName, @RequestParam("password")String password,
                              HttpSession session,
                              HttpServletResponse response,
                              ModelAndView modelAndView) {
        Result<User> result = userService.login(userName, password);
        modelAndView.addObject("result", result);
        if (result.getStatus() == 200) {
            // login success
            loginSuccess(session, response, result.getData());
            modelAndView.setView(new RedirectView("user/index"));
        }
        return modelAndView;
    }

    @GetMapping("/logout")
    public String logout(@SessionAttribute(StatusUtil.USERIDKEY) int userId, HttpSession session) {
        session.removeAttribute(StatusUtil.USERIDKEY);
        session.removeAttribute(StatusUtil.LOGINSTATUSKEY);
        return "redirect:/index";
    }

    @PostMapping(value = "/signin")
    public ModelAndView signIn(User user,
                               HttpSession session,
                               HttpServletResponse response,
                               ModelAndView modelAndView) {
        Result<User> result = userService.signin(user);
        modelAndView.addObject("result", result);
        if (result.getStatus() == 200) {
            // login success
            loginSuccess(session, response, result.getData());
            modelAndView.setView(new RedirectView("user/index"));
        }
        return modelAndView;
    }

    private void loginSuccess(HttpSession session, HttpServletResponse  response, User user) {
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
