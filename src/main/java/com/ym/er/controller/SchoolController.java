package com.ym.er.controller;

import com.ym.er.model.Result;
import com.ym.er.model.School;
import com.ym.er.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by YM on 3/10/2017.
 * 学校
 */
@Controller
@RequestMapping("/school")
public class SchoolController {

    @Autowired
    private SchoolService schoolService;

    @RequestMapping("/all")
    @ResponseBody
    public Result<List<School>> getAllSchool() {
        return schoolService.selectAllSchool();
    }

    @RequestMapping("/{id}")
    @ResponseBody
    public Result<School> getSchool(@PathVariable("id")int id) {
        return schoolService.selectSchoolById(id);
    }

    @RequestMapping("/add")
    @ResponseBody
    public Result<School> addSchool(@RequestParam("name")String name) {
        School school = new School();
        school.setSchoolName(name);
        return schoolService.insertSchool(school);
    }
    @RequestMapping("/delete/{id}")
    @ResponseBody
    public Result deleteSchool(@PathVariable("id")int id) {
        return schoolService.deleteSchool(id);
    }



}
