package com.ym.er.auth;

import java.lang.annotation.*;

/**
 * Created by YM on 3/8/2017.
 * 用于标注普通用户
 */
@Documented
@Inherited //继承
@Target(ElementType.METHOD) //方法的注解
@Retention(RetentionPolicy.RUNTIME) //运行期
public @interface PrimaryAuthPassport {
    boolean validate() default true;
}
