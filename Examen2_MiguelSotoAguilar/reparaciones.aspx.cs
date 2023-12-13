using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen2_MiguelSotoAguilar
{
    public partial class reparaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                LlenarGrid();
            }

        }

        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("CONSULTAR_REPARACIONES"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            datagrid.DataSource = dt;
                            datagrid.DataBind();  // refrescar
                        }
                    }
                }
            }
        }

        public void alertas(String texto)
        {
            string message = texto;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

        }

       

        protected void Button1_Click1(object sender, EventArgs e)
        {

            int resultado = Clases.reparaciones.AgregarReparacion(Int16.Parse(txt_equipoID.Text), DateTime.Parse(txt_FechaSolicitud.Text), char.Parse(txt_Estado.Text));

            if (resultado > 0)
            {
                alertas("Reparación ingresada con exito");
                txt_equipoID.Text = string.Empty;
                txt_FechaSolicitud.Text = string.Empty;
                txt_Estado.Text = string.Empty;
                LlenarGrid();


            }
            else
            {
                alertas("Error al ingresar reparación");
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            int resultado = Clases.reparaciones.BorrarrReparacion(Int16.Parse(txt_codigo.Text));
            if (resultado > 0)
            {
                alertas("Reparación borrada con exito");
                txt_codigo.Text = string.Empty;
                LlenarGrid();


            }
            else
            {
                alertas("Error al borrar reparación");
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int resultado = Clases.reparaciones.ModificarReparacion(Int16.Parse(txt_codigo.Text), DateTime.Parse(txt_FechaSolicitud.Text), char.Parse(txt_Estado.Text),int.Parse(txt_equipoID.Text));
            if (resultado > 0)
            {
                alertas("Reparación modificada con exito");
                txt_codigo.Text = string.Empty;
                txt_FechaSolicitud.Text = string.Empty;
                txt_Estado.Text = string.Empty;
                txt_equipoID.Text = string.Empty;
                LlenarGrid();


            }
            else
            {
                alertas("Error al modificar reparación");
            }

        }

        protected void BtnConsulta_Click(object sender, EventArgs e)
        {
            int codigo = int.Parse(txt_codigo.Text);
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM reparaciones WHERE reparacion_id ='" + codigo + "'"))


                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        datagrid.DataSource = dt;
                        datagrid.DataBind();  // actualizar el grid view
                    }
                }
            }

        }
    }
}