package com.ym.er.auth;

import java.lang.annotation.*;

/**
 * Created by YM on 3/8/2017.
 * 超级管理员才能访问
 */
@Documented
@Inherited //继承
@Target(ElementType.METHOD) //方法的注解
@Retention(RetentionPolicy.RUNTIME) //运行期
public @interface SuperManagerAuthPassport {
    boolean validate() default true;
}
