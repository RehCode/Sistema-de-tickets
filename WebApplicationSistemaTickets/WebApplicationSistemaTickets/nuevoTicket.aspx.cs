﻿using System;
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
                errores.Append("Se requiere titulo");
                errores.Append("<br>");
            }
            if (descripcion.Equals(""))
            {
                errores.Append("Se requiere descripcion");
                errores.Append("<br>");
            }
            if (departamento_id == 1)
            {
                errores.Append("Se requiere especificar un departamento");
                errores.Append("<br>");
            }
            if (interesado.Equals(""))
            {
                errores.Append("Se requiere nombre del interesado");
                errores.Append("<br>");
            }
            if (categoria_id == 1)
            {
                errores.Append("Se requiere especificar una categoria");
                errores.Append("<br>");
            }

            if (errores.Length == 0)
            {
                LabelError.Text = "Ticket enviado";
            } else
            {
                LabelError.Text = errores.ToString();
            }
            
        }
    }
}