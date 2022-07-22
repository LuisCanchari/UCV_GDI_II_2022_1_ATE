using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace app_convivir
{
    public class Documento
    {
        public int Id { get; set; }
        public String Tipo { get; set; }
        public String Numero { get; set; }
        public DateTime Fecha { get; set; }
        public String Descripcion { get; set; }
        public Decimal Total { get; set; }
    }
}
