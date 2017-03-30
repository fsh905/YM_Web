package com.ym.er.service.impl;

import com.ym.er.mapper.UserMapper;
import com.ym.er.model.Result;
import com.ym.er.model.User;
import com.ym.er.model.UserExample;
import com.ym.er.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by YM on 3/8/2017.
 * 用户信息service
 */
@Service
public class UserServiceImpl implements UserService{

    /**
     * 验证是否重复
     */
    private enum CheckMethod {
        NAME,
        PHONE,
        EMAIL;
    }

    @Autowired
    private UserMapper userMapper;

    public Result<User> login(String name, String password) {
        User user = new User();
        user.setName(name);
        user.setPassword(password);
        User data = userMapper.login(user);
//        System.out.println("------bir---->"+ data.getBirthday().toString());
        return data == null ? Result.build(400, "登录失败,你的用户名或者密码错误") : Result.build(200, "登陆成功", data);

    }

    @Transactional
    public Result<User> signin(User user) {
        user.setGrade(1);
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        user.setRegistTime(date);
        int res = userMapper.insertSelective(user);
        return res == 1 ? Result.build(200, "注册成功", user) : Result.build(400, "注册失败");
    }

    @Transactional
    public Result update(User user) {
        int res = userMapper.updateByPrimaryKeySelective(user);
        return res == 1 ? Result.build(200, "修改成功") : Result.build(400, "修改失败");
    }

    @Transactional
    public Result updatePassword(User user) {
        int res = userMapper.updatePassword(user);
        return res == 1 ? Result.build(200, "更改成功") : Result.build(400, "更改失败");
    }

    @Override
    public Result checkNameIsDuplicate(String name) {
        return checkMethodIsDuplicate(CheckMethod.NAME, name);
    }

    @Override
    public Result checkEmailIsDuplicate(String email) {
        return checkMethodIsDuplicate(CheckMethod.EMAIL, email);
    }

    @Override
    public Result checkPhoneIsDuplicate(String phone) {
        return checkMethodIsDuplicate(CheckMethod.PHONE, phone);
    }

    private Result checkMethodIsDuplicate(CheckMethod method, String value) {
        UserExample example = new UserExample();
        switch (method) {
            case NAME: example.createCriteria().andNameEqualTo(value);
            break;
            case EMAIL: example.createCriteria().andEmailEqualTo(value);
            break;
            case PHONE: example.createCriteria().andPhoneEqualTo(value);
            break;
            default:
        }
        int count = userMapper.countByExample(example);
        return count == 0 ? Result.build(200, "可以使用") : Result.build(400, "已被注册");
    }

    @Override
    public Result<User> selectUserIdByEmail(String email) {
        UserExample example = new UserExample();
        example.createCriteria().andEmailEqualTo(email);
        List<User> lu = userMapper.selectByExample(example);
        if (lu == null || lu.size() == 0) {
            return Result.build(400, "此邮箱未注册");
        }
        User user = lu.get(0);
        return Result.build(200, "获取成功", user);
    }

    //    @Transactional
    public Result<User> selectUserById(int id) {
        User user = userMapper.selectByPrimaryKey(id);
        return Result.build(200, "获取成功", user);
    }

    @Override
    public Result<Integer> countBySchoolIn7Day(Integer schoolId) {
        int res = userMapper.countBySchoolIdInRecent7Day(schoolId);
        return Result.build(200, "查询成功", res);
    }

    @Override
    public Result<Integer> countBySchoolInAllTime(Integer schoolId) {
        int res = userMapper.countBySchoolIdAllTime(schoolId);
        return Result.build(200, "查询成功", res);
    }

    @Override
    public Result<Integer> countAllIn7Day() {
        int res = userMapper.countInRecent7Day();
        return Result.build(200, "查询成功", res);

    }

    @Override
    public Result<Integer> countAllInAllTime() {
        int res = userMapper.countAllTime();
        return Result.build(200, "查询成功", res);
    }

}
