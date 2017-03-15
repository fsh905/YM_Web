package com.ym.er.controller;

import com.ym.er.model.Result;
import com.ym.er.model.School;
import com.ym.er.model.User;
import com.ym.er.service.SchoolService;
import com.ym.er.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by YM on 3/9/2017.
 * 学校
 */
@Controller
public class LoginController {

    private SchoolService schoolService;

    @Autowired
    public LoginController(SchoolService schoolService) {
        this.schoolService = schoolService;
    }

    @ModelAttribute
    public void addSchoolList(Model model) {
        Result<List<School>> listResult = schoolService.selectAllSchool();
        model.addAttribute("schools", listResult.getData());
    }



    @GetMapping(value = "/login")
    public String login() {
        return "/login";
    }




    @GetMapping(value = "/signin")
    public String signIn() {
        return "/login";
    }



}
