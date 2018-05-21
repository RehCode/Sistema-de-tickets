using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;

namespace WebApplicationSistemaTickets
{
    public partial class charts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                using (SqlConnection conexionDB = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString))
                {
                    string query = @"select COUNT(tickets.categoria_id) as cantidad, categorias.categoria as categoria
                                from tickets join categorias
                                on tickets.categoria_id = categorias.categoria_id
                                where tickets.solucionado = 1 and DATEPART(MONTH, fecha)=@mesNumero
                                group by tickets.categoria_id, categorias.categoria
                                order by COUNT(tickets.categoria_id)";
                    SqlCommand cmd = new SqlCommand(query);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@mesNumero", 2);
                    cmd.Connection = conexionDB;
                    conexionDB.Open();

                    SqlDataAdapter adaptador = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    adaptador.Fill(ds);
                    DataTable tabla = ds.Tables[0];
                    DataView dataView = new DataView(tabla);

                    ChartFinal.DataSource = tabla;
                    ChartFinal.Series[0].XValueMember = "categoria";
                    ChartFinal.Series[0].YValueMembers = "cantidad";
                    ChartFinal.ChartAreas[0].AxisX.Title = "Test TEst";
                    ChartFinal.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
                    ChartFinal.ChartAreas[0].AxisX.LabelStyle.Interval = 1;

                    ChartFinal.DataBind();

                }
            }
        }

        protected void cargaCategoriaMes()
        {
            int numeroMes = Convert.ToInt32(DropDownListMeses.SelectedValue);

            using (SqlConnection conexionDB = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString))
            {
                string query = @"select COUNT(tickets.categoria_id) as cantidad, categorias.categoria as categoria
                                from tickets join categorias
                                on tickets.categoria_id = categorias.categoria_id
                                where tickets.solucionado = 1 and DATEPART(MONTH, fecha)=@mesNumero
                                group by tickets.categoria_id, categorias.categoria
                                order by categorias.categoria";
                SqlCommand cmd = new SqlCommand(query);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@mesNumero", numeroMes);
                cmd.Connection = conexionDB;
                conexionDB.Open();

                SqlDataAdapter adaptador = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adaptador.Fill(ds);
                DataTable tabla = ds.Tables[0];

                ChartFinal.DataSource = tabla;
                ChartFinal.Series[0].XValueMember = "categoria";
                ChartFinal.Series[0].YValueMembers = "cantidad";
                ChartFinal.ChartAreas[0].AxisX.Title = "Test TEst";
                ChartFinal.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
                ChartFinal.ChartAreas[0].AxisX.LabelStyle.Interval = 1;

                ChartFinal.DataBind();

            }
        }

        protected void DropDownListMeses_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargaCategoriaMes();
        }

        protected void ButtonMes_Click(object sender, EventArgs e)
        {
            cargaCategoriaMes();
        }
    }
}