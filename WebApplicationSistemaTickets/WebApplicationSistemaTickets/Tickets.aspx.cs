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

        protected int queryTodos()
        {
            using (SqlConnection conexionDB = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString))
            {
                string query = "SELECT top (200) [ticket_id] as ID"
                            + " ,[titulo]"
                            + " ,[descripcion]"
                            + " ,[fecha]"
                            + " ,[departamentos].[departamento]"
                            + " ,[nombre_interesado] as 'nombre del interesado'"
                            + " ,[categorias].[categoria]"
                            + " ,[responsables].[nombre] as responsable"
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
                DataSet ds = new DataSet();
                adaptador.Fill(ds);
                GridViewTickets.AutoGenerateColumns = true;
                GridViewTickets.DataSource = ds.Tables[0];
                GridViewTickets.DataBind();

                return ds.Tables[0].Rows.Count;
            }
        }

        protected int queryResponsable()
        {
            using (SqlConnection conexionDB = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString))
            {
                string query = "SELECT top (200) [ticket_id] as ID"
                            + " ,[titulo]"
                            + " ,[descripcion]"
                            + " ,[fecha]"
                            + " ,[departamentos].[departamento]"
                            + " ,[nombre_interesado] as 'nombre del interesado'"
                            + " ,[categorias].[categoria]"
                            + " ,[responsables].[nombre] as responsable"
                            + "  FROM ((tickets"
                            + "  inner join departamentos on tickets.departamento_id = departamentos.departamento_id)"
                            + "  inner join categorias on tickets.categoria_id = categorias.categoria_id"
                            + "  ) inner join responsables on tickets.responsable_id = responsables.responsable_id"
                            + "  where solucionado=0 and tickets.responsable_id=@responsable_id"
                            + "  order by fecha asc";
                SqlCommand cmd = new SqlCommand(query);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@responsable_id", DropDownListResponsable.SelectedIndex + 1);
                cmd.Connection = conexionDB;
                conexionDB.Open();

                SqlDataAdapter adaptador = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adaptador.Fill(ds);
                GridViewTickets.AutoGenerateColumns = true;
                GridViewTickets.DataSource = ds.Tables[0];
                GridViewTickets.DataBind();

                return ds.Tables[0].Rows.Count;
            }
        }

        protected void GridViewTickets_SelectedIndexChanged(object sender, EventArgs e)
        {
            int ticket_id = Convert.ToInt32(GridViewTickets.SelectedRow.Cells[1].Text);
            Session["ticket_id"] = ticket_id;
            Response.Redirect("detalleTicket.aspx");
        }

        protected void ButtonTodos_Click(object sender, EventArgs e)
        {
            int numeroRows;
            Session["mostrarTodos"] = true;
            numeroRows = queryTodos();
            lblMostrando.Text = "Todos los tickets sin solucion";
            lblContador.Text = Convert.ToString(numeroRows);
        }

        protected void ButtonResponsable_Click(object sender, EventArgs e)
        {
            int numeroRows;
            Session["mostrarTodos"] = false;
            numeroRows = queryResponsable();
            lblMostrando.Text = "Tickets de " + DropDownListResponsable.SelectedItem;
            lblContador.Text = Convert.ToString(numeroRows);
        }

        protected void GridViewTickets_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewTickets.PageIndex = e.NewPageIndex;

            bool mostrarTodos = false;
            mostrarTodos = (bool)Session["mostrarTodos"];
            if (mostrarTodos)
            {
                queryTodos();
            }
            else
            {
                queryResponsable();
            }
        }

    }
}