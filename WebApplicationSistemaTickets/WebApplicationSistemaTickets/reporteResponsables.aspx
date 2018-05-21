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
            <asp:Chart ID="ChartTotal" runat="server">
                <Series>
                    <asp:Series Name="Series1">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>
        <div class="col-md-4">
            <h3>Frecuencia por mes</h3>
            <asp:DropDownList ID="DropDownListMes" runat="server">
                <asp:ListItem Value="1">Enero</asp:ListItem>
                <asp:ListItem Value="2">Febrero</asp:ListItem>
                <asp:ListItem Value="3">Marzo</asp:ListItem>
                <asp:ListItem Value="4">Mayo</asp:ListItem>
                <asp:ListItem Value="5">Abril</asp:ListItem>
                </asp:DropDownList>
                <asp:Button runat="server" Text="Mostrar" OnClick="ButtonMotrarMes_Click" />
            <asp:Chart ID="ChartTotalMes" runat="server">
                <Series>
                    <asp:Series Name="Series1">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>
    </div>
    <h1 class="page-header">Responsable</h1>

        <div class="form-group col-md-6">
            <label for="DropDownListResponsable">Nombre:</label>
            <asp:SqlDataSource
                ID="SqlDataSourceResponsables" runat="server"
                ConnectionString="<%$ ConnectionStrings:MyConnection%>"
                SelectCommand="SELECT responsable_id, nombre from responsables"></asp:SqlDataSource>
            <asp:DropDownList ID="DropDownListResponsable" runat="server" DataSourceID="SqlDataSourceResponsables" DataTextField="nombre" DataValueField="responsable_id" CssClass="form-control">
            </asp:DropDownList>
            <asp:Button Text="Mostrar" runat="server" OnClick="Unnamed1_Click" />
        </div>
    <div class="row">
        <div class="col-md-4">
            <h4>Promedio en <strong>minutos</strong> ticket resuelto: <asp:Label Text="170" runat="server" CssClass="badge" ID="lblPromedioMinutos" /></h4>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <h3>Por mes</h3>
            <asp:Chart ID="ChartMesResponsable" runat="server">
                <Series>
                    <asp:Series Name="Series1">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>
        <div class="col-md-4">
            <h3>Por categoria</h3>
            <asp:Chart ID="ChartCategoria" runat="server">
                <Series>
                    <asp:Series Name="Series1">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>
    </div>
</asp:Content>
