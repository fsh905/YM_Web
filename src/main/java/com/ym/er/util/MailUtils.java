package com.ym.er.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Created by YM on 3/29/2017.
 * 发送email
 */
public class MailUtils {

    /**
     * 发送邮件
     * @param name 用户名
     * @param veriCode 验证码
     * @param emailAddress 收件人地址
     * @param title 邮件标题
     * @throws MessagingException 发送失败
     */
    public static void sendEmail(String name,int veriCode,String emailAddress,String title) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.host", "feng_sh@139.com");
        Session session = Session.getInstance(props, null);


        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress("feng_sh@139.com")); //sender mail
        msg.setRecipients(Message.RecipientType.TO,
                emailAddress); //receiver mail
        msg.setSubject(title);
        msg.setSentDate(new Date());
        msg.setText("你好 "+name+":你的验证码是：<h3>"+veriCode+"</h3>,10分钟有效。");
        msg.saveChanges();//存储邮件信息
        Transport transport=session.getTransport("smtp");//创建一个smtp 通道
        transport.connect("smtp.139.com","feng_sh@139.com","fsh199505");//以smtp方式登录邮箱 ，账号，密码
        transport.sendMessage(msg,msg.getAllRecipients());//发送邮件,其中第二个参数是所有
        //已设好的收件人地址
        transport.close();//关闭通道

    }

}
