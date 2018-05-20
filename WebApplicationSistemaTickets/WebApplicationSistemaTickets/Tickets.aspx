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
                <asp:GridView ID="GridViewTickets" runat="server" PageSize="5" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridViewTickets_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="GridViewTickets_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>

            </div>
        </div>
    </div>

</asp:Content>
