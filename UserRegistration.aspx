<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserRegistration.aspx.cs" Inherits="UserRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            text-align:center;
            margin-top:10rem;
        }
        btn-login{
            margin-left:15%;
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="UserName"></asp:Label>
        <asp:TextBox ID="txtUserName" runat="server" ></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Password" ></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" Type="Password" ></asp:TextBox>
                <asp:RegularExpressionValidator ID="revPassword" runat="server" ErrorMessage="Should Contain Atleast A,a,1,@ letters"
                  ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,15}$" ControlToValidate="txtPassword" ForeColor="Red" ></asp:RegularExpressionValidator>
        <br /><br/>
        <asp:Button CssClass="btn-login" ID="Button1" runat="server" Text="Submit" OnClick ="AuthenticateUser" BackColor="#33CC33" ForeColor="White"/>
    </div>
    </form>
    <asp:Label ID="Label3" runat="server" ></asp:Label>
   
</body>
</html>
