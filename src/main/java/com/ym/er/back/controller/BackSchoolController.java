package com.ym.er.back.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ym.er.model.Result;
import com.ym.er.model.School;
import com.ym.er.model.SuperUser;
import com.ym.er.service.SchoolService;
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
 * 学校管理
 */
@Controller
@RequestMapping("/backend")
public class BackSchoolController {

    private SchoolService schoolService;
    private SuperUserService superUserService;

    @Autowired
    public BackSchoolController(SchoolService schoolService, SuperUserService superUserService) {
        this.schoolService = schoolService;
        this.superUserService = superUserService;
    }

    @RequestMapping("/schools")
    public ModelAndView selectSchool(@RequestParam(value = "page", required = false) Integer page,
                                     @RequestParam(value = "keyword", required = false) String keyword,
                                     ModelAndView modelAndView) {
        if (page == null) {
            page = 1;
        }
        PageInfo pageInfo = null;
        Result<List<School>> schools = null;
        PageHelper.startPage(page, 10);
        if (keyword != null) {
            schools = schoolService.selectSchoolByKeyword(keyword);
        } else {
            schools = schoolService.selectAllSchool();
        }
        if (schools.getStatus() == 200) {
            pageInfo = new PageInfo(schools.getData());
        } else {
            pageInfo = new PageInfo();
        }
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("backend/schools");
        return modelAndView;
    }

    @GetMapping("/schools/add")
    public String addSchool() {
        return "backend/add_school";
    }

    @PostMapping("/schools/add")
    public String updateSchoolName(@RequestParam("schoolName") String schoolName, Model model) {
        School school = new School();
        school.setSchoolName(schoolName);
        Result result = schoolService.insertSchool(school);
        Map<String,String> info = new HashMap<>();
        info.put("href", "/backend/schools");
        info.put("name", "跳转学校列表");
        result.setData(info);
        model.addAttribute("result",result);
        return "backend/result";
    }

    @GetMapping("/schools/{schoolId}/manager")
    public ModelAndView schoolManager(@PathVariable Integer schoolId,
                                      @RequestParam(value = "page", required = false) Integer page,
                                      ModelAndView modelAndView) {
        if (page == null) {
            page = 1;
        }
        PageHelper.startPage(page, 10);
        Result<List<SuperUser>> listResult = superUserService.selectUserBySchoolId(schoolId);
        PageInfo pageInfo = null;
        if (listResult.getStatus() == 200) {
            pageInfo = new PageInfo(listResult.getData());
        } else {
            pageInfo = new PageInfo();
        }
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("schoolId", schoolId);
        modelAndView.setViewName("backend/managers");
        return modelAndView;
    }

    @GetMapping("/schools/{schoolId}/manager/add")
    public String addManagerPage(@PathVariable Integer schoolId, Model model) {
        Result<School> schoolResult = schoolService.selectSchoolById(schoolId);
        model.addAttribute("school", schoolResult.getData());
        return "backend/add_manager";
    }

    @GetMapping("/schools/{schoolId}/update")
    public String updateSchoolName(@PathVariable Integer schoolId, Model model) {
        Result<School> schoolResult = schoolService.selectSchoolById(schoolId);
        model.addAttribute("method", "update");
        model.addAttribute("school", schoolResult.getData());
        return "backend/add_school";
    }

    @PostMapping("/schools/{schoolId}/update")
    public String updateSchoolName(@PathVariable Integer schoolId,@RequestParam("schoolName") String schoolName, Model model) {
        School school = new School();
        school.setSchoolId(schoolId);
        school.setSchoolName(schoolName);
        Result result = schoolService.updateSchool(school);
        Map<String,String> info = new HashMap<>();
        info.put("href", "/backend/schools");
        info.put("name", "跳转学校列表");
        result.setData(info);
        model.addAttribute("result",result);
        return "backend/result";
    }


    @GetMapping("/schools/{schoolId}/manager/{userId}/delete")
    public String deleteManager(@PathVariable("userId") Integer userId,
                             @PathVariable("schoolId") Integer schoolId,
                             Model model) {
        Result result = superUserService.deleteSuperUser(userId);
        Map<String,String> info = new HashMap<>();
        info.put("href", "/backend/schools/"+schoolId+"/manager");
        info.put("name", "跳转到管理员列表");
        result.setData(info);
        model.addAttribute("result",result);
        return "backend/result";
    }

    @PostMapping("/schools/{schoolId}/manager/add")
    public String addManager(@PathVariable Integer schoolId,@RequestParam("userId")Integer userId,
                             Model model) {
        Result result = superUserService.insertManagerUser(userId);
        Map<String,String> info = new HashMap<>();
        info.put("href", "/backend/schools/"+schoolId+"/manager");
        info.put("name", "跳转到管理员列表");
        result.setData(info);
        model.addAttribute("result",result);
        return "backend/result";
    }



}
