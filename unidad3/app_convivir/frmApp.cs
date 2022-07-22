using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace app_convivir
{
    public partial class frmApp : Form
    {
        public frmApp()
        {
            InitializeComponent();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            DocumentoDB documento = new DocumentoDB();
            if (documento.conectar())
            {
                MessageBox.Show("Conexion exitosa");
            }
            else
            {
                MessageBox.Show("No se conecto");
            }
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Button3_Click(object sender, EventArgs e)
        {
            Refrescar();
        }
        private void Refrescar()
        {
            List<Documento> documentos;
            DocumentoDB documentoDB = new DocumentoDB();
            documentos = documentoDB.Get();
            dataGridView1.DataSource = documentos;
        }

        private void Button4_Click(object sender, EventArgs e)
        {
            frmDocumento frmnuevo = new frmDocumento();
            frmnuevo.ShowDialog();
            Refrescar();
        }

        private int GetId() { 
            String id;
            id = dataGridView1.Rows[dataGridView1.CurrentRow.Index].Cells[0].Value.ToString();
            return int.Parse(id);
        }

        private void Button5_Click(object sender, EventArgs e)
        {
            int? id = GetId();

            if (id != null)
            {
                frmDocumento frmEdit = new frmDocumento(id);
                frmEdit.ShowDialog();
                Refrescar();
            }
        }

       private void button6_Click(object sender, EventArgs e)
        {
            DialogResult d;
            DocumentoDB documento = new DocumentoDB();
            int? id = GetId();
            d = MessageBox.Show("Está seguro que desea eliminar el documento con id: " + id, "Mensaje de confirmación", MessageBoxButtons.OKCancel);

            if (d == DialogResult.OK)
            {
                documento.Eliminar((int)id);
                Refrescar();
                MessageBox.Show("Se eliminó el documento: " + id, "Mensaje de confirmación");
            }
        }
    }
}
