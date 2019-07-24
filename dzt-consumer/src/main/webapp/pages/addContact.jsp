<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加联系人</title>
    <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="static/js/jsonHandler.js"></script>
</head>
<body>
<center>
    <h2>添加联系人</h2>
    <table>

        <form action="javascript:void(0)" id="form1">
            <tbody>
            <tr>
                <td>姓名:</td>
                <td><input type="text" name="cname"></td>
            </tr>
            <tr>
                <td>手机:</td>
                <td><input type="text" name="mobile"></td>
            </tr>
            <tr>
                <td>QQ:</td>
                <td><input type="text" name="qq"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email"></td>
            </tr>
            <tr>
                <td>地址</td>
                <td><input type="text" name="address"></td>
            </tr>
            </tbody>
            <tfoot align="center">
            <tr>
                <td colspan="2">
                    <input type="submit" value="保存" id="addContact">&nbsp;
                    <input type="reset" value="重置">
                </td>
            </tr>
            </tfoot>
        </form>
    </table>

</center>

<script type="text/javascript">
    $(function () {
        $("#addContact").click(function () {
            var name = $("input[name=cname]").val();
            if (name==null || name==''){
                alert("姓名不能为空");
                return;
            }
            var mobile = $("input[name=mobile]").val();
            if (name==null || name==''){
                alert("手机不能为空");
                return;
            }
            if(!(/^1[34578]\d{9}$/.test(mobile))){
                alert("请正确填写手机");
                return;
            }
            var qq = $("input[name=qq]").val();
            if (qq==null || qq==''){
                alert("QQ不能为空");
                return;
            }
            if(!(/^[1-9]\d*$/.test(qq))){
                alert("正确填写QQ");
                return;
            }
            var email = $("input[name=email]").val();
            if (email==null || email==''){
                alert("email不能为空");
                return;
            }
            if (!(/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/.test(email))) {
                alert("请正确填写Email");
                return;
            }
            var address = $("input[name=address]").val();
            if (address==null || address==''){
                alert("地址不能为空");
                return;
            }
            var json=$("#form1").serializeObject();
            console.log(json);
            $.ajax({
                url:"<%=basePath %>/addContact",
                type:"POST",
                dataType:"JSON",
                data:json,
                success: function (rs) {
                    if (rs) {
                        alert("添加成功");
                        window.open("<%=basePath %>/","_self")
                    }else {
                        alert("添加失败");
                    }

                },
                error: function (rs) {
                    alert("请求失败了,请重试");

                }
            });

        });

    });
</script>
</body>
</html>