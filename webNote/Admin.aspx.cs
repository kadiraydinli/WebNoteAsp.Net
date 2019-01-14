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
    public partial class Admin : System.Web.UI.Page
    {
        string baglanti = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            txt.Visible = false;
            if (Session["email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (Request.QueryString["id"] != null)
                {
                    
                    OleDbConnection baglan = new OleDbConnection(baglanti);
                    baglan.Open();
                    OleDbCommand cmd = new OleDbCommand("SELECT * FROM notlar WHERE id=" + Request.QueryString["id"].ToString(), baglan);
                    OleDbDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        baslik.Text = reader[2].ToString();
                        not.Text = reader[3].ToString();
                        color.SelectedIndex = renkC(reader[4].ToString());
                    }
                    buton.Text = "Değişikliği Kaydet";
                    baglan.Close();
                }
            }
        }

        string renk(int index)
        {
            switch (index)
            {
                case 0: return "primary"; break;
                case 1: return "secondary"; break;
                case 2: return "success"; break;
                case 3: return "danger"; break;
                case 4: return "warning"; break;
                case 5: return "info"; break;
                case 6: return "dark"; break;
            }
            return "primary";
        }

        int renkC(string index)
        {
            switch (index)
            {
                case "primary": return 0; break;
                case "secondary": return 1; break;
                case "success": return 2; break;
                case "danger": return 3; break;
                case "warning": return 4; break;
                case "info": return 5; break;
                case "dark": return 6; break;
            }
            return 0;
        }

        protected void buton_Click(object sender, EventArgs e)
        {
            OleDbConnection baglan = new OleDbConnection(baglanti);

            if (buton.Text == "Kaydet")
            {
                baglan.Open();
                OleDbCommand cmd = new OleDbCommand("SELECT * FROM users WHERE mail='" + Session["email"].ToString() + "'", baglan);
                OleDbDataReader read = cmd.ExecuteReader();
                if (read.Read())
                {
                    OleDbCommand ekle = new OleDbCommand("INSERT INTO notlar(users, titles, notes, color, dates) VALUES('" + read[0].ToString() + "', '"
                        + baslik.Text + "', '" + not.Text + "', '" + renk(color.SelectedIndex) + "', '" + DateTime.Now.ToShortDateString() + "')", baglan);
                    int durum = ekle.ExecuteNonQuery();
                    txt.Visible = true;
                    if (durum > 0)
                    {
                        txt.ForeColor = System.Drawing.Color.Green;
                        txt.Text = "Not Eklendi!";
                    }
                    else
                    {
                        txt.ForeColor = System.Drawing.Color.Red;
                        txt.Text = "Not Eklenemedi!";
                    }
                }
            }
            else if (buton.Text == "Değişikliği Kaydet") 
            {
                baglan.Open();
                OleDbCommand update = new OleDbCommand("UPDATE notlar SET users='" + Session["id"].ToString() + "', titles='" + baslik.Text + "', notes='" + not.Text + "', '" + renk(color.SelectedIndex) + "', dates='" + DateTime.Now.ToShortDateString() + "' WHERE id=" + Request.QueryString["id"], baglan);
                int durum = update.ExecuteNonQuery();
                if (durum > 0)
                {
                    txt.ForeColor = System.Drawing.Color.Green;
                    txt.Text = "Değişiklikler Kaydedildi!";
                }
                else
                {
                    txt.ForeColor = System.Drawing.Color.Red;
                    txt.Text = "Değişiklikler Kaydedilemedi!";
                }
            }
        }
    }
}