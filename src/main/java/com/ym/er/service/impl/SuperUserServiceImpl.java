package com.ym.er.service.impl;

import com.ym.er.mapper.SuperUserMapper;
import com.ym.er.mapper.UserMapper;
import com.ym.er.model.*;
import com.ym.er.service.SuperUserService;
import com.ym.er.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by YM on 3/17/2017.
 * 超级管理员
 */
@Service
public class SuperUserServiceImpl implements SuperUserService {

    private SuperUserMapper superUserMapper;
    private UserMapper userMapper;

    @Autowired
    public SuperUserServiceImpl(SuperUserMapper superUserMapper, UserMapper userMapper) {
        this.superUserMapper = superUserMapper;
        this.userMapper = userMapper;
    }

    @Override
    public Result<SuperUser> login(String userName, String password) {
        SuperUser superUser = new SuperUser();
        superUser.setPassword(password);
        superUser.setUserName(userName);
        SuperUser ss = superUserMapper.login(superUser);
        if (ss != null) {
            return Result.build(200, "登录成功", ss);
        }
        return Result.build(400, "获取失败");
    }

    @Override
    public Result<List<SuperUser>> selectUserBySchoolId(Integer schoolId) {
        SuperUserExample example = new SuperUserExample();
        example.createCriteria().andSchoolIdEqualTo(schoolId);
        List<SuperUser> superUsers = superUserMapper.selectByExample(example);
        return superUsers == null ? Result.build(400, "获取失败，没有数据") : Result.build(200, "获取成功", superUsers);
    }

    @Override
    public Result<List<SuperUser>> selectAdminUser() {
        SuperUserExample example = new SuperUserExample();
        example.createCriteria().andRoleIdEqualTo(StatusUtil.ADMIN);
        List<SuperUser> superUsers = superUserMapper.selectByExample(example);
        return superUsers == null ? Result.build(400, "获取失败，没有数据") : Result.build(200, "获取成功", superUsers);
    }

    @Override
    public Result insertManagerUser(Integer userId) {
        return setRole(userId, StatusUtil.MANAGER);
    }

    @Override
    public Result insertAdminUser(Integer userId) {
        return setRole(userId, StatusUtil.ADMIN);
    }

    @Override
    public Result deleteSuperUser(Integer userId) {
        return setRole(userId, StatusUtil.PRIMARY);
    }

    private Result setRole(Integer userId, Integer role) {
        User user = new User();
        user.setRole(role);
        UserExample example = new UserExample();
        example.createCriteria().andUserIdEqualTo(userId);
        int res = userMapper.updateByExampleSelective(user, example);
        return res == 0 ? Result.build(400, "设置失败") : Result.build(200, "设置成功");
    }

}
