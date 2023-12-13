using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Examen2_MiguelSotoAguilar.Clases
{
    public class ClsAsignaciones
    {


          
            public static int tecnico_id { get; set; }
            public static int reparacion_id { get; set; }
            public static int codigoUsuario { get; set; }

            public ClsAsignaciones(int tecnico_id, int reparacion_id, int codigoUsuario)
            {
               tecnico_id = tecnico_id;
               reparacion_id = reparacion_id;
               codigoUsuario = codigoUsuario;



            }






            public static int AsignarTecnicos(int tecnico_id, int reparacion_id, int codigoUsuario)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("Asignaciones", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@TECNICO_ID", tecnico_id));
                    cmd.Parameters.Add(new SqlParameter("@REPARACION_ID", reparacion_id));
                    cmd.Parameters.Add(new SqlParameter("@CODIGO_USUARIO", codigoUsuario));


                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;

        }

        public static int ActualizarAsignaciones(int codigo, int tecnico_id, int reparacion_id, int codigoUsuario)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("MODIFICAR_EQUIPO", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@CODIGO", codigo));
                    cmd.Parameters.Add(new SqlParameter("@TECNICO_ID", tecnico_id));
                    cmd.Parameters.Add(new SqlParameter("@REPARACION_ID", reparacion_id));
                    cmd.Parameters.Add(new SqlParameter("@CODIGO_USUARIO", codigoUsuario));



                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;

        }


    }
}