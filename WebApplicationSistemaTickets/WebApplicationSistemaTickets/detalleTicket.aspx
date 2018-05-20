<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="detalleTicket.aspx.cs" Inherits="WebApplicationSistemaTickets.detalleTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <div class="container">
        <div class="page-header">
            <h1>Asignacion y modificacion de Ticket</h1>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label for="lblTitulo">Titulo:</label>
                <asp:Label ID="lblTitulo" runat="server" Text="Primer ticket"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label for="lblDescripcion">Descripcion:</label>
                <asp:Label ID="lblDescripcion" runat="server" Text="Evaluando el sistema, ticket enviado desde web"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-4">
                <label for="lblInteresado">Interesado:</label>
                <asp:Label ID="lblInteresado" runat="server" Text="Ramon ramirez"></asp:Label>

            </div>
            <div class="form-group col-md-4">
                <label for="lblDepartamento">Departamento:</label>
                <asp:Label ID="lblDepartamento" runat="server" Text="Contabilidad"></asp:Label>
            </div>
        </div>
        <h2>Actualizar</h2>

        <div class="row">
            <div class="form-group col-md-4">
                <label for="DropDownListResponsable">Responsable:</label>
                <asp:SqlDataSource
                    ID="SqlDataSourceResponsables" runat="server"
                    ConnectionString="<%$ ConnectionStrings:MyConnection%>"
                    SelectCommand="SELECT responsable_id, nombre from responsables"></asp:SqlDataSource>
                <asp:DropDownList ID="DropDownListResponsable" runat="server" DataSourceID="SqlDataSourceResponsables" DataTextField="nombre" DataValueField="responsable_id" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <div class="form-group col-md-4">
                <label for="DropDownListCategorias">Categoria:</label>
                <asp:SqlDataSource
                    ID="SqlDataSourceCategorias" runat="server"
                    ConnectionString="<%$ ConnectionStrings:MyConnection%>"
                    SelectCommand="SELECT categoria_id, categoria from categorias"></asp:SqlDataSource>
                <asp:DropDownList ID="DropDownListCategorias" runat="server" DataSourceID="SqlDataSourceCategorias" DataTextField="categoria" DataValueField="categoria_id" CssClass="form-control">
                </asp:DropDownList>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-6">
                <label for="TextBoxComentario">Comentario tecnico:</label>
                <asp:TextBox runat="server" ID="TextBoxComentario" CssClass="form-control" Rows="3" TextMode="MultiLine" />
            </div>
            <div class="row">
                <div class="form-group col-md-4">
                    <label for="CheckBoxSolucionado" class="control-label">Solucionado:</label><br />
                    <asp:CheckBox ID="CheckBoxSolucionado" runat="server" />
                </div>
                <div class="form-group col-md-4">
                    <asp:Button ID="ButtonEnviar" runat="server" Text="Enviar" CssClass="btn btn-default" OnClick="ButtonEnviar_Click" />
                </div>
            </div>
        </div>

        <asp:Panel ID="PanelError" runat="server" CssClass="alert alert-warning" Visible="False">
            <asp:Label ID="Label1" runat="server" Text="Error:"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="PanelExito" runat="server" CssClass="alert alert-success" Visible="False">
            <asp:Label ID="LabelExito" runat="server" Text="Error:"></asp:Label>
        </asp:Panel>
    </div>
</asp:Content>
