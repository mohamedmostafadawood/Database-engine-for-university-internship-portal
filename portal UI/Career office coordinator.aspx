<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Career office coordinator.aspx.cs" Inherits="Portal.Career_office_coordinator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="ViewProfileButton" Text="View your Profile" Width="159px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="delete_profile" Text="Delete your profile" />
        <p>
            <asp:Button ID="viewA" runat="server" Text="ViewAdvisors" OnClick="viewA_Click" Width="180px" />
            <asp:GridView ID="GridA" runat="server">
            </asp:GridView>
        </p>
       enter the  academic advisor id <asp:TextBox ID="AAid" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        <br />
       enter the  industrial internship id<asp:TextBox ID="IIId" runat="server" ></asp:TextBox>
        <br />
        <asp:Button ID="AAToI" runat="server" Text="AAToII " OnClick="AAToI_Click" />
        <br />
      enter the industrial internship id  <asp:TextBox ID="indid" runat="server" ></asp:TextBox>
        <br />
        <asp:GridView ID="GridI" runat="server">
        </asp:GridView>
        <asp:Button ID="viewme" runat="server" Text="CocViewStudentsCocViewStudents" OnClick="viewme_Click" />
        <br />
        <br />
        <br />
        enter the coc id <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
      enter the student  id  <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
       enter the ii id  <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
       enter the eligibility bit <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="CocUpdateEligibilityButton" runat="server" Text=" CocUpdateEligibility" OnClick="CocUpdateEligibilityButton_Click" />
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <br />
    </form>
</body>
</html>
