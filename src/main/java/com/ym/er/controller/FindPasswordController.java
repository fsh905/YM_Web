package com.ym.er.controller;

import com.ym.er.model.Result;
import com.ym.er.model.User;
import com.ym.er.service.UserService;
import com.ym.er.util.MailUtils;
import com.ym.er.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import static com.ym.er.util.StatusUtil.CHECKCODE;

/**
 * Created by feng_sh on 3/29/2017.
 * 找回密码专用
 * 其他步骤使用UserController中
 */
@Controller
@RequestMapping("/findPassword")
public class FindPasswordController {

    private UserService userService;

    @Autowired
    public FindPasswordController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public String index() {
        return "updatePassword";
    }

    @PostMapping("/sendCheckEmail")
    @ResponseBody
    public Result sendCheck(@RequestParam("email")String email, HttpSession session) {
        Result<User> ru = userService.selectUserIdByEmail(email);
        if (ru.getStatus() == 400) return ru;
        User u = ru.getData();
        session.setAttribute(StatusUtil.USERIDKEY, u.getUserId());
        // send email
        int code = (int) (Math.random() * 1000000);
        try {
            MailUtils.sendEmail(u.getName(), code, email, "找回密码");
            session.setAttribute(CHECKCODE, code);
        } catch (MessagingException e) {
            ru = Result.build(400, "发送邮件失败,请稍后重试");
            e.printStackTrace();
        }
        return ru;
    }

}
