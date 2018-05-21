<%@ Page Title="" Language="C#" MasterPageFile="~/MasterReportes.Master" AutoEventWireup="true" CodeBehind="reporteResponsables.aspx.cs" Inherits="WebApplicationSistemaTickets.reporteResponsables" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitulo" runat="server">
    <h1 class="page-header">Tickets resueltos por responsable</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-4">
            <h3>Totales</h3>
        </div>
        <div class="col-md-4">
            <h3>Frecuencia por semana</h3>
        </div>
    </div>
    <h1 class="page-header">Responsable</h1>
    <div class="row">
        <div class="col-md-4">
                <h4>Total de <strong>tickets</strong>: <span class="badge">170</span></h4>
        </div>
        <div class="col-md-4">
            <h4>Promedio en <strong>minutos</strong> ticket resuelto: <span class="badge">38</span></h4>

        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <h3>Por mes</h3>
        </div>
        <div class="col-md-4">
            <h3>Por categoria</h3>
        </div>
    </div>
</asp:Content>
