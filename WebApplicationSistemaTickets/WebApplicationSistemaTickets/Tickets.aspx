<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="WebApplicationSistemaTickets.Tickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <div class="container">
        <div class="page-header">
            <h1>Tabla de Tickets</h1>
        </div>
        <div class="panel">
            <div class="panel-body">
                <div class="col-lg-4">

                    <label for="ButtonTodos">Tickets sin solucion:</label><br />
                    <asp:Button ID="ButtonTodos" runat="server" Text="Mostrar" OnClick="ButtonTodos_Click" />
                </div>
                <div class="col-md-4">
                    <label for="DropDownListResponsable">Responsable:</label>
                    <asp:SqlDataSource
                        ID="SqlDataSourceResponsables" runat="server"
                        ConnectionString="<%$ ConnectionStrings:MyConnection%>"
                        SelectCommand="SELECT responsable_id, nombre from responsables"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownListResponsable" runat="server" DataSourceID="SqlDataSourceResponsables" DataTextField="nombre" DataValueField="responsable_id" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:Button ID="ButtonResponsable" runat="server" Text="Mostrar" OnClick="ButtonResponsable_Click" />
                </div>
            </div>
        </div>
        <div class="panel">
            <div class="panel-heading">
                <div class="lead">
                    <asp:Label Text="Mostrando" runat="server" ID="lblMostrando" />
                    <asp:Label Text="0" runat="server" ID="lblContador" CssClass="badge" />
                </div>
            </div>
            <div class="panel-body">
                <asp:GridView ID="GridViewTickets" runat="server" PageSize="5" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridViewTickets_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="GridViewTickets_PageIndexChanging">
                </asp:GridView>

            </div>
        </div>
    </div>

</asp:Content>
