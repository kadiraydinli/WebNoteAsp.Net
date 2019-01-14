<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="webNote.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Web Note - Admin Paneli</title>
    <link href="Content/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-light bg-light">
            <h4>Web Note - Admin Paneli</h4>
            <asp:Label ID="txt" runat="server" Text=""></asp:Label>
            <asp:HyperLink class="btn btn-outline-success my-2 my-sm-0" ID="HyperLink1" NavigateUrl="~/Notes.aspx" runat="server">Notlarım</asp:HyperLink>
        </nav>
        <div class="card">
            <div class="card-body">
                <asp:Label ID="Label1" runat="server" Text="Not Başlığı: "></asp:Label>
                <br />
                <asp:TextBox ID="baslik" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="baslik" ErrorMessage="Başlık Giriniz!"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="Label2" runat="server" Width="300" Text="Not: "></asp:Label>
                <br />
                <asp:TextBox ID="not" TextMode="MultiLine" Width="300" Height="300" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="not" ErrorMessage="Not Giriniz!"></asp:RequiredFieldValidator>
                <br /><br />
                <asp:Label ID="Label3" runat="server" Text="Not Rengi: "></asp:Label>
                <asp:DropDownList ID="color" runat="server">
                    <asp:ListItem>Mavi</asp:ListItem>
                    <asp:ListItem>Koyu Gri</asp:ListItem>
                    <asp:ListItem>Yeşil</asp:ListItem>
                    <asp:ListItem>Kırmızı</asp:ListItem>
                    <asp:ListItem>Sarı</asp:ListItem>
                    <asp:ListItem>Turkuaz</asp:ListItem>
                    <asp:ListItem>Siyah</asp:ListItem>
                </asp:DropDownList>
                <br /><br />
                <asp:Button ID="buton" Width="300" class="btn btn-success btn-sm" runat="server" Text="Kaydet" OnClick="buton_Click" />
            </div>
        </div>
    </form>
    <script src="Content/js/bootstrap.min.js"></script>
</body>
</html>
