<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改联系人</title>
    <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="static/js/jsonHandler.js"></script>
</head>
<body>
<center>

    <h2>修改联系人</h2>
    <form action="javascript:void(0)" id="form1">
        <table>

            <tr>
                <input type="hidden" name="id" value="${contactById.id}">
                <td>姓名:</td>
                <td><input type="text" name="cname" value="${contactById.cname}"></td>
            </tr>
            <tr>
                <td>手机:</td>
                <td><input type="text" name="mobile" value="${contactById.mobile}"></td>
            </tr>
            <tr>
                <td>QQ:</td>
                <td><input type="text" name="qq" value="${contactById.qq}"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" value="${contactById.email}"></td>
            </tr>
            <tr>
                <td>地址:</td>
                <td><input type="text" name="address" value="${contactById.address}"></td>
            </tr>

            <tr align="center">
                <td colspan="2">
                    <input type="submit" value="保存" id="updateContact">
                    <input type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
</center>

<script type="text/javascript">
    $(function () {
        $("#updateContact").click(function () {
            var json = $("#form1").serializeObject();
            console.log(json);
            $.ajax({
                url: "<%=basePath %>/updateContact",
                type: "POST",
                dataType: "JSON",
                data: json,
                success: function (rs) {
                    if (rs) {
                        alert("修改成功");
                        window.open("<%=basePath %>/", "_self")
                    } else {
                        alert("修改失败");
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
