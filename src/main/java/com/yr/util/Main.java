package com.yr.util;


import com.yr.service.IAccountService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
    public static void main(String[] args) {
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        IAccountService iAccountService = ioc.getBean(IAccountService.class);

//        Account account = new Account();
//        account.setName("aaa");
//        account.setPassword("1111111");
//        account.setEmail("heireng@gmail.com");
//
//        iAccountService.add(account);

        iAccountService.delete(17);

    }
}