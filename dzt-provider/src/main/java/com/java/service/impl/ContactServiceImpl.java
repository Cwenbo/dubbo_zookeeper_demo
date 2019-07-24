package com.java.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.java.mapper.ContactMapper;
import com.java.pojo.Contact;
import com.java.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

@Service(version = "ps")
public class ContactServiceImpl implements ContactService {
    @Autowired
    private ContactMapper contactMapper;

    @Override
    public List<Map<String, Object>> findContact(Map<String,Object> map) {
        return contactMapper.selectContact(map);
    }

    @Override
    public boolean saveContact(Contact contact) {
        return contactMapper.addContact(contact)==1;
    }

    @Override
    public Map<String, Object> findContactById(Long id) {
        return contactMapper.selectContactById(id);
    }

    @Override
    public boolean modifyContact(Contact contact) {
        return contactMapper.updateContact(contact)==1;
    }
}
