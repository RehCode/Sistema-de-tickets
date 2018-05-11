<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="responsable.aspx.cs" Inherits="WebApplicationSistemaTickets.responsable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h2>Asignacion y actualizacion de tickets</h2>
    <form id="form1" runat="server">
        
        <div>
            <asp:Button ID="ButtonSinSolucion" runat="server" Text="Mostrar" OnClick="ButtonSinSolucion_Click" />
            <asp:GridView ID="GridViewTickets" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridViewTickets_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
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
        <div>
            <h2>Actualizar</h2>
            <p>
                <asp:Label runat="server" Text="Titulo:"></asp:Label>
                <asp:Label ID="lblTitulo" runat="server" Text="Titulo:"></asp:Label>
            </p>

            <p>
                <asp:Label runat="server" Text="Descripcion:"></asp:Label>
                <asp:Label ID="lblDescripcion" runat="server" Text="Descripcion"></asp:Label>
            </p>
            <p>
                <asp:Label Text="Departamento:" runat="server" />
                <asp:Label ID="lblDepartamento" runat="server" Text="Departamento"></asp:Label>
            </p>
            <p>
                <asp:Label Text="Nombre interesado:" runat="server" />
                <asp:Label ID="lblInteresado" runat="server" Text="Interesado"></asp:Label>
            </p>
            <p>
                <asp:Label Text="Categoria" runat="server" />
                <asp:SqlDataSource 
                    ID="SqlDataSourceCategorias" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyConnection%>"
                    SelectCommand="SELECT categoria_id, categoria from categorias">
                </asp:SqlDataSource>

                <asp:DropDownList ID="DropDownListCategorias" runat="server" DataSourceID="SqlDataSourceCategorias" DataTextField="categoria" DataValueField="categoria_id">
                </asp:DropDownList>
                
            </p>
            <p>
                <asp:CheckBox ID="CheckBoxSolucionado" runat="server" Text="Solucionado" />

            </p>
            <p>
               <asp:SqlDataSource 
                    ID="SqlDataSourceResponsables" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyConnection%>"
                    SelectCommand="SELECT responsable_id, nombre from responsables">
                </asp:SqlDataSource>
                <asp:Label Text="Responsable:" runat="server" />
                <asp:DropDownList ID="DropDownListResponsable" runat="server" DataSourceID="SqlDataSourceResponsables" DataTextField="nombre" DataValueField="responsable_id">
                </asp:DropDownList>
            </p>
            <p>
                <asp:Label Text="Comentario Tecnico:" runat="server" />
                <asp:TextBox runat="server" ID="TextBoxComentario" />
            </p>
            <p>
                <asp:Button ID="ButtonEnviar" runat="server" Text="Enviar" OnClick="ButtonEnviar_Click" />
            </p>
            <asp:Label ID="LabelError" runat="server" Text="Error:"></asp:Label>
        </div>

    </form>
</body>
</html>
