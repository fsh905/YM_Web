package com.ym.er.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by YM on 3/19/2017.
 * 错误处理
 */
@Controller
public class ErrorController {


    @GetMapping("/error")
    public ModelAndView renderErrorPage(HttpServletRequest httpRequest) {

        ModelAndView errorPage = new ModelAndView("error");
        String errorMsg = "";
        int httpErrorCode = getErrorCode(httpRequest);

        switch (httpErrorCode) {
            case 400: {
                errorMsg = "错误参数: 400. 请求错误";
                break;
            }
            case 401: {
                errorMsg = "请求错误401，未认证";
                break;
            }
            case 404: {
                errorMsg = "错误参数: 404. 未找到此页面";
                break;
            }
            case 500: {
                errorMsg = "错误代码: 500. 服务器发生错误";
                break;
            }
        }
        errorPage.addObject("status", httpErrorCode);
        errorPage.addObject("msg", errorMsg);
        return errorPage;
    }

    private int getErrorCode(HttpServletRequest httpRequest) {
        return (Integer) httpRequest
                .getAttribute("javax.servlet.error.status_code");
    }
}
