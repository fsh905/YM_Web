package com.ym.er.service;

import com.ym.er.model.Result;
import com.ym.er.model.User;

/**
 * Created by YM on 3/8/2017.
 * 普通用户个人信息方面的service
 * todo:登陆，注册，个人信息增改
 */
public interface UserService {

    /**
     * 登录
     * @param name 用户名
     * @param password 密码
     * @return 登陆成功后的用户,
     */
    Result<User> login(String name, String password);

    /**
     *  注册
     * @param user 新用户
     * @return 注册后的用户
     */
    Result<User> signin(User user);

    /**
     * 修改信息
     * @param user 用户
     * @return 结果
     */
    Result update(User user);

    /**
     * 修改密码
     * @param user 必须包含id和密码
     * @return 结果
     */
    Result updatePassword(User user);

    /**
     * 获取个人信息
     * @param id 编号
     * @return 信息
     */
    Result<User> selectUserById(int id);

    /**
     * 通过email获取到个人信息
     * @param email email
     * @return 个人信息
     */
    Result<User> selectUserIdByEmail(String email);

    /**
     * 检查用户名是否相同
     * @param name 名
     * @return 结果
     */
    Result checkNameIsDuplicate(String name);

    /**
     * 检查email是否相同
     * @param email  email
     * @return 结果
     */
    Result checkEmailIsDuplicate(String email);

    /**
     * 检查手机号是否相同
     * @param phone 手机号
     * @return 结果
     */
    Result checkPhoneIsDuplicate(String phone);

    /**
     * 某学校七天内注册的用户数量
     * @param schoolId 学校id
     * @return 数量
     */
    Result<Integer> countBySchoolIn7Day(Integer schoolId);

    /**
     * 某学校总用户数
     * @param schoolId 学校id
     * @return 用户数
     */
    Result<Integer> countBySchoolInAllTime(Integer schoolId);

    /**
     * 全网7天内注册的新用户数量
     * @return 用户数量
     */
    Result<Integer> countAllIn7Day();

    /**
     * 全网总用户数量
     * @return 用户数量
     */
    Result<Integer> countAllInAllTime();

}
