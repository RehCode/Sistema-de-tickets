<%@ Page Title="" Language="C#" MasterPageFile="~/MasterReportes.Master" AutoEventWireup="true" CodeBehind="reporteDepartamentos.aspx.cs" Inherits="WebApplicationSistemaTickets.reporteDepartamentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitulo" runat="server">
    <h1 class="page-header">Tickets resueltos por Departamento</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-4">
            <h3>Totales</h3>
        </div>
        <div class="col-md-4">
            <h3>Frecuencia por mes</h3>
        </div>
    </div>
</asp:Content>
