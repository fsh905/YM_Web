package com.ym.er.back.controller;

import com.ym.er.util.StatusUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 * Created by YM on 3/18/2017.
 */
@Controller
@RequestMapping("/backend")
public class BackIndexController {

    @RequestMapping("/index")
    public String index(@SessionAttribute(StatusUtil.BACKENDROLE) int role) {
        if (role == StatusUtil.ADMIN) {
            return "redirect:/backend/infoAdmin";
        }
        return "redirect:/backend/infoManager";
    }

}
