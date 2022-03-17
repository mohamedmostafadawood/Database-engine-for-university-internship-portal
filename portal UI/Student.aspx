<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Portal.Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 1029px;
            width: 1280px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button6" runat="server" OnClick="ViewProfileButton" Text="View your Profile" Width="159px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button7" runat="server" OnClick="delete_profile" Text="Delete your profile" />
            </p>
        <p>
            &nbsp;</p>
        <p>
            edit your profile</p>
       first name<asp:TextBox ID="firstname" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
       middle name <asp:TextBox ID="middlename" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       enter job id <asp:TextBox ID="job_idddd" runat="server"></asp:TextBox>
        <br />
&nbsp;<p>
           last name <asp:TextBox ID="lastname" runat="server"></asp:TextBox>
        <asp:Button ID="Button5" runat="server" Text="show job status" Width="177px" style="margin-left: 142px" OnClick="show_job_status" />
        </p>
        <p>
           giu_Id<asp:TextBox ID="giu_Id" runat="server"></asp:TextBox>
        </p>
        <p>
            birth date<asp:TextBox ID="birthdate" runat="server"></asp:TextBox>
        </p>
        <p>
          semester  <asp:TextBox ID="semester" runat="server"></asp:TextBox>
        </p>
        faculty<asp:TextBox ID="faculty" runat="server"></asp:TextBox>
        <br />
        address<asp:TextBox ID="address" runat="server"></asp:TextBox>
        <br />
       major <asp:TextBox ID="major" runat="server"></asp:TextBox>
        <br />
        gpa<asp:TextBox ID="gpa" runat="server"></asp:TextBox>
        <br />
        email<asp:TextBox ID="email" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="update_submit" Text="submit" />
        <br />
        <br />
        <br />

        add your phone<asp:TextBox ID="phone_number" runat="server"></asp:TextBox>

        <br />

        <br />
        <asp:Button ID="Button2" runat="server" Text="submit" OnClick="submit_phone" />

        <br />
        <br />
        <br />
        <br />
       enter job id  <asp:TextBox ID="job_id" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button3" runat="server" Text="apply for job" OnClick="apply" />

        <br />
        <br />
        <br />
        enter the date<asp:TextBox ID="date" runat="server"></asp:TextBox>
        <br />
        enter the description<asp:TextBox ID="description" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button4" runat="server" Text="submit report" OnClick="submit_report" />
        <asp:GridView ID="statusGrid" runat="server">
        </asp:GridView>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
