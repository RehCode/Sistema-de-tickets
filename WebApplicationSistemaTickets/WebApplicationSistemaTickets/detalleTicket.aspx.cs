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
    public partial class detalleTicket : System.Web.UI.Page
    {
        int ticket_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ticket_id = (int)Session["ticket_id"];
                using (SqlConnection conexionDB = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString))
                {
                    string query = "SELECT [titulo]"
                                + " ,[descripcion]"
                                + " ,[departamentos].[departamento]"
                                + " ,[nombre_interesado]"
                                + " ,[categoria_id]"
                                + " ,[responsable_id]"
                                + " ,[solucionado]"
                                + " ,[comentario_tecnico]"
                                + "  FROM tickets"
                                + "  inner join departamentos on tickets.departamento_id = departamentos.departamento_id"
                                + "  where ticket_id=@ticket_id";
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

                    TextBoxComentario.Text = (fila["comentario_tecnico"] == DBNull.Value) ? string.Empty : fila["comentario_tecnico"].ToString();
                    CheckBoxSolucionado.Checked = false;
                }
            }
        }
    }
}