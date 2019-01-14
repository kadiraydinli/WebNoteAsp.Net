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
    public partial class Login : System.Web.UI.Page
    {
        string baglanti = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                Response.Redirect("Notes.aspx");
            }
        }

        protected void giris_Click(object sender, EventArgs e)
        {
            OleDbConnection baglan = new OleDbConnection(baglanti);
            baglan.Open();

            OleDbCommand cmd = new OleDbCommand("SELECT * FROM users WHERE mail='" + email.Text + "' and sifre='" + sifre.Text+"'", baglan);
            OleDbDataReader read = cmd.ExecuteReader();
            if (read.Read())
            {
                //Response.Write("a:"+read[1].ToString()+"\nb:"/*+ read[2].ToString()*/);
                string emailS, sifreS;
                emailS = read[3].ToString();
                sifreS = read[4].ToString();
                if (emailS == email.Text && sifreS == sifre.Text)
                {
                    Session["email"] = read[3].ToString();
                    Session["id"] = read[0].ToString();
                    Session["user"] = read[1].ToString();
                    Response.Redirect("Notes.aspx");
                }
            }
            else
            {
                Response.Write("E-Mail veya şifre yanlış!");
            }
        }
    }
}