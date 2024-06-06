<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BoundMethod.aspx.cs" Inherits="BoundMethod" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .sty_yokai {
    background-color:lightskyblue;
    color:black;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <table>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="ID"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="City"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="New Delhi"></asp:ListItem>
                <asp:ListItem Value="Bangalore"></asp:ListItem>
                <asp:ListItem Value="Nagpur"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label4" runat="server" Text="Salary"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>

        
<asp:Button ID="Button1" runat="server" Text="Submit"  OnClick="ShowData" Width="113px"/>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="true" PageSize="15" 
            OnRowDataBound="GridView1_RowDataBound"
            OnPageIndexChanging="Gridpaging"
            OnSorting="GridView1_Sorting"
             OnRowCreated="GridView1_RowCreated"
            OnDataBound="GridView1_DataBound" >
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id"  SortExpression="id"/>
                <asp:BoundField DataField="Name" HeaderText="Name"  SortExpression="name"/>
                <asp:BoundField DataField="City" HeaderText="City"  SortExpression="city"/>
                <asp:BoundField DataField="Salary" HeaderText="Salary"  SortExpression="salary"/>
            </Columns>
        </asp:GridView>

    </div>
    </form>
</body>
</html>
