package com.ym.er.controller;

import com.ym.er.model.Result;
import com.ym.er.model.User;
import com.ym.er.service.UserService;
import com.ym.er.util.FileUtil;
import com.ym.er.util.MailUtils;
import com.ym.er.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

/**
 * Created by YM on 3/9/2017.
 * 普通用户基本信息
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserController(UserService userService) {
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
            } else {
                modelAndView.addObject("isSelf", "YES");
            }
        } else {
            modelAndView.addObject("isSelf", "NO");
        }
        modelAndView.setViewName("user/index");
        return modelAndView;
    }

    /**
     * 更新用户信息
     */
    @PostMapping(value = "/update")
    public ModelAndView updateUserInfo(@SessionAttribute(StatusUtil.USERIDKEY)int userId, User user, ModelAndView modelAndView, HttpSession session) {
        user.setUserId(userId);
        // 更新session中的用户对象
        Result result = userService.update(user);
        modelAndView.addObject("result", result);
        if (result.getStatus() == 200) {
            // 更新session中的用户信息
            // 更新头像,生日
            User oldUser = (User) session.getAttribute(StatusUtil.LOGINUSERKEY);
            user.setPhoto(oldUser.getPhoto());
            user.setBirthday(oldUser.getBirthday());
            user.setSchoolId(oldUser.getSchoolId());
            user.setRegistTime(oldUser.getRegistTime());
            session.setAttribute(StatusUtil.LOGINUSERKEY, user);
        }
        result.setData("/user/info");
        modelAndView.setViewName("result");
        return modelAndView;
    }

    /**
     * 更新照片
     */
    @PostMapping(value = "/update/photo")
    @ResponseBody
    public Result updateUserPhoto(@SessionAttribute(StatusUtil.USERIDKEY)int userId, @RequestParam("photo")MultipartFile file,
                                  HttpSession session) {
        Result<String> saveImgResult = FileUtil.saveSingleImg(file);
        User user = new User();
        if (saveImgResult.getStatus() == 200) {
            user.setPhoto(saveImgResult.getData());
        }
        user.setUserId(userId);
        Result result = userService.update(user);
        if (result.getStatus() == 200) {
            User user1 = (User) session.getAttribute(StatusUtil.LOGINUSERKEY);
            user1.setPhoto(saveImgResult.getData());
        }
        return result;
    }

    /**
     * 更新密码
     */
    @PostMapping(value = "/update/password")
    public ModelAndView updateUserPassword(@SessionAttribute(StatusUtil.USERIDKEY)int userId,
                                           @RequestParam("password")String password,
                                           HttpSession session,
                                           ModelAndView modelAndView) {
        if (session.getAttribute(StatusUtil.CHECKCODESUCCESS) == null) {
            modelAndView.addObject("status",400);
            modelAndView.addObject("msg","禁止访问");
            modelAndView.setViewName("error");
        } else {
            User user = new User();
            user.setUserId(userId);
            user.setPassword(password);
            Result result = userService.updatePassword(user);
            modelAndView.addObject("result", result);
            modelAndView.setViewName("result");
        }
        return modelAndView;
    }

    @PostMapping("/sendCheckEmail")
    @ResponseBody
    public Result sendCheckEmail(@SessionAttribute(StatusUtil.LOGINUSERKEY)User user, HttpSession session) {
        int code = (int)(Math.random() * 1000000);
        try {
            MailUtils.sendEmail(user.getName(), code, user.getEmail(), "修改密码");
            // 发送成功
            session.setAttribute(StatusUtil.CHECKCODE, code);
            return Result.build(200, "发送成功");
        } catch (MessagingException e) {
            e.printStackTrace();
            return Result.build(400, "发送失败");
        }
    }

    @PostMapping("/check")
    @ResponseBody
    public Result checkCode(@RequestParam("code")int code, HttpSession session) {
        if (session.getAttribute(StatusUtil.CHECKCODE) != null) {
            int c = (int) session.getAttribute(StatusUtil.CHECKCODE);
            if (code == c) {
                session.removeAttribute(StatusUtil.CHECKCODE);
                session.setAttribute(StatusUtil.CHECKCODESUCCESS, 200);
                return Result.build(200, "验证成功");
            } else {
                return Result.build(400, "验证码错误");
            }
        } else {
            return Result.build(400, "错误参数");
        }
    }

    /**
     * 判断数据库中是否已经存在
     */
    @PostMapping("/{method}/check")
    @ResponseBody
    public Result checkNameIsDuplicate(@PathVariable("method") String method, @RequestParam("name") String name) {
        switch (method) {
            case "name" : return userService.checkNameIsDuplicate(name);
            case "phone" : return userService.checkPhoneIsDuplicate(name);
            case "email" : return userService.checkEmailIsDuplicate(name);
            default: return Result.build(400, "错误参数");
        }
    }

}
