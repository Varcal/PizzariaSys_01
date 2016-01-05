using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using PizzariaSys.Dominio;
using PizzariaSys.Dominio.Negocios;

namespace PizzariaSys.WindowsForm
{
    public partial class FrmCadastro : Form
    {
        private AcaoNaTela _acaoNaTela;
        public FrmCadastro(AcaoNaTela acaoNaTela, Cliente cliente)
        {
            _acaoNaTela = acaoNaTela;

            InitializeComponent();
            txtCodigo.ReadOnly = true;
            txtCodigo.TabStop = false;

            if (acaoNaTela == AcaoNaTela.Consultar)
            {

                txtCodigo.Text = cliente.Id.ToString();               
                txtNome.Text = cliente.Nome;
                txtNome.ReadOnly = true;
                txtNome.TabStop = false;
                txtLogradouro.Text = cliente.Logradouro;
                txtLogradouro.ReadOnly = true;
                txtLogradouro.TabStop = false;
                txtNumero.Text = cliente.Numero.ToString();
                txtNumero.ReadOnly = true;
                txtNumero.TabStop = false;
                txtBairro.Text = cliente.Bairro;
                txtBairro.ReadOnly = true;
                txtBairro.TabStop = false;
                txtTelefone.Text = cliente.Telefone;
                txtTelefone.ReadOnly = true;
                txtTelefone.TabStop = false;

                btnSalvar.Enabled = false;
            }

        }

        private void Cancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnSalvar_Click(object sender, EventArgs e)
        {
            ClienteNegocios clienteNegocios = new ClienteNegocios();
            Cliente cliente = new Cliente();

            cliente.Nome = txtNome.Text;
            cliente.Logradouro = txtLogradouro.Text;
            cliente.Numero = Convert.ToInt32(txtNumero.Text);
            cliente.Bairro = txtBairro.Text;
            cliente.Telefone = txtTelefone.Text;

            var retorno = clienteNegocios.Salvar(cliente);
            try
            {
                int Id = Convert.ToInt32(retorno);
                MessageBox.Show("Cliente " + retorno + " inserido com sucesso", "AVISO", MessageBoxButtons.OK,
                MessageBoxIcon.Information);
            }
            catch (Exception)
            {

                MessageBox.Show("Cliente não pode ser inserido", "ERRO", MessageBoxButtons.OK,
                MessageBoxIcon.Error);
            }

            
        }
    }
}
