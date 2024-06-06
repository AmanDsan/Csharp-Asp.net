<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ITsamp.aspx.cs" Inherits="emplo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
      .arop{
        text-align:right;
      } 
      .drop{
         
      }
   
    </style>
</head>
<body style="width: 100%; margin-top: 72px">
    <form id="form1" runat="server">
<div>
    <div style="text-align:center;">
        Software Licenses Details Entry
    </div>
      <table class="drop" >
          <tr>
    <td style="text-align:center" >
        <asp:Label ID="Label6" runat="server" width="100%" BackColor="Green"></asp:Label></td>
   </tr>
        
    <tr>
    <td class="arop"><asp:Label ID="Label7" runat="server" Text="Software Name"></asp:Label></td>
    <td><asp:DropDownList ID="DropDownList5" runat="server"></asp:DropDownList></td>
</tr>
<tr>
    <td  class="arop"><asp:Label ID="Label1" runat="server" Text="New Software Name"></asp:Label></td>
    <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
</tr>
<tr>
    <td  class="arop"><asp:Label ID="Label2" runat="server" Text="Existing Original Licenses Qty"></asp:Label></td>
    <td><asp:TextBox ID="TextBox2" runat="server" Width="145px"></asp:TextBox></td>
</tr>
<tr>
    <td  class="arop"><asp:Label ID="Label3" runat="server" Text="Spare Licenses"></asp:Label></td>
    <td><asp:TextBox ID="TextBox3" runat="server" Width="145px"></asp:TextBox></td>
</tr>
<tr>
    <td  class="arop"><asp:Label ID="Label4" runat="server" Text="Remarks"></asp:Label></td>
    <td><asp:TextBox ID="TextBox4" runat="server" Width="145px" TextMode="MultiLine"></asp:TextBox></td>
</tr>

<asp:GridView ID="GridView2" runat="server" Height="200px" Width="70%" CellPadding="3" CssClass="auto-style7" GridLines="Vertical" BackColor="White" BorderColor="#999999"
   AutoGenerateColumns="False" >
    <Columns>
        <asp:TemplateField HeaderText="S_No">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Location">
            <ItemTemplate>
                <asp:Label ID="lbl_Location" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Total Licenses Used">
            <ItemTemplate>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <AlternatingRowStyle BackColor="#DCDCDC" />
    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    <RowStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#0000A9" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#000065" />
    <EditRowStyle BackColor="#7C6F57" />
</asp:GridView>

          </table>

<asp:Button ID="Button1" runat="server" Text="Submit" CssClass="auto-style5" OnClick="DataSubmit" Width="113px" style="background-color: cornflowerblue; color: white;"
    onmouseover="this.style.backgroundColor='darkblue';" onmouseout="this.style.backgroundColor='cornflowerblue';" />

        <br /><br /><br/>
          
         <asp:Label ID="Label5" runat="server" Text="Location"></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="auto-style8" ></asp:DropDownList>

        <asp:GridView ID="GridView5" runat="server"  Height="164px" Width="100%" CellPadding="3" CssClass="auto-style7" GridLines="Vertical" BackColor="White" BorderColor="#999999"
             BorderStyle="None" BorderWidth="1px"
            DataKeyNames="Description of Software"   
            OnRowDeleting="GridView5_RowDeleting" AutoGenerateColumns="False">
    
             <Columns>
                 <asp:TemplateField HeaderText="S_No">
                    <ItemTemplate>
                          <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Description of Software">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Desc" runat="server" Text='<%# Eval("Description of Software") %>'></asp:Label>
                    </ItemTemplate>
                 </asp:TemplateField>

                  <asp:TemplateField HeaderText="Existing Original Licenses Qty">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Exist" runat="server" Text='<%#Eval("Existing Original Licences Qty") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Spare Licenses">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Spare" runat="server" Text='<%#Eval("Spare Licenses") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Total Licenses Used">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Total" runat="server" Text='<%#Eval("Total Licenses Used") %>'></asp:Label>
                    </ItemTemplate>
                 </asp:TemplateField>

                 <asp:TemplateField HeaderText="Remarks">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Remark" runat="server" Text='<%#Eval("Remarks") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

              <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("Description of Software") %>' />
                </ItemTemplate>              
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
      </div>
    </form>

</body>
</html>
