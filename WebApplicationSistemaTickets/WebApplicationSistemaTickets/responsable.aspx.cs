using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplicationSistemaTickets
{
    public partial class responsable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSinSolucion_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexionDB = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString))
            {
                string query = "SELECT [ticket_id]"
                            + " ,[titulo]"
                            + " ,[descripcion]"
                            + " ,[fecha]"
                            + " ,[departamentos].[departamento]"
                            + " ,[nombre_interesado]"
                            + " ,[categorias].[categoria]"
                            + " ,[responsables].[nombre]"
                            + "  FROM ((tickets"
                            + "  inner join departamentos on tickets.departamento_id = departamentos.departamento_id)"
                            + "  inner join categorias on tickets.categoria_id = categorias.categoria_id"
                            + "  ) inner join responsables on tickets.responsable_id = responsables.responsable_id"
                            + "  where solucionado=0"
                            + "  order by fecha asc";
                SqlCommand cmd = new SqlCommand(query);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conexionDB;
                conexionDB.Open();

                SqlDataAdapter adaptador = new SqlDataAdapter(cmd);
                DataTable tabla = new DataTable();
                adaptador.Fill(tabla);
                GridViewTickets.AutoGenerateColumns = true;
                GridViewTickets.DataSource = tabla;
                GridViewTickets.DataBind();
            }
        }

        protected void GridViewTickets_SelectedIndexChanged(object sender, EventArgs e)
        {
            int ticket_id = Convert.ToInt32(GridViewTickets.SelectedRow.Cells[1].Text);

            using (SqlConnection conexionDB = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString))
            {
                string query = "SELECT [ticket_id]"
                            + " ,[titulo]"
                            + " ,[descripcion]"
                            + " ,[departamentos].[departamento]"
                            + " ,[nombre_interesado]"
                            + " ,[categorias].[categoria_id]"
                            + " ,[responsable_id]"
                            + "  FROM ((tickets"
                            + "  inner join departamentos on tickets.departamento_id = departamentos.departamento_id)"
                            + "  inner join categorias on tickets.categoria_id = categorias.categoria_id"
                            + "  )"
                            + "  where ticket_id=@ticket_id"
                            + "  order by fecha asc";
                SqlCommand cmd = new SqlCommand(query);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@ticket_id", ticket_id);
                cmd.Connection = conexionDB;
                conexionDB.Open();

                SqlDataAdapter adaptador = new SqlDataAdapter(cmd);
                DataTable tabla = new DataTable();
                adaptador.Fill(tabla);
                DataRow fila = tabla.Rows[0];
                lblTitulo.Text = (string)fila["titulo"];
                lblDescripcion.Text = (string)fila["descripcion"];
                lblDepartamento.Text = (string)fila["departamento"];
                lblInteresado.Text = (string)fila["nombre_interesado"];

                DropDownListCategorias.SelectedIndex = (int)fila["categoria_id"] - 1;
                DropDownListResponsable.SelectedIndex = (int)fila["responsable_id"] - 1;

            }
        }
    }
}