using Microsoft.Data.Sqlite;

namespace Barrios;

internal class Program
{
    static void Main(string[] args)
    {
        List<Tabla> tablas = new List<Tabla>();
        using (var connection = new SqliteConnection("Data Source=dusso.db"))
        {
            connection.Open();
            var command = connection.CreateCommand();
            command.CommandText = "SELECT name, sql from sqlite_master where type = 'table'";

            using (var reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    var tabla = reader.GetString(0);
                    var sql = reader.GetString(1);
                    tablas.Add(new Tabla(connection, tabla, sql));
                }
            }
            foreach(Tabla t in tablas) {
                t.print();
            }
        }
    }
}