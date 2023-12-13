using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

using System.Linq;
using System.Web;

namespace Examen2_MiguelSotoAguilar.Clases
{
    public class login
    {
        private static string correo;

        private static string clave;

        public static string nombre { get; set; }





        public login(string Correo, string Clave) 
    {

            correo = Correo;
            clave = Clave;
        
    
    }

        public login() { }


        public static string Correo { get; set; }
        public static string Clave { get; set; }

        


        public static int ValidarLogin()
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("VALIDARUSUARIO", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };


                    cmd.Parameters.Add(new SqlParameter("@CORREO", correo));
                    cmd.Parameters.Add(new SqlParameter("@CLAVE", clave));


                    retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            retorno = 1;
                            nombre = rdr[2].ToString();

                        }
                        else
                        {
                            retorno = -1;
                        }

                    }


                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return retorno;
        }


    }

}