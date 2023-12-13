using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen2_MiguelSotoAguilar
{
    public partial class Asignaciones : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("Asignaciones", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridVDetalleR.DataSource = dt;
                        GridVDetalleR.DataBind();
                    }
                }
            }
        }

        protected void LlenarGridFiltrado()
        {
            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT *  FROM asignaciones"))
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
        protected void Button1_Click(object sender, EventArgs e)
        {
            int resultado = Clases.ClsAsignaciones.AsignarTecnicos(txt_TecnicosID.Text, txt_ReparacionID.Text, Int16.Parse(txt_CodigoUsuario.Text));

            if (resultado > 0)
            {
                alertas("Tecnico asignado con exito");
                txt_TecnicosID.Text = string.Empty;
                txt_ReparacionID.Text = string.Empty;
                txt_CodigoUsuario.Text = string.Empty;
                LlenarGrid();


            }
            else
            {
                alertas("Error al asignar tecnico");
            }


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int resultado = Clases.ClsAsignaciones.ActualizarAsignaciones(Int16.Parse(txt_codigo.Text), txt_Tipo.Text, txt_Modelo.Text, Int16.Parse(txt_CodigoUsuario.Text));

            if (resultado > 0)
            {
                alertas("Asignacion modifcada con exito");
                txt_codigo.Text = string.Empty;
                txt_TecnicosID.Text = string.Empty;
                txt_ReparacionID.Text = string.Empty;
                txt_CodigoUsuario.Text = string.Empty;
                LlenarGrid();


            }
            else
            {
                alertas("Error al actualizar asignacion");
            }

        }
    }
}
}