using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_C__y_.NET
{
    public partial class DetallesReparacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			LlenarGrid();
        }
        protected void LlenarGrid()
	        {
	            string constr = ConfigurationManager.ConnectionStrings["CONEXIONREPARACIONES"].ConnectionString;
	            using (SqlConnection con = new SqlConnection(constr))
	            using (SqlCommand cmd = new SqlCommand("SELECT * FROM DetallesReparacion", con))
	            {
	                con.Open();
	                using (SqlDataReader rdr = cmd.ExecuteReader())
	                {
	                    GridView1.DataSource = rdr;
	                    GridView1.DataBind();
	                }
	            }
         }

    }
}