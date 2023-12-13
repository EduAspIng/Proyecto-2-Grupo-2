using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen2_MiguelSotoAguilar
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void btn_login_Click(object sender, EventArgs e)
        {
            Clases.login objLogin = new Clases.login(txt_correo.Text, txt_password.Text);
            if(Clases.login.ValidarLogin() > 0 )
            {
                Response.Redirect("inicio.aspx");

            }
            else 
            {
                alertas("Error de validación");
            }
        }
    }
}