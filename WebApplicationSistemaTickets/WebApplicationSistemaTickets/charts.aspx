<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="charts.aspx.cs" Inherits="WebApplicationSistemaTickets.charts" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSourceTesting" Height="336px" Width="453px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="categoria" XValueType="String" YValueMembers="cantidad">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Frecuencia">
                        </AxisY>
                        <AxisX IsInterlaced="True" IsLabelAutoFit="False" LabelAutoFitMinFontSize="5" Title="Categorias">
                            <LabelStyle Angle="-90" Interval="1" />
                        </AxisX>
                    </asp:ChartArea>
                </ChartAreas>
                <Titles>
                    <asp:Title Name="Title1" Text="uninnniin">
                    </asp:Title>
                </Titles>
            </asp:Chart>
            <asp:SqlDataSource
                ID="SqlDataSourceTesting" runat="server"
                ConnectionString="<%$ ConnectionStrings:MyConnection %>"
                SelectCommand="select COUNT(tickets.categoria_id) as cantidad, tickets.categoria_id, categorias.categoria
                from tickets join categorias
                on tickets.categoria_id=categorias.categoria_id
                where tickets.solucionado=1 and DATEPART(MONTH, fecha)=2
                group by tickets.categoria_id, categorias.categoria
                order by categorias.categoria"></asp:SqlDataSource>
        </div>


        <div>
        </div>

        <div>
            <asp:DropDownList ID="DropDownListMeses" runat="server" OnSelectedIndexChanged="DropDownListMeses_SelectedIndexChanged">
                <asp:ListItem Value="1">Enero</asp:ListItem>
                <asp:ListItem Value="2">Febrero</asp:ListItem>
                <asp:ListItem Value="3">Marzo</asp:ListItem>
                <asp:ListItem Value="4">Mayo</asp:ListItem>
                <asp:ListItem Value="5">Abril</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="ButtonMes" runat="server" OnClick="ButtonMes_Click" Text="Mostrar" />

        </div>
        <asp:Chart ID="ChartFinal" runat="server">
            <series>
                <asp:Series Name="Series1">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
    </form>
</body>
</html>
