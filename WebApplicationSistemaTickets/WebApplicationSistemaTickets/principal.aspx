<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="principal.aspx.cs" Inherits="WebApplicationSistemaTickets.principal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sistema de tickets</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/nuevoTicket.aspx">Nuevo  Ticket</asp:HyperLink>
        </div>
        <p>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/administrador.aspx">Administrar</asp:HyperLink>
        </p>
    </form>
</body>
</html>
