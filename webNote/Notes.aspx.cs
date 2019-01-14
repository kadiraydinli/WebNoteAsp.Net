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
    public partial class Listele : System.Web.UI.Page
    {
        string baglanti = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                txt.Text = "Hoşgeldin " + Session["user"].ToString();
                OleDbConnection baglan = new OleDbConnection(baglanti);
                baglan.Open();
                OleDbCommand veri = new OleDbCommand("SELECT * FROM notlar WHERE users='" + Session["id"].ToString() + "'", baglan);
                OleDbDataReader reader = veri.ExecuteReader();
                Repeater1.DataSource = reader;
                Repeater1.DataBind();
                if (Request.QueryString["id"] != null)
                {
                    try
                    {
                        OleDbCommand cmd = new OleDbCommand("DELETE FROM notlar WHERE id=" + Request.QueryString["id"].ToString(), baglan);
                        int durum = cmd.ExecuteNonQuery();
                        if (durum > 0)
                        {
                            Page.Response.Redirect(HttpContext.Current.Request.Url.ToString(), true);
                        }
                    }
                    catch (Exception)
                    {
                        Response.Write("Hata oluştu");
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void exit_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }

        protected void not_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void not_Load(object sender, EventArgs e)
        {
            
        }
    }
}