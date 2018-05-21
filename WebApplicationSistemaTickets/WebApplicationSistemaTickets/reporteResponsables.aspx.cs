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
    public partial class reporteResponsables : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargaFrecuencias();
            }
        }

        protected void cargaFrecuencias()
        {
            int responsable_id = DropDownListResponsable.SelectedIndex + 1;
            int numMes = Convert.ToInt32(DropDownListMes.SelectedValue);
            using (SqlConnection conexionDB = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString))
            {

                SqlCommand cmd = new SqlCommand("estadisticasResponsables", conexionDB);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@numMes", numMes);
                cmd.Parameters.AddWithValue("@responsable_id", responsable_id);
                conexionDB.Open();
                cmd.ExecuteNonQuery();

                SqlDataAdapter adaptador = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adaptador.Fill(ds);
                DataTable tbTotal = ds.Tables[0];
                DataTable tbMes = ds.Tables[1];
                DataTable tbPromedio = ds.Tables[2];
                DataTable tbSolMes = ds.Tables[3];
                DataTable tbSolCategoria = ds.Tables[4];

                ChartTotal.DataSource = tbTotal;
                ChartTotal.Series[0].XValueMember = "nombre";
                ChartTotal.Series[0].YValueMembers = "cantidad";
                ChartTotal.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
                ChartTotal.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
                ChartTotal.ChartAreas[0].AxisY.Title = "Numero de tickets";
                ChartTotal.DataBind();

                ChartTotalMes.DataSource = tbMes;
                ChartTotalMes.Series[0].XValueMember = "nombre";
                ChartTotalMes.Series[0].YValueMembers = "cantidad";
                ChartTotalMes.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
                ChartTotalMes.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
                ChartTotalMes.ChartAreas[0].AxisY.Title = "Numero de tickets";
                ChartTotalMes.DataBind();

                // por responsable
                DataRow row = tbPromedio.Rows[0];
                lblPromedioMinutos.Text = Convert.ToString(row["promedioMinutos"]);

                ChartMesResponsable.DataSource = tbSolMes;
                ChartMesResponsable.Series[0].XValueMember = "mes";
                ChartMesResponsable.Series[0].YValueMembers = "solucionados";
                ChartMesResponsable.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
                ChartMesResponsable.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
                ChartMesResponsable.ChartAreas[0].AxisY.Title = "Numero de tickets";
                ChartMesResponsable.DataBind();

                ChartCategoria.DataSource = tbSolCategoria;
                ChartCategoria.Series[0].XValueMember = "categoria";
                ChartCategoria.Series[0].YValueMembers = "cantidad";
                ChartCategoria.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
                ChartCategoria.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
                ChartCategoria.ChartAreas[0].AxisY.Title = "Numero de tickets";
                ChartCategoria.DataBind();

            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            cargaFrecuencias();
        }

        protected void ButtonMotrarMes_Click(object sender, EventArgs e)
        {
            cargaFrecuencias();
        }
    }
}