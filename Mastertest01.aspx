<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Mastertest01.aspx.cs" Inherits="Default2" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style>
        .align{
           text-align:right;
        }
        .flex{
             float: left;
            margin-right: 20px;
            margin-left:25px;
        }
        .mainDiv{
            margin: 0 auto; 
            width: 45%; 
            overflow: hidden;
        }
        .cent{
           width:85px;
           height:25px;
           border:1.5px solid;
           background-color:lightskyblue;
           margin-left:42.5%;
        }

        .cent2{
           width:85px;
           height:25px;
           border:1.5px solid;
           background-color:lightskyblue;
          
        }

         .registration-section {
            text-align: center;
            background-color:darkgray;
            padding: 10px;
        }
        hr {
            border: 1px solid black;
            margin-top:0px;
            margin-bottom:0px;
        }
        body{
            background-color:#CCCCCC;
        }
    </style>
    
        <hr /><div class="registration-section">
            NEW EMPLOYEE REGISTRATION
        </div><hr/><br /><br />
        <div class="mainDiv">
       <div class="flex">
         <table>
                
                <tr>
                    <td  class="align"><asp:Label ID="Label1" runat="server" Text="Employee ID: "></asp:Label></td>
                    <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td  class="align"><asp:Label ID="Label2" runat="server" Text="Employee Name: "></asp:Label></td>
                    <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td  class="align"><asp:Label ID="Label3" runat="server" Text="Designation: "></asp:Label></td>
                    <td><asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Text="--Select--" Value="" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="Director"></asp:ListItem>
                        <asp:ListItem Value="Apprentice Trainee"></asp:ListItem>
                        <asp:ListItem Value="Project Manager"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td  class="align"><asp:Label ID="Label4" runat="server" Text="Date of Birth: "></asp:Label></td>
                    <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                </tr>
             <tr>
                    <td  class="align"><asp:Label ID="Label17" runat="server" Text="Date of Joining: "></asp:Label></td>
                    <td><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td  class="align"><asp:Label ID="Label5" runat="server" Text="Gender: "></asp:Label></td>
                    <td><asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem Value="Male"></asp:ListItem>
                        <asp:ListItem Value="Female"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td  class="align"><asp:Label ID="Label6" runat="server" Text="Mobile No: "></asp:Label></td>
                    <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                </tr>
            </table>
     </div>

        <div class="flex">
            <table>
                <tr>
                    <td class="align"><asp:Label ID="Label8" runat="server" Text="E-Mail Id: "></asp:Label></td>
                    <td><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="align"><asp:Label ID="Label9" runat="server" Text="Relevant Exp: "></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="DropDownList3" runat="server">
                            <asp:ListItem Text="Years" Value="" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="0"></asp:ListItem>
                            <asp:ListItem Value="1"></asp:ListItem>
                            <asp:ListItem Value="2"></asp:ListItem>
                            <asp:ListItem Value="3"></asp:ListItem>
                            <asp:ListItem Value="4"></asp:ListItem>
                            <asp:ListItem Value="5"></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>&nbsp&nbsp
                        <asp:DropDownList ID="DropDownList4" runat="server">
                            <asp:ListItem Text="Months  " Value="" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="1"></asp:ListItem>
                            <asp:ListItem Value="2"></asp:ListItem>
                            <asp:ListItem Value="3"></asp:ListItem>
                            <asp:ListItem Value="4"></asp:ListItem>
                            <asp:ListItem Value="5"></asp:ListItem>
                            <asp:ListItem Value="6"></asp:ListItem>
                            <asp:ListItem Value="7"></asp:ListItem>
                            <asp:ListItem Value="8"></asp:ListItem>
                            <asp:ListItem Value="9"></asp:ListItem>
                            <asp:ListItem Value="10"></asp:ListItem>
                            <asp:ListItem Value="11"></asp:ListItem>
                            <asp:ListItem Value="12"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="align"><asp:Label ID="Label10" runat="server" Text="Grade: "></asp:Label></td>
                    <td><asp:DropDownList ID="DropDownList5" runat="server">
                        <asp:ListItem Text="--Select--" Value="" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="G3B"></asp:ListItem>
                        <asp:ListItem Value="G4C"></asp:ListItem>
                        <asp:ListItem Value="G3A"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="align"><asp:Label ID="Label11" runat="server" Text="Division: "></asp:Label></td>
                    <td><asp:DropDownList ID="DropDownList6" runat="server" Height="16px">
                        <asp:ListItem Text="--Select--" Value="" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="DMS"></asp:ListItem>
                        <asp:ListItem Value="SALES"></asp:ListItem>
                        <asp:ListItem Value="ESD"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="align"><asp:Label ID="Label12" runat="server" Text="Reporting Manager: "></asp:Label></td>
                    <td><asp:DropDownList ID="DropDownList7" runat="server">
                        <asp:ListItem Text="--Select--" Value="" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="Tanuja Harish"></asp:ListItem>
                        <asp:ListItem Value="Yuvaraja Sundaram"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="align"><asp:Label ID="Label13" runat="server" Text="Probation Period: "></asp:Label></td>
                    <td><asp:DropDownList ID="DropDownList8" runat="server">
                        <asp:ListItem Text="--Select--" Value="" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="3"></asp:ListItem>
                        <asp:ListItem Value="6"></asp:ListItem>
                        </asp:DropDownList> &nbsp(in Months)</td>
                </tr>
                <tr>
                    <td class="align"><asp:Label ID="Label14" runat="server" Text="Shift: "></asp:Label></td>
                    <td><asp:DropDownList ID="DropDownList9" runat="server">
                        <asp:ListItem Text="--Select--" Value="" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="General"></asp:ListItem>
                        <asp:ListItem Value="Onsite"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="align"><asp:Label ID="Label15" runat="server" Text="Employee Image: "></asp:Label></td>
                    <td><asp:Image ID="Image1" runat="server" /></td>
                </tr>
            </table> 
        </div>
            </div><br /><br />
           
         <asp:Button ID="Button1" CssClass="cent" runat="server" Text="Submit" onclick="DataSubmit"/>&nbsp&nbsp&nbsp
            <asp:Button ID="Button2" CssClass="cent2" runat="server" Text="Reset" OnClick="ResetClick" /><br /><br />


        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lbtn_export_Click">Export To Excel</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <asp:Label ID="Label16" runat="server" Text="Search By Employee Name: "></asp:Label>
        <asp:TextBox ID="TextBox6" runat="server" OnTextChanged="SearchBox" AutoPostBack="true" ></asp:TextBox><br /><br />




        <asp:GridView ID="GridView1" runat="server"  Width="100%" AutoGenerateColumns="False"  OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" AllowPaging="true" PageSize="17" OnPageIndexChanging="Gridpaging"
            DataKeyNames="Emp_ID" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                 <asp:TemplateField HeaderText="S.No" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                          <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Emp ID"  HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left" >
                    <ItemTemplate>
                <asp:Label ID="lbl_ID" runat="server" Text='<%# TransformEmpID(Eval("Emp_ID")) %>'></asp:Label>
            </ItemTemplate>
                 </asp:TemplateField>

                  <asp:TemplateField HeaderText="Emp Name" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("Emp_Name") %>'></asp:Label>
                    </ItemTemplate>
                      <EditItemTemplate>
                        <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("Emp_Name") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Desig"  HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left" >
                    <ItemTemplate>
                        <asp:Label ID="lbl_Desig" runat="server" Text='<%#Eval("Designation") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_Desig" runat="server" Text='<%#Eval("Designation") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="DOB" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_DOB" runat="server" Text='<%#Eval("Date_Of_Birth") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_DOB" runat="server" Text='<%#Eval("Date_Of_Birth") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                 </asp:TemplateField>

                 <asp:TemplateField HeaderText="DOJ" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_DOJ" runat="server" Text='<%#Eval("Date_Of_Joining") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_DOJ" runat="server" Text='<%#Eval("Date_Of_Joining") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Prev Exp" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Prev" runat="server" Text='<%#Eval("Previous_Experience") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_Prev" runat="server" Text='<%#Eval("Previous_Experience") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Probation" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Prob" runat="server" Text='<%#Eval("Probabation") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_Prob" runat="server" Text='<%#Eval("Probabation") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Gender" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Gender" runat="server" Text='<%#Eval("Gender") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_Gender" runat="server" Text='<%#Eval("Gender") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Email" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_email" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_email" runat="server" Text='<%#Eval("Email") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Grade" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Grade" runat="server" Text='<%#Eval("Grade") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_Grade" runat="server" Text='<%#Eval("Grade") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Division" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Div" runat="server" Text='<%#Eval("Division") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_Div" runat="server" Text='<%#Eval("Division") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="R.M" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_RM" runat="server" Text='<%#Eval("Reporting_Manager") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_RM" runat="server" Text='<%#Eval("Reporting_Manager") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Shift" HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Shift" runat="server" Text='<%#Eval("Shift") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txt_Shift" runat="server" Text='<%#Eval("Shift") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

              <asp:TemplateField HeaderStyle-BackColor="lightskyblue" ItemStyle-BackColor="#CCCCCC" HeaderStyle-HorizontalAlign="Left" >
                <ItemTemplate>
                    <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" BackColor="#CCCCCC" Font-Underline="True" ForeColor="#3333CC" BorderColor="#CCCCCC" BorderStyle="None" />
                    <asp:Button ID="btn_Delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("Emp_ID") %>'  BackColor="#CCCCCC" Font-Underline="True" ForeColor="#3333CC" BorderColor="#CCCCCC" BorderStyle="None"/>
                </ItemTemplate>    
                  <EditItemTemplate>
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" BackColor="#CCCCCC" Font-Underline="True" ForeColor="#3333CC" BorderColor="#CCCCCC" BorderStyle="None" />
                    </EditItemTemplate>          
              </asp:TemplateField>  
              </Columns>
        </asp:GridView>
   
</asp:Content>


