<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="WebApplicationSistemaTickets.Tickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <div class="container">
        <div class="page-header">
            <h1>Tabla de Tickets</h1>
        </div>
        <p class="lead">
            Mostrar:
            <asp:Button ID="ButtonTodos" runat="server" Text="Todos" OnClick="ButtonTodos_Click" />
            Por responsable:
            <asp:DropDownList runat="server">
                <asp:ListItem Text="Luis" />
                <asp:ListItem Text="Alejandra" />
            </asp:DropDownList>
        </p>
        <asp:GridView ID="GridViewTickets" runat="server" AllowPaging="True" OnPageIndexChanging="GridViewTickets_PageIndexChanging" PageSize="15">
        </asp:GridView>
    </div>

</asp:Content>
