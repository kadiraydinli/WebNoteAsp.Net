<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notes.aspx.cs" Inherits="webNote.Listele" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Notlarım</title>
    <link href="Content/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-light bg-light">
            <h4>Web Note - Notlarım</h4><asp:Label ID="txt" runat="server" Text="Label"></asp:Label>
            <div class="my-2 my-sm-0">
                <asp:HyperLink ID="HyperLink1" class="btn btn-success" NavigateUrl="~/Admin.aspx" runat="server">Yeni Not Oluştur</asp:HyperLink>
                <asp:Button ID="exit" class="btn btn-danger" runat="server" Text="Çıkış Yap" OnClick="exit_Click" />
            </div>
        </nav>
        <div class="card">
            <div class="card-body">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="card text-white bg-<%#Eval("color") %> mb-3" style="max-width: 18rem;">
                          <div class="card-header">
                              <%#Eval("titles") %>
                              <a href="Admin.aspx?id=<%#Eval("id") %>" style="float:right"><img src="Content/icon/duzenle.png" width="20" height="20" /></a>
                              <a href="Notes.aspx?id=<%#Eval("id") %>" style="float:right"><img src="Content/icon/sil.png" width="20" height="20" /></a>
                          </div>
                          <div class="card-body">
                            <p class="card-text"><%#Eval("notes") %></p>
                          </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
    <script src="Content/js/bootstrap.min.js"></script>
</body>
</html>
