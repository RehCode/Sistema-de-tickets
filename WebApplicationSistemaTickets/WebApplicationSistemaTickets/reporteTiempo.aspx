<%@ Page Title="" Language="C#" MasterPageFile="~/MasterReportes.Master" AutoEventWireup="true" CodeBehind="reporteTiempo.aspx.cs" Inherits="WebApplicationSistemaTickets.reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitulo" runat="server">
    <h1 class="page-header">Frecuencia de tickets</h1>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="row">
            <div class="col-md-4">
                <h3>Frecuencia por hora</h3>
                <asp:Chart ID="ChartHorasFrecuencia" runat="server">
                    <Series>
                        <asp:Series ChartType="Point" Name="Series1" YValuesPerPoint="6">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
            <div class="col-md-4">
                <h3>Frecuencia por semana</h3>
                <asp:Chart ID="ChartSemanaFrecuencia" runat="server">
                    <Series>
                        <asp:Series ChartType="Bar" Name="Series1" YValuesPerPoint="2">
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
                <asp:Chart ID="ChartMesFrecuencia" runat="server">
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

    </div>
    <div>
        <h1 class="page-header">Solucion en minutos por mes</h1>
        <div class="row">
            <div class="col-md-6">
                <h3>Promedio</h3>
                <asp:Chart ID="ChartPromedioMinutos" runat="server">
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
            <div class="col-md-6">
                <h3>Valor maximo</h3>
                <asp:Chart ID="ChartMaximoMinutos" runat="server">
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
    </div>
</asp:Content>
