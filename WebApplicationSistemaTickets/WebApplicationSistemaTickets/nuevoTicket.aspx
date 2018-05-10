<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nuevoTicket.aspx.cs" Inherits="WebApplicationSistemaTickets.nuevoTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nuevo Ticket</title>
</head>
<body>
    <h2>Nuevo ticket</h2>
    <form id="form1" runat="server">

        <div>
            <asp:Label ID="lbInfoTitulo" runat="server" Text="Titulo:"></asp:Label>
            <asp:TextBox ID="TextBoxTitulo" runat="server"></asp:TextBox>
        </div>

        <p>
            <asp:Label ID="lblInfoDescripcion" runat="server" Text="Descripcion:"></asp:Label>
            <asp:TextBox ID="TextBoxDescripcion" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label Text="Departamento" runat="server" />
            <asp:DropDownList ID="DropDownListDepartamentos" runat="server">
            </asp:DropDownList>
        </p>
        <p>
            <asp:Label Text="Interesado" runat="server" />
            <asp:TextBox ID="TextBoxInteresado" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label Text="Categoria" runat="server" />
            <asp:DropDownList ID="DropDownListCategorias" runat="server">
            </asp:DropDownList>
        </p>
        <p>
            <asp:Button ID="ButtonEnviar" runat="server" Text="Enviar" OnClick="ButtonEnviar_Click" />
        </p>
        <asp:Label ID="LabelError" runat="server" Text="Error:"></asp:Label>
    </form>
</body>
</html>
