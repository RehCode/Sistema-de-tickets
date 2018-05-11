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
    public partial class administrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonTodos_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexionDB = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString))
            {
                string query = "select * from tickets";
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
    }
}