package com.ym.er.util;

/**
 * Created by YM on 3/10/2017.
 */
public class StatusUtil {

    public static final byte EXIST = 1;
    public static final byte DELETE = 0;
    public static final byte PRODUCT = 3;
    public static final byte DEMAND = 4;
    public static final byte HIDDEN = 5;
    public static final byte SHOW = 6;
    public static final byte PAST = 2;

    public static final byte READ = 1;
    public static final byte UNREAD = 0;


    /**
     * 登录状态值
     */
    public static final String LOGINSTATUSVALUE = "LOGIN";
    /**
     * 查询登录状态的键
     */
    public static final String LOGINSTATUSKEY = "LOGIN";
    /**
     * 查询登陆的用户
     */
    public static final String LOGINUSERKEY = "LOGINUSER";
    /**
     * 查询登陆的超级管理员
     */
    public static final String LOGINSUPERUSERKEY = "LOGINSUPERUSER";
    /**
     * 登录用户的id
     */
    public static final String USERIDKEY = "USERID";
    /**
     * 炒鸡用户的id
     */
    public static final String SUPERUSERIDKEY = "SUPERUSERID";
    /**
     * 学校的id
     */
    public static final String SCHOOLIDKEY = "SCHOOLID";
    /**
     * 学校bean
     * 在cookie中为学校的名称
     */
    public static final String SCHOOLKEY = "SCHOOLKEY";

    /**
     * 后台登录用户的角色编号
     */
    public static final String BACKENDROLE = "BACKENDROLE";

    /**
     * 超级管理员
     */
    public static final Integer ADMIN = 1;
    /**
     * 校区管理员
     */
    public static final Integer MANAGER = 2;
    /**
     * 普通用户
     */
    public static final Integer PRIMARY = 3;



}
