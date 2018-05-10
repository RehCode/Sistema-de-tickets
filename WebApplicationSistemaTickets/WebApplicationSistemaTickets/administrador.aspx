<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="administrador.aspx.cs" Inherits="WebApplicationSistemaTickets.administrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administrador</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblInfoMostrar" runat="server" Text="Mostrar"></asp:Label>
        </div>
        <asp:Button ID="ButtonTodos" runat="server" Text="Todos" />
        <asp:Button ID="ButtonSinAsignar" runat="server" Text="Sin asignar" />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
