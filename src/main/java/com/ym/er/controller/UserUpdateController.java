package com.ym.er.controller;

import com.ym.er.model.Result;
import com.ym.er.model.School;
import com.ym.er.model.User;
import com.ym.er.service.MessageService;
import com.ym.er.service.SchoolService;
import com.ym.er.service.UserService;
import com.ym.er.util.FileUtil;
import com.ym.er.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

/**
 * Created by YM on 3/9/2017.
 * 普通用户基本信息
 */
@Controller
@RequestMapping("/user")
public class UserUpdateController {

    private UserService userService;
    private SchoolService schoolService;
    private MessageService messageService;

    @Autowired
    public UserUpdateController(UserService userService, SchoolService schoolService, MessageService messageService) {
        this.userService = userService;
        this.schoolService = schoolService;
        this.messageService = messageService;
    }

    /**
     * 登陆后用户信息已经在session中存放，这里不用再次读取
     */
//    @ModelAttribute
//    public void getUser(@SessionAttribute(StatusUtil.USERIDKEY)int userId, Model model) {
//        model.addAttribute("user",userService.selectUserById(userId).getData());
//    }

    @GetMapping("/index")
    public String userIndex(@SessionAttribute(StatusUtil.USERIDKEY) int userId, Model model) {
        Result<Integer> unreadMessageCountRes = messageService.countUnreadMessage(userId);
        if (unreadMessageCountRes.getStatus() == 200) {
            model.addAttribute("messageCount", unreadMessageCountRes.getData());
        } else {
            model.addAttribute("messageCount", 0);
        }
        return ("user/index");
    }

    @GetMapping("/favor")
    public String userFavor() {
       return "user/favorList";
    }

    @GetMapping("/messages")
    public String getMessages() {
        return "user/messages";
    }

    /**
     * session中已经存放有school
     */
    @RequestMapping("/info")
    public String getUserInfo() {
        return "user/info";
    }

}
