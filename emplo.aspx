<%@ Page Language="C#" AutoEventWireup="true" CodeFile="emplo.aspx.cs" Inherits="emplo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 35px;
        }
        .auto-style2 {
            margin-left: 14px;
        }
        .auto-style3 {
            margin-left: 64px;
            background-color:cornflowerblue; 
            color:white;        
        }
        .auto-style4 {
            margin-left: 45px;
             background-color:cornflowerblue;
            color:white
        }
        .auto-style5 {
            margin-left: 130px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.4);  
            text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);  
        }
      
        .auto-style7 {
            margin-top: 30px;
        }
        .GridView1{
            text-align:center

        }
        .auto-style8 {
            margin-left: 34px;
        }
        .auto-style9 {
            margin-left: 21px;
        }
        .auto-style10 {
            border-style: double;
            border-color:darkblue;
            border-width:thick;
            width: 25%;
            margin-left: 546px;
            height: 193px;
            margin-top: 10px;
            align-content:center;
        }
        .atm{
            margin:40px;
            Width:163px;
        }
        .space{
            margin-top:20px;
        }
        .yupp{
            float: left;
            margin-right: 20px;
            margin-left:25px;
        }
        
    </style>
</head>
<body style="width: 100%; margin-top: 72px">
    <form id="form1" runat="server">
    <div class="auto-style10" style="margin: 0 auto; ">
        <div class="space" >
        <asp:Label ID="Label1" class="atm" runat="server" Text="Employee ID"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1" ></asp:TextBox>
        <br />
        <asp:Label ID="Label2" class="atm" runat="server" Text="Employee Name"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style2"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" class="atm" runat="server" Text="Location"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style3" Width="85px" Height="16px">
            <asp:ListItem Value="New Delhi"></asp:ListItem>
            <asp:ListItem Value="Pune"></asp:ListItem>
            <asp:ListItem Value="Hyderabad"></asp:ListItem>
            <asp:ListItem Value="Bangalore"></asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label4" class="atm" runat="server" Text="Designation"></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="auto-style4" Height="16px" Width="87px">
            <asp:ListItem Value="SDE"></asp:ListItem>
            <asp:ListItem Value="Team Lead"></asp:ListItem>
            <asp:ListItem Value="Manager"></asp:ListItem>
        </asp:DropDownList>
            </div>
        <br /><br />
        <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="auto-style5" OnClick="DataSubmit" Width ="113px" 
            style="background-color: cornflowerblue; color: white;" 
            onmouseover="this.style.backgroundColor='darkblue';" 
             onmouseout="this.style.backgroundColor='cornflowerblue';" />
    </div>

        <div class ="yupp">
         <asp:Label ID="Label5" runat="server" Text="Location"></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="auto-style8" ></asp:DropDownList>
            </div>
        <div class ="yupp">
         <asp:Label ID="Label6" runat="server" Text="Designation"></asp:Label>
        <asp:DropDownList ID="DropDownList4" runat="server" CssClass="auto-style9"></asp:DropDownList>
            </div>

        <br />

        <asp:GridView ID="GridView1" runat="server"  Height="164px" Width="100%" CellPadding="3" CssClass="auto-style7" GridLines="Vertical" BackColor="White" BorderColor="#999999"
             BorderStyle="None" BorderWidth="1px"
            DataKeyNames="Emp Id"  OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
            OnRowDeleting="GridView1_RowDeleting" AutoGenerateColumns="False">
    
             <Columns>

                <asp:TemplateField HeaderText="Emp Id">
                    <ItemTemplate>
                        <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("Emp Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Emp Name">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("Emp Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("Emp Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Location">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Location" runat="server" Text='<%#Eval("Location") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_Location" runat="server" Text='<%#Eval("Location") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Designation">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Designation" runat="server" Text='<%#Eval("Designation") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_Designation" runat="server" Text='<%#Eval("Designation") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />
                         <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("Emp Id") %>' />
                    </ItemTemplate>
                    
                    <EditItemTemplate>
                        <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"/>
                    </EditItemTemplate>
                </asp:TemplateField>

            </Columns>
            
            <AlternatingRowStyle BackColor="#DCDCDC" />
    <FooterStyle BackColor="#CCCCCC" ForeColor="Black"/>
    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    <RowStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Center"/>
    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#0000A9" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#000065" />
    <EditRowStyle BackColor="#7C6F57" />
</asp:GridView>
      
    </form>

</body>
</html>
