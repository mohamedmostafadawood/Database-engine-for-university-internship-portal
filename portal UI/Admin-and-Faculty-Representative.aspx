<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin and Faculty Representative.aspx.cs" Inherits="Portal.Admin_and_Faculty_Representative" %>

<!DOCTYPE html>
<script runat="server">

    protected void Submit_Click(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void adminviewjobs_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void view_jobs_Click(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {

    }

    protected void delete_Click(object sender, EventArgs e)
    {

    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            Show Employers:</div>
        <asp:Button ID="Button1" runat="server" OnClick="ShowEmp" Text="ShowEmp" />
        <br />
        <asp:GridView ID="showEmpG" runat="server">
        </asp:GridView>
        <br />
        admin ID<asp:TextBox ID="admin_ID" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        <p>
            employer ID<asp:TextBox ID="employer_ID" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
        </p>
        <p>
            profile status<asp:TextBox ID="profile_status" runat="server" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
        </p>
        <p>
            reason<asp:TextBox ID="reasonn" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="Submit" />
        </p>
        <asp:GridView ID="adminviewjobs" runat="server" OnSelectedIndexChanged="adminviewjobs_SelectedIndexChanged">
        </asp:GridView>
        <asp:Button ID="view_jobs" runat="server" OnClick="view_jobs_Click" Text="view jobs" />
        <asp:GridView ID="representer" runat="server" Height="179px" Width="284px">
        </asp:GridView>
        <asp:Button ID="showreprefacu" runat="server" OnClick="representer_Click" Text="show repres of faculty" />
        <p style="margin-left: 520px">
            <asp:Button ID="delete" runat="server" OnClick="delete_Click" Text="DELETE" />
        </p>
    </form>
</body>
</html>
