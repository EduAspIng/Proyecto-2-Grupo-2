using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Examen2_MiguelSotoAguilar.Clases
{
    public class reparaciones
    {
        public int codigoReparacion { get; set; }

        public int codigoEquipo { get; set; }

        public DateTime fechaSolicitud { get; set; }

        public char estado { get; set; }

        


        public reparaciones() { }

        public reparaciones(int codigoReparacion, int codigoEquipo, DateTime fecha, int estado ) 
        {

            codigoReparacion = codigoReparacion;
            codigoEquipo = codigoEquipo;

            fecha = fecha;

            estado = estado;
        }

        public static int AgregarReparacion(int equipo_Id, DateTime fecha_Reparacion, char estado)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("INGRESAR_REPARACION", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@EQUIPO_ID", equipo_Id));
                    cmd.Parameters.Add(new SqlParameter("@FECHA_REPARACION", fecha_Reparacion));
                    cmd.Parameters.Add(new SqlParameter("@ESTADO", estado));


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

        public static int BorrarrReparacion(int codigo)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("BORRAR_REPARACION", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@CODIGO", codigo));



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

        public static int ModificarReparacion(int codigo, DateTime fechaSolicitud, char estado, int codigoEquipo)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("MODIFICAR_REPARACION", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@CODIGO", codigo));
                    cmd.Parameters.Add(new SqlParameter("@FECHA_SOLICITUD", fechaSolicitud));
                    cmd.Parameters.Add(new SqlParameter("@ESTADO", estado));
                    cmd.Parameters.Add(new SqlParameter("@CODIGO_EQUIPO", codigoEquipo));



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