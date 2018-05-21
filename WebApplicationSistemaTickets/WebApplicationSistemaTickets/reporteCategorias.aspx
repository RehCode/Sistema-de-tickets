<%@ Page Title="" Language="C#" MasterPageFile="~/MasterReportes.Master" AutoEventWireup="true" CodeBehind="reporteCategorias.aspx.cs" Inherits="WebApplicationSistemaTickets.reporteCategorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitulo" runat="server">
    <h1 class="page-header">Tickets resueltos por Categoria</h1>
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
</asp:Content>
