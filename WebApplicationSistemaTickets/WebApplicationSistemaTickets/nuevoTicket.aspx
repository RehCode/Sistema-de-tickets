<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nuevoTicket.aspx.cs" Inherits="WebApplicationSistemaTickets.nuevoTicket" MasterPageFile="MasterPage.Master" Title="Nuevo Ticket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">

    <div class="container">
        <div class="page-header">
            <h1>Crear nuevo ticket</h1>
        </div>

        <div class="row">
            <div class="form-group col-md-6">
                <label for="TextBoxTitulo">Titulo</label>
                <asp:TextBox ID="TextBoxTitulo" runat="server" CssClass="form-control" placeholder="Titulo del ticket; descripcion corta"></asp:TextBox>
            </div>
            <div class="form-group col-md-4">
                <label for="DropDownListCategorias" class="control-label">Categoria:</label>
                <asp:DropDownList ID="DropDownListCategorias" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-6">
                <label for="TextBoxDescripcion" class="control-label">Descripcion:</label>
                <asp:TextBox ID="TextBoxDescripcion" runat="server" Rows="7" Columns="8" CssClass="form-control" TextMode="MultiLine" ToolTip="Descripcion detallada del ticket" placeholder="Descripcion detallada del ticket"></asp:TextBox>
            </div>
            <div class="row">
                <div class="form-group col-md-4">
                    <label for="DropDownListDepartamentos">Departamento:</label>
                    <asp:DropDownList ID="DropDownListDepartamentos" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group col-md-4">
                    <label for="TextBoxInteresado" class="control-label">Interesado:</label>
                    <asp:TextBox ID="TextBoxInteresado" runat="server" CssClass="form-control" placeholder="Nombre del interesado"></asp:TextBox>
                </div>

                <div class="form-group col-md-4">
                    <asp:Button ID="ButtonEnviar" runat="server" Text="Enviar" OnClick="ButtonEnviar_Click" CssClass="btn btn-default" />
                </div>
            </div>
        </div>
    </div>




    <asp:Panel ID="PanelError" runat="server" CssClass="alert alert-warning" Visible="False">
        <asp:Label ID="LabelError" runat="server" Text="Error:"></asp:Label>
    </asp:Panel>

    <asp:Panel ID="PanelExito" runat="server" CssClass="alert alert-success" Visible="False">
        <asp:Label ID="LabelExito" runat="server" Text="Error:"></asp:Label>
    </asp:Panel>


</asp:Content>
