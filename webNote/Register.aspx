<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="webNote.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kayıt Ol</title>
    <link href="Content/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-light bg-light">
            <h4>Kayıt Ol</h4>
            <asp:HyperLink ID="HyperLink1"  class="btn btn-outline-success my-2 my-sm-0" NavigateUrl="~/Login.aspx" runat="server">Giriş Yap</asp:HyperLink>
        </nav>
        <div class="card">
            <div class="card-body">
                <asp:Label ID="Label1" runat="server" Text="Ad: "></asp:Label>
                <br />
                <asp:TextBox ID="ad" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ad" ErrorMessage="Ad Boş Geçilemez!"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Soyad: "></asp:Label>
                <br />
                <asp:TextBox ID="soyad" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="soyad" ErrorMessage="Soyad Boş Geçilemez!"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="Label3" runat="server" Text="E-Mail: "></asp:Label>
                <br />
                <asp:TextBox ID="email" TextMode="Email" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="E-Mail yanlış biçimde!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="email" ErrorMessage="E-Mail Boş Geçilemez!"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="Label4" runat="server" Text="Şifre: "></asp:Label>
                <br />
                <asp:TextBox ID="sifre" TextMode="Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="sifre" ErrorMessage="Şifre Boş Bıraklamaz!"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="Label5" runat="server" Text="Şifre Tekrar: "></asp:Label>
                <br />
                <asp:TextBox ID="sifreT" TextMode="Password" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" ControlToCompare="sifre" ControlToValidate="sifreT" runat="server" ErrorMessage="Şifreler Aynı Değil!"></asp:CompareValidator>
                <br /><br />
                <asp:Button ID="kayit" runat="server" class="btn btn-success" Text="Kayıt Ol" OnClick="kayit_Click" />
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" />
            </div>
        </div>
    </form>
    <script src="Content/js/bootstrap.min.js"></script>
</body>
</html>
