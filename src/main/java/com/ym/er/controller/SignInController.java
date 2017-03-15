package com.ym.er.controller;

import com.ym.er.model.Result;
import com.ym.er.model.User;
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

/**
 * Created by YM on 3/13/2017.
 *
 */
@Controller
public class SignInController {
    private UserService userService;

    @Autowired
    public SignInController(UserService userService) {
        this.userService = userService;
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
            loginSuccess(session, response, result.getData().getUserId());
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
            loginSuccess(session, response, result.getData().getUserId());
            modelAndView.setView(new RedirectView("user/index"));
        }
        return modelAndView;
    }

    private void loginSuccess(HttpSession session, HttpServletResponse  response, int userId) {
        session.setAttribute(StatusUtil.USERIDKEY, userId);
        response.addCookie(new Cookie(StatusUtil.USERIDKEY, String.valueOf(userId)));
        session.setAttribute(StatusUtil.LOGINSTATUSKEY, StatusUtil.LOGINSTATUSVALUE);
    }

}
