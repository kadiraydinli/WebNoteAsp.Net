<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="webNote.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Web Note</title>
    <link href="Content/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-light bg-light">
            <h4>Web Note</h4>
        </nav>
        <div class="card">
            <div class="card-body">
                <asp:Label ID="Label1" runat="server" Text="E-Mail: "></asp:Label>
                <br />
                <asp:TextBox ID="email" TextMode="Email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email" ErrorMessage="E-Mail Boş Bırakılamaz!"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="E-Mail yanlış biçimde!"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Şifre: "></asp:Label>
                <br />
                <asp:TextBox ID="sifre" TextMode="Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="sifre" ErrorMessage="Şifre Boş Bırakılamaz!"></asp:RequiredFieldValidator>
                <br /><br />
                <asp:Button ID="giris" runat="server" Text="Giriş Yap" OnClick="giris_Click" class="btn btn-primary" />
                <br />
                <asp:HyperLink ID="kayit" NavigateUrl="~/Register.aspx" runat="server">Kayıt Ol!</asp:HyperLink>
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </div>
        </div>
    </form>
    <script src="Content/js/bootstrap.min.js"></script>
</body>
</html>
