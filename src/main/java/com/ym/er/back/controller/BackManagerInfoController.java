package com.ym.er.back.controller;

import com.ym.er.model.Result;
import com.ym.er.service.BackProductService;
import com.ym.er.service.UserService;
import com.ym.er.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 * Created by YM on 3/18/2017.
 *
 */
@Controller
@RequestMapping("/backend")
public class BackManagerInfoController {

    private BackProductService productService;
    private UserService userService;

    @Autowired
    public BackManagerInfoController(BackProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    @ModelAttribute
    public void info(Model model, @SessionAttribute(StatusUtil.SCHOOLIDKEY) Integer schoolId) {
        Result<Integer> resPast7 = productService.countBySchoolIn7Day(schoolId, StatusUtil.PAST);
        Result<Integer> resExist7 = productService.countBySchoolIn7Day(schoolId, StatusUtil.EXIST);
        Result<Integer> resPastAll = productService.countBySchoolInAllTime(schoolId, StatusUtil.PAST);
        Result<Integer> resExistAll = productService.countBySchoolInAllTime(schoolId, StatusUtil.EXIST);
        int user7 = userService.countBySchoolIn7Day(schoolId).getData();
        int userAll = userService.countBySchoolInAllTime(schoolId).getData();
        model.addAttribute("resPast7", resPast7.getData());
        model.addAttribute("resExist7", resExist7.getData());
        model.addAttribute("resPastAll", resPastAll.getData());
        model.addAttribute("resExistAll", resExistAll.getData());
        model.addAttribute("user7", user7);
        model.addAttribute("userAll", userAll);
    }

    @GetMapping("/infoManager")
    public String index() {
        return "backend/info_manager";
    }




}
