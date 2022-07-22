using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace app_convivir
{
    public class DocumentoDB
    {
        private string connectionString =
            "Data Source=localhost; initial catalog=db_convivir; user=sa; password=P4ss_sql";
        public bool conectar()
        {
            try
            {
                SqlConnection conexion = new SqlConnection(connectionString);
                conexion.Open();
            }
            catch (Exception)
            {

                return false;
            }
            return true;
        }

        public Documento Get(int id) {
            Documento documento = new Documento();
            string query = "usp_documentos_item";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@id", SqlDbType.Int).Value = id;
                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    reader.Read();
                    
                    documento.Id = reader.GetInt32(0);
                    documento.Tipo = reader.GetString(1);
                    documento.Numero = reader.GetString(2);
                    documento.Fecha = reader.GetDateTime(3);
                    documento.Descripcion = reader.GetString(4);
                    documento.Total = reader.GetDecimal(5);

                    reader.Close();
                    connection.Close();
                }
                catch (Exception ex)
                {
                    throw new Exception("Hay un error: " + ex.Message);
                }
            }
            return documento;
        }

        public List<Documento> Get()
        {
            List<Documento> documentos = new List<Documento>();

            string query = "usp_documentos_lista";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.StoredProcedure;
                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        Documento documento = new Documento();
                        documento.Id = reader.GetInt32(0);
                        documento.Tipo = reader.GetString(1);
                        documento.Numero = reader.GetString(2);
                        documento.Fecha = reader.GetDateTime(3);
                        documento.Descripcion = reader.GetString(4);
                        documento.Total = reader.GetDecimal(5);
                        documentos.Add(documento);
                    }
                    reader.Close();
                    connection.Close();
                }
                catch (Exception ex)
                {
                    throw new Exception("Hay un error: " + ex.Message);
                }
            }
            return documentos;
        }


        public void Add(Documento documento)
        {
            string query = "usp_documentos_insert";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("@tipo",SqlDbType.NVarChar,10).Value = documento.Tipo;
                command.Parameters.Add("@numero",SqlDbType.NVarChar,9).Value = documento.Numero;
                command.Parameters.Add("@fecha",SqlDbType.Date).Value = documento.Fecha;
                command.Parameters.Add("@descripcion",SqlDbType.NVarChar).Value = documento.Descripcion;
                command.Parameters.Add("@total",SqlDbType.Decimal).Value = documento.Total;
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
                catch (Exception ex)
                {
                    throw new Exception("Hay un error: " + ex);
                }
            }

        }

        public void Editar(Documento documento)
        {
            string query = "usp_documentos_edit";
            
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@id", SqlDbType.Int).Value = documento.Id;
                command.Parameters.Add("@tipo", SqlDbType.NVarChar, 10).Value = documento.Tipo;
                command.Parameters.Add("@numero", SqlDbType.NVarChar, 9).Value = documento.Numero;
                command.Parameters.Add("@fecha", SqlDbType.Date).Value = documento.Fecha;
                command.Parameters.Add("@descripcion", SqlDbType.NVarChar).Value = documento.Descripcion;
                command.Parameters.Add("@total", SqlDbType.Decimal).Value = documento.Total;
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
                catch (Exception ex)
                {
                    throw new Exception("Hay un error: " + ex);
                }
            }
        }

        public void Eliminar(int id)
        {
            string query = "usp_documentos_del";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@id", SqlDbType.Int).Value = id;
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
                catch (Exception ex)
                {
                    throw new Exception("Hay un error: " + ex);
                }
            }
        }
    }
 
}
