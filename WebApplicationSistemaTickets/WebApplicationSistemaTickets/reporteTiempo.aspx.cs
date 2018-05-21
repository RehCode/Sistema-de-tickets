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
    public partial class reportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargaFrecuencias();
        }

        protected void cargaFrecuencias()
        {
            using (SqlConnection conexionDB = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString))
            {

                SqlCommand cmd = new SqlCommand("estadisticasFrecuenciaTiempo", conexionDB);
                cmd.CommandType = CommandType.StoredProcedure;
                conexionDB.Open();
                cmd.ExecuteNonQuery();

                SqlDataAdapter adaptador = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adaptador.Fill(ds);
                DataTable tbHoras = ds.Tables[0];
                DataTable tbSemanas = ds.Tables[1];
                DataTable tbMes = ds.Tables[2];
                DataTable tbMinutos = ds.Tables[3];

                ChartHorasFrecuencia.DataSource = tbHoras;
                ChartHorasFrecuencia.Series[0].XValueMember = "hora";
                ChartHorasFrecuencia.Series[0].YValueMembers = "Frecuencia";
                
                ChartHorasFrecuencia.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
                ChartHorasFrecuencia.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
                ChartHorasFrecuencia.ChartAreas[0].AxisY.Title = "Numero de tickets";
                ChartHorasFrecuencia.DataBind();

                ChartSemanaFrecuencia.DataSource = tbSemanas;
                ChartSemanaFrecuencia.Series[0].XValueMember = "diaSemana";
                ChartSemanaFrecuencia.Series[0].YValueMembers = "Frecuencia";
                ChartSemanaFrecuencia.Series[0].ChartType = SeriesChartType.Pie;
                //ChartSemanaFrecuencia.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
                ChartSemanaFrecuencia.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
                ChartSemanaFrecuencia.ChartAreas[0].AxisY.Title = "Numero de tickets";
                ChartSemanaFrecuencia.DataBind();

                ChartMesFrecuencia.DataSource = tbMes;
                ChartMesFrecuencia.Series[0].XValueMember = "mes";
                ChartMesFrecuencia.Series[0].YValueMembers = "Frecuencia";
                ChartMesFrecuencia.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
                ChartMesFrecuencia.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
                ChartMesFrecuencia.ChartAreas[0].AxisY.Title = "Numero de tickets";
                ChartMesFrecuencia.DataBind();

                // Solucion en minutos por mes
                ChartPromedioMinutos.DataSource = tbMinutos;
                ChartPromedioMinutos.Series[0].XValueMember = "nombreMes";
                ChartPromedioMinutos.Series[0].YValueMembers = "promedioMinutos";
                ChartPromedioMinutos.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
                ChartPromedioMinutos.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
                ChartPromedioMinutos.ChartAreas[0].AxisY.Title = "Minutos";
                ChartPromedioMinutos.DataBind();

                ChartMaximoMinutos.DataSource = tbMinutos;
                ChartMaximoMinutos.Series[0].XValueMember = "nombreMes";
                ChartMaximoMinutos.Series[0].YValueMembers = "maximo";
                ChartMaximoMinutos.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
                ChartMaximoMinutos.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
                ChartMaximoMinutos.ChartAreas[0].AxisY.Title = "Minutos";
                ChartMaximoMinutos.DataBind();
            }
        }
    }
}