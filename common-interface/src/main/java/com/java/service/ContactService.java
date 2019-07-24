package com.java.service;

import com.java.pojo.Contact;

import java.util.List;
import java.util.Map;

public interface ContactService {

    List<Map<String,Object>> findContact(Map<String,Object> map);

    boolean saveContact(Contact contact);

    Map<String,Object> findContactById(Long id);

    boolean modifyContact(Contact contact);
}
