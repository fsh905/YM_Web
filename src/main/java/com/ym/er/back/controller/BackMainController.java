package com.ym.er.back.controller;

import com.ym.er.model.SuperUser;
import com.ym.er.util.StatusUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 * Created by YM on 3/17/2017.
 * 用于根据用户角色显示不同的界面
 */
@Controller
@RequestMapping("/backend")
public class BackMainController {

    @GetMapping("main")
    public String mainPage() {
        return "backend/main";
    }

    @GetMapping("left")
    public String leftPage(@SessionAttribute(StatusUtil.LOGINSUPERUSERKEY)SuperUser superUser, Model model) {
        model.addAttribute("superUser", superUser);
        return "backend/left";
    }

    @GetMapping("/top")
    public String topPage(@SessionAttribute(StatusUtil.LOGINSUPERUSERKEY)SuperUser superUser, Model model) {
        model.addAttribute("superUser", superUser);
        return "backend/top";
    }


}
