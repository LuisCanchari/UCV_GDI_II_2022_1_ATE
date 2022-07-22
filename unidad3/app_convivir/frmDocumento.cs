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
    public partial class frmDocumento : Form
    {
        private int? Id;
        public frmDocumento(int? Id = null)
        {
            InitializeComponent();
            this.Id = Id;

            if (this.Id != null)
            {
                loadData();
            }
        }

        private void Label1_Click(object sender, EventArgs e)
        {

        }

        private void BtnGuardar_Click(object sender, EventArgs e)
        {
            Documento documento = new Documento();
            
            documento.Tipo = cmbTipo.Text;
            documento.Numero = txtNumero.Text;
            documento.Fecha = dtpFecha.Value;
            documento.Total = Convert.ToDecimal(txtTotal.Text);
            documento.Descripcion = txtDescripcion.Text;

            DocumentoDB documentoDB = new DocumentoDB();

            try
            {
                if (this.Id == null)
                {
                    documentoDB.Add(documento);

                }
                else
                {
                    documento.Id = (int) this.Id;
                    documentoDB.Editar(documento);
                }
                
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ocurrio un error" + ex.Message);
            }

            this.Close();
        }

        private void loadData()
        {
            Documento documento = new Documento();
            DocumentoDB documentoDB = new DocumentoDB();
            documento = documentoDB.Get((int)Id);
            cmbTipo.Text = documento.Tipo;
            dtpFecha.Value = documento.Fecha;
            txtNumero.Text = documento.Numero;
            txtDescripcion.Text = documento.Descripcion;
            txtTotal.Text = documento.Total.ToString();

        }

        private void FrmNuevo_Load(object sender, EventArgs e)
        {

        }
    }
}
