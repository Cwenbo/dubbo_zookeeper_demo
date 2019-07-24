package com.java.application;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.java.mapper")
public class ProviderStart {
    public static void main(String[] args) {
        SpringApplication.run(ProviderStart.class);
    }
}
