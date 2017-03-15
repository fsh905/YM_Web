package com.ym.er.controller;

import com.ym.er.model.Result;
import com.ym.er.model.School;
import com.ym.er.model.User;
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

    @Autowired
    UserUpdateController(UserService userService, SchoolService schoolService) {
        this.userService = userService;
        this.schoolService = schoolService;
    }


    @ModelAttribute
    public void getUser(@SessionAttribute(StatusUtil.USERIDKEY)int userId, Model model) {
//        System.out.println("---session---->"+userId);
        model.addAttribute("user",userService.selectUserById(userId).getData());
    }

    // TODO: 3/10/2017 这里包含了闲置信息，暂时不完善
    @GetMapping("/index")
    public ModelAndView userIndex(ModelAndView modelAndView) {

        modelAndView.setViewName("user/index");
        return modelAndView;
    }

    @GetMapping("/favor")
    public ModelAndView userFavor(ModelAndView modelAndView) {

        modelAndView.setViewName("user/favorList");
        return modelAndView;
    }

    @GetMapping("/messages")
    public String getMessages() {
        return "user/messages";
    }


    @RequestMapping("/info")
    public ModelAndView getUserInfo(ModelAndView modelAndView, @ModelAttribute("user")User user) {
        Result<School> schoolResult = schoolService.selectSchoolById(user.getSchoolId());
        Optional.ofNullable(schoolResult.getData())
                .ifPresent(school -> modelAndView.addObject("schoolName", school.getSchoolName()));
        modelAndView.setViewName("user/info");
        return modelAndView;
    }

}
