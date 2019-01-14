using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webNote
{
    public partial class Register : System.Web.UI.Page
    {
        string baglanti = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void kayit_Click(object sender, EventArgs e)
        {
            OleDbConnection baglan = new OleDbConnection(baglanti);
            baglan.Open();

            OleDbCommand ekle = new OleDbCommand("INSERT INTO users(ad, soyad, mail, sifre) VALUES('"
                + ad.Text + "', '" + soyad.Text + "', '" + email.Text + "', '" + sifre.Text + "')", baglan);
            int durum = ekle.ExecuteNonQuery();
            if (durum > 0)
            {
                //Response.Write("Kayıt Oldunuz!");
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Write("Kayıt Olamadınız!");
            }
        }
    }
}