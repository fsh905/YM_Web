package com.ym.er.back.controller;

import com.ym.er.model.Result;
import com.ym.er.model.SuperUser;
import com.ym.er.service.SuperUserService;
import com.ym.er.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by YM on 3/17/2017.
 * 后台登录
 */
@Controller
@RequestMapping("/backend")
public class BackLoginController {

    private SuperUserService superUserService;

    @Autowired
    public BackLoginController(SuperUserService superUserService) {
        this.superUserService = superUserService;
    }

    @GetMapping("/login")
    public String loginPage() {
        return "backend/login";
    }

    @RequestMapping("/login")
    public String login(
            @RequestParam("userName") String userName,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {
        // 把用户信息放到session中
        Result<SuperUser> superUserResult = superUserService.login(userName, password);
        if (superUserResult.getStatus() == 200) {
            SuperUser superUser = superUserResult.getData();
            session.setAttribute(StatusUtil.LOGINSUPERUSERKEY, superUser);
            session.setAttribute(StatusUtil.SUPERUSERIDKEY, superUser.getUserId());
            return "redirect:main";
        } else {
            model.addAttribute("msg", "登录失败，请检查你的用户名密码");
            return "backend/login";
        }

    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // 清除session
        session.removeAttribute(StatusUtil.SUPERUSERIDKEY);
        session.removeAttribute(StatusUtil.LOGINSUPERUSERKEY);
        return "redirect:/backend/login";
    }

}
