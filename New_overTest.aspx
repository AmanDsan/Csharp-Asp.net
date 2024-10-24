<%@ Page Language="C#" AutoEventWireup="true" CodeFile="New_overTest.aspx.cs" Inherits="New_overTest" %>

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
       
        .auto-style4 {
            margin-left: 0px;
        }

        #DropDownList1,
        #DropDownList2{
            width:150px;
        }

     /*   #DropDownList1:hover, 
        #DropDownList2:hover{
            border-color: #888;
        }   */

        #DropDownList1:focus, 
        #DropDownList2:focus,
        #DropDownList3:focus{
             outline: none;
             border-color: #007bff; 
             background-color: #fff;
        }
       
    </style>
</head>
<body>
    <div class="main">
    <form id="form1" runat="server">
        
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
               <td class="align">Location</td>
               <td><asp:DropDownList ID="DropDownList3" runat="server"> 
                   </asp:DropDownList></td>
           </tr>
           <tr><td></td></tr>
           <tr><td class="auto-style3"></td><td class="auto-style3">
               <asp:Button ID="Button1" runat="server" Text="Submit" onclick="DataSubmit"/></td></tr>
       </table><br />
    </div>
        
        <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
              DataKeyNames="teamid" OnRowDeleting="GridView1_RowDeleting">
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
                        <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("teamname") %>' Width="50px"></asp:TextBox>
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


                <asp:TemplateField HeaderText="Location" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Loca" runat="server" Text='<%#Eval("location") %>'></asp:Label>
                    </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID="txt_Loca" runat="server" Text='<%#Eval("location") %>' Width="70px"></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>
                    <ItemStyle BackColor="#CCCCCC"></ItemStyle>
                </asp:TemplateField>


  
                <asp:TemplateField HeaderText="Dollar Value" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_DollV" runat="server" Text='<%#Eval("dollarval") %>'></asp:Label>
                    </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID="txt_DollV" runat="server" Text='<%#Eval("dollarval") %>' Width="50px"></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>
                    <ItemStyle BackColor="#CCCCCC"></ItemStyle>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Status" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_status" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                    </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID="txt_status" runat="server" Text='<%#Eval("status") %>' Width="40px"></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>
                    <ItemStyle BackColor="#CCCCCC"></ItemStyle>
                </asp:TemplateField>



                <asp:TemplateField HeaderText="temp1" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_temp1" runat="server" Text='<%#Eval("temp1") %>'></asp:Label>
                    </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID="txt_temp1" runat="server" Text='<%#Eval("temp1") %>' Width="30px"></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>
                    <ItemStyle BackColor="#CCCCCC"></ItemStyle>
                </asp:TemplateField>



                <asp:TemplateField HeaderText="temp2" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_temp2" runat="server" Text='<%#Eval("temp2") %>'></asp:Label>
                    </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID="txt_temp2" runat="server" Text='<%#Eval("temp2") %>' Width="30px"></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>
                    <ItemStyle BackColor="#CCCCCC"></ItemStyle>
                </asp:TemplateField>



                <asp:TemplateField HeaderText="temp3" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_temp3" runat="server" Text='<%#Eval("temp3") %>'></asp:Label>
                    </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID="txt_temp3" runat="server" Text='<%#Eval("temp3") %>' Width="30px"></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>
                    <ItemStyle BackColor="#CCCCCC"></ItemStyle>
                </asp:TemplateField>



               <asp:TemplateField HeaderText="temp4" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_temp4" runat="server" Text='<%#Eval("temp4") %>'></asp:Label>
                    </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID="txt_temp4" runat="server" Text='<%#Eval("temp4") %>' Width="30px"></asp:TextBox>
                    </EditItemTemplate>
                   <HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>
                   <ItemStyle BackColor="#CCCCCC"></ItemStyle>
                </asp:TemplateField>

                

                <asp:TemplateField HeaderText="temp5" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_temp5" runat="server" Text='<%#Eval("temp5") %>'></asp:Label>
                    </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID="txt_temp5" runat="server" Text='<%#Eval("temp5") %>' Width="30px"></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>
                    <ItemStyle BackColor="#CCCCCC"></ItemStyle>
                </asp:TemplateField>


                
                <asp:TemplateField HeaderText="temp6" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_temp6" runat="server" Text='<%#Eval("temp6") %>'></asp:Label>
                    </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID="txt_temp6" runat="server" Text='<%#Eval("temp6") %>' Width="30px"></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>
                    <ItemStyle BackColor="#CCCCCC"></ItemStyle>
                </asp:TemplateField>


                
                <asp:TemplateField HeaderText="temp7" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_temp7" runat="server" Text='<%#Eval("temp7") %>'></asp:Label>
                    </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID="txt_temp7" runat="server" Text='<%#Eval("temp7") %>' Width="30px"></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>
                    <ItemStyle BackColor="#CCCCCC"></ItemStyle>
                </asp:TemplateField>


                
                <asp:TemplateField HeaderText="temp8" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_temp8" runat="server" Text='<%#Eval("temp8") %>'></asp:Label>
                    </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID="txt_temp8" runat="server" Text='<%#Eval("temp8") %>' Width="30px"></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>
                    <ItemStyle BackColor="#CCCCCC"></ItemStyle>
                </asp:TemplateField>


                
                <asp:TemplateField HeaderText="temp9" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_temp9" runat="server" Text='<%#Eval("temp9") %>'></asp:Label>
                    </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID="txt_temp9" runat="server" Text='<%#Eval("temp9") %>' Width="30px"></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>
                    <ItemStyle BackColor="#CCCCCC"></ItemStyle>
                </asp:TemplateField>


                
                <asp:TemplateField HeaderText="temp10" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_temp10" runat="server" Text='<%#Eval("temp10") %>'></asp:Label>
                    </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID="txt_temp10" runat="server" Text='<%#Eval("temp10") %>' Width="30px"></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" BackColor="LightSkyBlue"></HeaderStyle>
                    <ItemStyle BackColor="#CCCCCC"></ItemStyle>
                </asp:TemplateField>



               <asp:TemplateField HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" BackColor="#CCCCCC" Font-Underline="True" ForeColor="#3333CC" BorderColor="#CCCCCC" BorderStyle="None" />
                    <asp:Button ID="btn_Delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("teamid") %>'  BackColor="#CCCCCC" Font-Underline="True" ForeColor="#3333CC" BorderColor="#CCCCCC" BorderStyle="None"/>
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

