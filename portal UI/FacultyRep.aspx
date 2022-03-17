<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultyRep.aspx.cs" Inherits="Portal.FacultyRep" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="DeleteProfile" runat="server" Text="DeleteProfile" OnClick="DeleteProfile_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="ViewProfile" OnClick="ViewProfileButton" />
        <asp:GridView ID="fac" runat="server" OnSelectedIndexChanged="fac_SelectedIndexChanged">
        </asp:GridView>
        <asp:Button ID="status" runat="server" OnClick="status_Click" Text="status " />
        <p>
            Job ID&nbsp;&nbsp;
            
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="jobid" runat="server"></asp:TextBox>
            Admin ID&nbsp;&nbsp;
            <asp:TextBox ID="adminid" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Faculty repreasinteve ID<asp:TextBox ID="fcaultyrepre" runat="server"></asp:TextBox>
        </div>
    </form>
</body>
</html>
