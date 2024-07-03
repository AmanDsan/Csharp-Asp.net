<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewTest01.aspx.cs" Inherits="NewTest01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .align{
           text-align:right;
        }
        .auto-style3 {
            height: 30px;
        }
        .cent{
            margin: 0 auto; 
            width: 30%; 
            ali
        }
         .page_heading {
            text-align: center;
            padding: 10px;
            font-size:25px;
        }
        hr {
            border: 1px solid black;
            margin-top:0px;
            margin-bottom:0px;
        }
        #Button1{
              width:85px;
           height:25px;
           border:1.5px solid;
           background-color:lightskyblue;
        }
        .main{
            margin-left:20%;
            margin-right:20%;
        }
       
    </style>
</head>
<body>
    <div class="main">
    <form id="form1" runat="server">
          <hr /><div class="page_heading">
            TEAM DATA
        </div><hr/><br /><br />
    <div class ="cent">
       <table>
           <tr>
               <td class="align">Team Name</td>
               <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
           </tr>
            <tr>
               <td class="align">Team Lead</td>
               <td><asp:DropDownList ID="DropDownList1" runat="server">
                   </asp:DropDownList></td>
           </tr>
           <tr>
               <td class="align">Project Manager</td>
               <td><asp:DropDownList ID="DropDownList2" runat="server"> 
                   </asp:DropDownList></td>
           </tr>
            <tr>
               <td class="align">Team Logo</td>
               <td><asp:Image ID="Image1" runat="server" /></td>
           </tr>
           <tr>
               <td class="align">Dollar Value</td>
               <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
           </tr>
           <tr><td></td></tr>
           <tr><td class="auto-style3"></td><td class="auto-style3">
               <asp:Button ID="Button1" runat="server" Text="Submit" onclick="DataSubmit"/></td></tr>
       </table><br />
    </div>
        
        <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
              DataKeyNames="teamname" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
           
               <asp:TemplateField HeaderText="Team ID" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                          <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>

<HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>

<ItemStyle BackColor="#CCCCCC"></ItemStyle>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Team Name" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("teamname") %>'></asp:Label>
                    </ItemTemplate> 
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("teamname") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>                  

<HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>

<ItemStyle BackColor="#CCCCCC"></ItemStyle>
                 </asp:TemplateField>

                 <asp:TemplateField HeaderText="Team Lead" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Lead" runat="server" Text='<%#Eval("teamlead") %>'></asp:Label>
                    </ItemTemplate>   
                        <EditItemTemplate>
                        <asp:TextBox ID="txt_Lead" runat="server" Text='<%#Eval("teamlead") %>' Width="100px"></asp:TextBox>
                       </EditItemTemplate>                
                     <HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>
                    <ItemStyle BackColor="#CCCCCC"></ItemStyle>
                </asp:TemplateField>


                 <asp:TemplateField HeaderText="Project Manager" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_ProjMan" runat="server" Text='<%#Eval("projmanager") %>'></asp:Label>
                    </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID="txt_ProjMan" runat="server" Text='<%#Eval("projmanager") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>

<HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>

<ItemStyle BackColor="#CCCCCC"></ItemStyle>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Dollar Value" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_DollV" runat="server" Text='<%#Eval("dollarval") %>'></asp:Label>
                    </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID="txt_DollV" runat="server" Text='<%#Eval("dollarval") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>

<HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>



<ItemStyle BackColor="#CCCCCC"></ItemStyle>
                </asp:TemplateField>

                  <asp:TemplateField HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" BackColor="#CCCCCC" Font-Underline="True" ForeColor="#3333CC" BorderColor="#CCCCCC" BorderStyle="None" />
                    <asp:Button ID="btn_Delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("teamname") %>'  BackColor="#CCCCCC" Font-Underline="True" ForeColor="#3333CC" BorderColor="#CCCCCC" BorderStyle="None"/>
                </ItemTemplate>    
                  <EditItemTemplate>
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" BackColor="#CCCCCC" Font-Underline="True" ForeColor="#3333CC" BorderColor="#CCCCCC" BorderStyle="None" />
                    </EditItemTemplate>          

<HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>

<ItemStyle BackColor="#CCCCCC"></ItemStyle>
              </asp:TemplateField>  
            </Columns>

        </asp:GridView>
    </form>
    </div>
</body>
</html>

