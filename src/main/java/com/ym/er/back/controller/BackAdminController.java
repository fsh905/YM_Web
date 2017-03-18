package com.ym.er.back.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ym.er.model.Result;
import com.ym.er.model.SuperUser;
import com.ym.er.service.SuperUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by YM on 3/18/2017.
 * 管理员操作
 */
@Controller
@RequestMapping("/backend")
public class BackAdminController {

    private SuperUserService superUserService;

    @Autowired
    public BackAdminController(SuperUserService superUserService) {
        this.superUserService = superUserService;
    }

    @GetMapping("/admins")
    public ModelAndView getAdmins(@RequestParam(value = "page", required = false) Integer page, ModelAndView modelAndView) {
        if (page == null) {
            page = 1;
        }
        PageInfo pageInfo = null;
        PageHelper.startPage(page, 10);
        Result<List<SuperUser>> result = superUserService.selectAdminUser();
        if (result.getStatus() == 200) {
            pageInfo = new PageInfo(result.getData());
        } else {
            pageInfo = new PageInfo();
        }
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("backend/admins");
        return modelAndView;
    }

    @GetMapping("/admins/{userId}/delete")
    public String deleteAdmins(@PathVariable Integer userId, Model model) {
        Result result = superUserService.deleteSuperUser(userId);
        Map<String,String> info = new HashMap<>();
        info.put("href", "/backend/admins");
        info.put("name", "跳转管理员列表");
        result.setData(info);
        model.addAttribute("result",result);
        return "backend/result";
    }

    @GetMapping("/admins/add")
    public String addAdmins(Model model) {
        model.addAttribute("method", "addAdmins");
        return "backend/add_manager";
    }

    @PostMapping("/admins/add")
    public String addAdmins(@RequestParam("userId") Integer userId, Model model) {
        Result result = superUserService.insertAdminUser(userId);
        Map<String,String> info = new HashMap<>();
        info.put("href", "/backend/admins");
        info.put("name", "跳转管理员列表");
        result.setData(info);
        model.addAttribute("result",result);
        return "backend/result";
    }
}
