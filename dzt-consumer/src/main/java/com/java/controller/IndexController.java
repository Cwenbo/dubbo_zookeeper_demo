package com.java.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.java.pojo.Contact;
import com.java.service.ContactService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class IndexController {
    @Reference(version = "ps",timeout = 3000,retries = 5)
    private ContactService contactService;

    @RequestMapping("/")
    public String getContact(@RequestParam(required = false) String cname,
                             Model model) {
        Map<String, Object> map = new HashMap<>();
        map.put("cname", cname);
        List<Map<String, Object>> contactList = contactService.findContact(map);
        model.addAttribute("contactList", contactList);
        model.addAttribute("cname", cname);
        return "/pages/contactList.jsp";
    }

    @RequestMapping("/addContact")
    public @ResponseBody
    boolean addContact(Contact contact) {
        return contactService.saveContact(contact);
    }

    @RequestMapping("/getContactById")
    public String getContactById(Long id, Model model) {
        Map<String, Object> contactById = contactService.findContactById(id);
        model.addAttribute("contactById", contactById);
        return "/pages/update.jsp";
    }

    @RequestMapping("/updateContact")
    public @ResponseBody boolean updateContact(Contact contact) {
        return contactService.modifyContact(contact);
    }

}
