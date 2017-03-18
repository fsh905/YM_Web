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


    public static final String LOGINSTATUSVALUE = "LOGIN";
    public static final String LOGINSTATUSKEY = "LOGIN";
    public static final String LOGINUSERKEY = "LOGINUSER";
    public static final String LOGINSUPERUSERKEY = "LOGINSUPERUSER";
    public static final String USERIDKEY = "USERID";
    public static final String SUPERUSERIDKEY = "SUPERUSERID";
    public static final String SCHOOLIDKEY = "SCHOOLID";

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
