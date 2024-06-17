<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Check_and_Radio.aspx.cs" Inherits="Check_and_Radio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    
<body>
  <script type="text/javascript">
    function selectAllChanged(checkbox) {
        console.log("Select All changed:", checkbox.checked);
        var checkboxes = document.getElementsByClassName('click');
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = checkbox.checked;
        }
      }


    function handleCheckboxClick(checkbox) {
        checkboxes = document.querySelectorAll('input[type="checkbox"]');
        checkboxes.forEach(function(cb) {
        if (cb !== checkbox) {
              cb.checked = false;
        }
      })
    }

</script>

    <form id="form1" runat="server">
    <div>
        <table>
            <tr><td><asp:CheckBox ID="CheckBox1" runat="server" Text="Select All" CssClass="click" onchange="selectAllChanged(this)" /></td></tr>
            <tr><td><asp:CheckBox ID="CheckBox2" runat="server" Text="Maths" CssClass="click"/></td></tr>
            <tr><td><asp:CheckBox ID="CheckBox3" runat="server" Text="Science" CssClass="click"/></td></tr>
            <tr><td><asp:CheckBox ID="CheckBox4" runat="server" Text="English" CssClass="click"/></td></tr>
            <tr><td><asp:CheckBox ID="CheckBox5" runat="server" Text="Hindi" CssClass="click"/></td></tr>
            <tr><td><asp:CheckBox ID="CheckBox6" runat="server" Text="Computer" CssClass="click"/></td></tr>  

            <tr><td><asp:Button ID="Button1" runat="server" Text="Submit" onclick="CoursesChoosed"/></td></tr> 

           <tr><td>Course/Courses You Picked:- <br /><asp:Label ID="Label1" runat="server"></asp:Label></td></tr> 
        </table>
    </div>

        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

        <div>  Radio Button <br />
            <asp:RadioButton ID="RadioButton1" runat="server" Text="Male" GroupName="gender" />  
            <asp:RadioButton ID="RadioButton2" runat="server" Text="Female" GroupName="gender" />  
        </div>  
        <p>  
            <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="RadClick" />  
        </p>  
   
         <asp:Label runat="server" id="genderId"></asp:Label>  


        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

        <table>
        <tr><td> Which fruits do you like? <br /> <asp:CheckBox ID="CheckBox10" runat="server" Text="Apple" onclick="handleCheckboxClick(this)"/></td></tr>
        <tr><td> <asp:CheckBox ID="CheckBox7" runat="server" Text="Mango" onclick="handleCheckboxClick(this)"/></td></tr>
        <tr><td> <asp:CheckBox ID="CheckBox9" runat="server" Text="Orange" onclick="handleCheckboxClick(this)"/></td></tr>
        <tr><td> <asp:CheckBox ID="CheckBox8" runat="server" Text="Banana" onclick="handleCheckboxClick(this)"/></td></tr>
        <tr><td><asp:Button ID="Button3" runat="server" Text="Submit" onclick="FruitsLiked"/></td></tr>
        <tr><td><asp:Label ID="Label2" runat="server"></asp:Label></td></tr> 
        </table>
    </form>
</body>
</html>
