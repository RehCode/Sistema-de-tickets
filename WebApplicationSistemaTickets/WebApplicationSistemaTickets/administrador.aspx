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
        <asp:Button ID="ButtonTodos" runat="server" Text="Todos" OnClick="ButtonTodos_Click" />
        <asp:Button ID="ButtonSinAsignar" runat="server" Text="Sin asignar" />
        <asp:GridView ID="GridViewTickets" runat="server">
        </asp:GridView>

        <div>
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/nuevoTicket.aspx">Nuevo Ticket</asp:HyperLink>
        <p>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/responsable.aspx">Responsables</asp:HyperLink>
        </p>
        <p>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/administrador.aspx">Administrar</asp:HyperLink>
        </p>
        </div>


    </form>
</body>
</html>
