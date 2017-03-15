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

import javax.servlet.http.HttpSession;
import java.util.Optional;

/**
 * Created by YM on 3/9/2017.
 * 普通用户基本信息
 */
@Controller
@RequestMapping("/user")
public class UserShowController {

    @Autowired
    UserShowController(UserService userService) {
        this.userService = userService;
    }

    private UserService userService;

    /**
     * 查看别人的信息
     */
    @RequestMapping("/info/{id}")
    public ModelAndView getOtherUserInfo(@PathVariable("id")int id, ModelAndView modelAndView, HttpSession session) {
        modelAndView.addObject("result", userService.selectUserById(id));
        if (session.getAttribute(StatusUtil.LOGINSTATUSKEY) != null) {
            int userId = (int) session.getAttribute(StatusUtil.USERIDKEY);
            if (userId != id) {
                modelAndView.addObject("isSelf", "NO");
            }
        } else {
            modelAndView.addObject("isSelf", "NO");
        }
        modelAndView.setViewName("user/index");
        return modelAndView;
    }

    @PostMapping(value = "/update")
    public ModelAndView updateUserInfo(@SessionAttribute(StatusUtil.USERIDKEY)int userId, User user, ModelAndView modelAndView) {
        user.setUserId(userId);
        Result result = userService.update(user);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("result");
        return modelAndView;
    }

    @PostMapping(value = "/update/photo")
    @ResponseBody
    public Result updateUserPhoto(@SessionAttribute(StatusUtil.USERIDKEY)int userId, @RequestParam("photo")MultipartFile file) {
        Result<String> saveImgResult = FileUtil.saveSingleImg(file);
        User user = new User();
        if (saveImgResult.getStatus() == 200) {
            user.setPhoto(saveImgResult.getData());
        }
        user.setUserId(userId);
        return userService.update(user);
    }

    @PostMapping(value = "/update/password")
    public ModelAndView updateUserPassword(@SessionAttribute(StatusUtil.USERIDKEY)int userId, @RequestParam("password")String password,
                                           ModelAndView modelAndView) {
        User user = new User();
        user.setUserId(userId);
        user.setPassword(password);
        Result result = userService.updatePassword(user);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("result");
        return modelAndView;
    }

}
