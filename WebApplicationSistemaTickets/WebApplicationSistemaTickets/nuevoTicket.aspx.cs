using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace WebApplicationSistemaTickets
{
    public partial class nuevoTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection conexionDB = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString))
                {
                    string query = "select departamento_id, departamento from departamentos";
                    SqlCommand cmd = new SqlCommand(query);
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conexionDB;
                    conexionDB.Open();

                    SqlDataAdapter adaptador = new SqlDataAdapter(cmd);
                    DataTable tabla = new DataTable();
                    adaptador.Fill(tabla);

                    DropDownListDepartamentos.DataSource = tabla;
                    DropDownListDepartamentos.DataTextField = "departamento";
                    DropDownListDepartamentos.DataValueField = "departamento_id";
                    DropDownListDepartamentos.DataBind();
 
                }

                using (SqlConnection conexionDB = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString))
                {
                    string query = "select categoria_id, categoria from categorias";
                    SqlCommand cmd = new SqlCommand(query);
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conexionDB;
                    conexionDB.Open();

                    SqlDataAdapter adaptador = new SqlDataAdapter(cmd);
                    DataTable tabla = new DataTable();
                    adaptador.Fill(tabla);

                    DropDownListCategorias.DataSource = tabla;
                    DropDownListCategorias.DataTextField = "categoria";
                    DropDownListCategorias.DataValueField = "categoria_id";
                    DropDownListCategorias.DataBind();
                }
            }

        }

        protected void ButtonEnviar_Click(object sender, EventArgs e)
        {
            string titulo = TextBoxTitulo.Text;
            string descripcion = TextBoxDescripcion.Text;
            int departamento_id = Convert.ToInt32(DropDownListDepartamentos.SelectedItem.Value);
            string interesado = TextBoxInteresado.Text;
            int categoria_id = Convert.ToInt32(DropDownListCategorias.SelectedItem.Value);

            StringBuilder errores = new StringBuilder();

            if (titulo.Equals(""))
            {
                errores.Append("Falta <strong>titulo</strong>");
                errores.Append("<br>");
            }
            if (descripcion.Equals(""))
            {
                errores.Append("Falta <strong>descripcion</strong>");
                errores.Append("<br>");
            }
            if (departamento_id == 1)
            {
                errores.Append("Falta especificar un <strong>departamento</strong>");
                errores.Append("<br>");
            }
            if (interesado.Equals(""))
            {
                errores.Append("Falta nombre del <strong>interesado</strong>");
                errores.Append("<br>");
            }
            if (categoria_id == 1)
            {
                errores.Append("Falta especificar una <strong>categoria</strong>");
                errores.Append("<br>");
            }

            if (errores.Length == 0)
            {
                using (SqlConnection conexionDB = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString))
                {

                    SqlCommand cmd = new SqlCommand("nuevoTicket", conexionDB);
                    cmd.Parameters.AddWithValue("@titulo", titulo);
                    cmd.Parameters.AddWithValue("@descripcion", descripcion);
                    cmd.Parameters.AddWithValue("@departamento_id", departamento_id);
                    cmd.Parameters.AddWithValue("@nombre_interesado", interesado);
                    cmd.Parameters.AddWithValue("@categoria_id", categoria_id);
                    cmd.CommandType = CommandType.StoredProcedure;
                    conexionDB.Open();
                    cmd.ExecuteNonQuery();
                
                    LabelExito.Text = "Ticket <strong>enviado</strong>";
                    PanelExito.Visible = true;
                    PanelError.Visible = false;
                    TextBoxInteresado.Text = "";
                }

            }
            else
            {
                LabelError.Text = errores.ToString();
                PanelError.Visible = true;
                PanelExito.Visible = false;
            }
            
        }
    }
}