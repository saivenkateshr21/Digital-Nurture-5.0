package com.library;

import com.library.service.BookService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LibraryApplication {
    public static void main(String[] args) {
        System.out.println("Starting Library Management System...");

        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        BookService service = context.getBean("bookService", BookService.class);
        service.showBooks();
        ((ClassPathXmlApplicationContext) context).close();
    }
}