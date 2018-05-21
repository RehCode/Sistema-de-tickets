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
    public partial class reporteCategorias : System.Web.UI.Page
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
            int numMes = Convert.ToInt32(DropDownListMes.SelectedValue);
            using (SqlConnection conexionDB = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString))
            {

                SqlCommand cmd = new SqlCommand("estadisticasCategorias", conexionDB);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@numMes", numMes);
                conexionDB.Open();
                cmd.ExecuteNonQuery();

                SqlDataAdapter adaptador = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adaptador.Fill(ds);
                DataTable tbTotal = ds.Tables[0];
                DataTable tbMes = ds.Tables[1];

                ChartTotal.DataSource = tbTotal;
                ChartTotal.Series[0].XValueMember = "categoria";
                ChartTotal.Series[0].YValueMembers = "cantidad";
                ChartTotal.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
                ChartTotal.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
                ChartTotal.ChartAreas[0].AxisY.Title = "Numero de tickets";
                ChartTotal.DataBind();

                ChartTotalMes.DataSource = tbMes;
                ChartTotalMes.Series[0].XValueMember = "categoria";
                ChartTotalMes.Series[0].YValueMembers = "cantidad";
                ChartTotalMes.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
                ChartTotalMes.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
                ChartTotalMes.ChartAreas[0].AxisY.Title = "Numero de tickets";
                ChartTotalMes.DataBind();

            }
        }

        protected void ButtonMotrarMes_Click(object sender, EventArgs e)
        {
            cargaFrecuencias();
        }
    }
}