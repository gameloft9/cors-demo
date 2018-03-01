package com.gameloft9.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Writer;

/**
 * 跨域请求示例
 * 跨域方法：
 * 1-ajax jsonp方式
 * 2-后台设置header
 * 3-nginx转发（本处不涉及）
 * Created by gameloft9 on 2017/11/27.
 */
@Controller
public class LoginController {

    /**
     * 测试ajax josnp跨域请求
     * */
    @RequestMapping(value = "/testjsonp.do", method = RequestMethod.GET)
    //@ResponseBody
    public void test(Model model,String callback,String number, HttpServletRequest request,HttpServletResponse response)throws Exception{
        //如果是spring mvc，启用了@ResponseBody注解，可以直接返回调用语句
        //return callback+"("+result.toString()+")";

        Integer result = Integer.parseInt(number);
        result = result*result;//计算平方值

        Writer client = response.getWriter();
        client.write(callback+"("+result.toString()+")");
        client.flush();
    }

    /**
     * 测试ajax 设置head跨域请求
     * */
    @RequestMapping(value = "/testCrossOrigin.do", method = RequestMethod.POST)
    @ResponseBody
    public String crossOrigin(Model model,String number,HttpServletRequest request,HttpServletResponse response)throws Exception{

        //设置response header，允许跨域请求
        response.setHeader("Access-Control-Allow-Origin","*");
        response.setHeader("Access-Control-Allow-Methods","POST");
        response.setHeader("Access-Control-Allow-Headers","x-requested-with,content-type");
        response.setHeader("Access-Control-Allow-Max-Age","1728000");//单位：秒，这里是20天

        Integer result = Integer.parseInt(number);
        result = result*result;

       return result.toString();
    }
}
