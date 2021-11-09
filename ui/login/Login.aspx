<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="main.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="input">
                <p class="label">Tên đăng nhập</p>
                <input type="text" id="login_email" runat="server"/>
            </div>
            <div class="input">
                <p class="label">Mật khẩu</p>
                <input type="password" id="login_passowrd" runat="server"/>
            </div>
            <button id="login_button" runat="server" onclick="login">OK</button>
        </div>
    </form>
</body>
</html>
