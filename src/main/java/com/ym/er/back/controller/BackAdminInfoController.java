package com.ym.er.back.controller;

import com.github.pagehelper.PageHelper;
import com.ym.er.model.Result;
import com.ym.er.model.School;
import com.ym.er.service.BackProductService;
import com.ym.er.service.SchoolService;
import com.ym.er.service.UserService;
import com.ym.er.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by YM on 3/18/2017.
 *
 */
@Controller
@RequestMapping("/backend")
public class BackAdminInfoController {

    private BackProductService productService;
    private UserService userService;
    private SchoolService schoolService;

    @Autowired
    public BackAdminInfoController(BackProductService productService, UserService userService, SchoolService schoolService) {
        this.productService = productService;
        this.userService = userService;
        this.schoolService = schoolService;
    }

    @ModelAttribute
    public void info(Model model) {
        Result<Integer> resPast7 = productService.countAllIn7Day(StatusUtil.PAST);
        Result<Integer> resExist7 = productService.countAllIn7Day(StatusUtil.EXIST);
        Result<Integer> resPastAll = productService.countAllInAllTime(StatusUtil.PAST);
        Result<Integer> resExistAll = productService.countAllInAllTime(StatusUtil.EXIST);
        int user7 = userService.countAllIn7Day().getData();
        int userAll = userService.countAllInAllTime().getData();
        PageHelper.startPage(1,6);
        Result<List<School>> resSchool = schoolService.selectAllSchool();
        model.addAttribute("resPast7", resPast7.getData());
        model.addAttribute("resExist7", resExist7.getData());
        model.addAttribute("resPastAll", resPastAll.getData());
        model.addAttribute("resExistAll", resExistAll.getData());
        model.addAttribute("resSchool", resSchool.getData());
        model.addAttribute("user7", user7);
        model.addAttribute("userAll", userAll);
    }

    @GetMapping("/infoAdmin")
    public String index() {
        return "backend/info_admin";
    }

}
