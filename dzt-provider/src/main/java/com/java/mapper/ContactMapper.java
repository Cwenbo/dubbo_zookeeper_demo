package com.java.mapper;

import com.java.pojo.Contact;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface ContactMapper {

    /**
     * 查询数据库所有通讯信息
     * @return
     */
   // @Select("SELECT * FROM contact")
    List<Map<String,Object>> selectContact(Map<String,Object> map);

    /**
     * 添加联系人
     * @param contact
     * @return
     */
    @Insert("INSERT INTO contact VALUES(NULL,#{cname},#{mobile},#{qq},#{email},#{address})")
    int addContact(Contact contact);

    /**
     * 根据id查询联系人
     * @param id
     * @return
     */
    @Select("SELECT * FROM contact WHERE id = #{arg0}")
    Map<String,Object> selectContactById(Long id);

    /**
     * 修改联系人
     * @param contact
     * @return
     */
    @Update("UPDATE contact SET  cname=#{cname},mobile=#{mobile},qq=#{qq},email=#{email},address=#{address} WHERE id = #{id}")
    int updateContact(Contact contact);


}
