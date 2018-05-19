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
    public partial class Tickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonTodos_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexionDB = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString))
            {
                string query = "SELECT top (200) [ticket_id] as ID"
                            + " ,[titulo]"
                            + " ,[descripcion]"
                            + " ,[fecha]"
                            + " ,[departamentos].[departamento]"
                            + " ,[nombre_interesado]"
                            + " ,[categorias].[categoria]"
                            + " ,[responsables].[nombre] as responsable"
                            + "  FROM ((tickets"
                            + "  inner join departamentos on tickets.departamento_id = departamentos.departamento_id)"
                            + "  inner join categorias on tickets.categoria_id = categorias.categoria_id"
                            + "  ) inner join responsables on tickets.responsable_id = responsables.responsable_id"
                            + "  where solucionado=1"
                            + "  order by fecha asc";
                SqlCommand cmd = new SqlCommand(query);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conexionDB;
                conexionDB.Open();

                SqlDataAdapter adaptador = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adaptador.Fill(ds);
                GridViewTickets.AutoGenerateColumns = true;
                GridViewTickets.DataSource = ds.Tables[0];
                GridViewTickets.DataBind();
            }
        }


        protected void GridViewTickets_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewTickets.PageIndex = e.NewPageIndex;
            GridViewTickets.DataBind();
        }
    }
}