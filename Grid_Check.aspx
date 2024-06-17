<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Grid_Check.aspx.cs" Inherits="Grid_Check" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <script type="text/javascript">  

          function handleCheckboxClick(ob) {
              var gridvalue = ob.parentNode.parentNode.parentNode;
              var inputs = gridvalue.getElementsByTagName("input");

              for (var i = 0; i < inputs.length; i++) {
                  if (inputs[i].type == "checkbox") {
                      if (ob.checked && inputs[i] != ob && inputs[i].checked) {
                          inputs[i].checked = false;
                      }
                  }
              }
          }
      </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
              <Columns>
                 <asp:TemplateField HeaderText="S_No">
                    <ItemTemplate>
                          <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Emp_Name") %>'></asp:Label>
                    </ItemTemplate>
                    
                 </asp:TemplateField>

                  <asp:TemplateField HeaderText="Location">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("Emp_Location") %>'></asp:Label>
                    </ItemTemplate>
                      
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Phone No.">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("Emp_PhoneNo") %>'></asp:Label>
                    </ItemTemplate>   
                </asp:TemplateField>
                  
                     <asp:TemplateField HeaderText ="Like Location">    
                      <ItemTemplate > 
                          <asp:RadioButton ID="RadioButton1" runat="server" Text="Yes" GroupName="Like"/><br />
                          <asp:RadioButton ID="RadioButton2" runat="server" Text="No" GroupName="Like"/>
                      </ItemTemplate>   
                      </asp:TemplateField>
                     <asp:TemplateField>
                        <ItemTemplate >
                          <asp:CheckBox ID="CheckBox1" runat="server" onclick="handleCheckboxClick(this)"/>

                        </ItemTemplate>    
                     </asp:TemplateField>
                        
              </Columns>
        </asp:GridView>
        <asp:Button runat="server" Text="Submit" onClick="Click"/>
    </div>
    </form>
</body>
</html>
