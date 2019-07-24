package com.java.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class Contact implements Serializable {

     private Long id;
     private String cname;
     private String mobile;
     private String qq;
     private String email;
     private String address;

}
