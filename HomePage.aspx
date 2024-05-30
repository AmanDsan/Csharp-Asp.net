<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
          <h3>HOMEPAGE</h3>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" >
            <asp:ListItem Selected="True" Value="New Delhi"></asp:ListItem>
            <asp:ListItem Value="Noida"></asp:ListItem>
            <asp:ListItem Value="Nagpur"></asp:ListItem>
            <asp:ListItem Value="Manipur"></asp:ListItem>
            <asp:ListItem Value="Jaipur"></asp:ListItem>
            <asp:ListItem Value="Bangalore"></asp:ListItem>
          </asp:DropDownList>
        <asp:GridView ID="GridView1" runat="server" Height="60px"  Width="100%" > </asp:GridView>
    </div>

    </form>
</body>
</html>
