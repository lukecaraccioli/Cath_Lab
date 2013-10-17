using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CathLab
{
    public partial class Types : System.Web.UI.Page
    {
        //public string mode;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //loadManufacturers();
            }
        }

        protected void loadManufacturers()
        {
            //mode = "manu";
            using (var context = new cathlabEntities())
            {
                var temp = (from man in context.Manufacturers select new { man.Name, man.Email, man.PhoneNumber, man.Address }).ToList();
                rgManufacturers.DataSource = temp;
                //rgManufacturers.DataBind();
            }
        }

        protected void loadProductTypes()
        {
            //mode = "type";
            using (var context = new cathlabEntities())
            {
                var temp = (from types in context.ProductTypes select new { types.PartNumbers, types.Type }).ToList();
                rgProdType.DataSource = temp;
                //rgProdType.DataBind();
            }
        }

        protected void loadPartNums()
        {
            //mode = "pnum";
            using (var context = new cathlabEntities())
            {
                var temp = (from pnum in context.PartNumbers select new { pnum.NameSize, pnum.ProductType, pnum.Cost, pnum.Manufacturer }).ToList();
                rgManufacturers.DataSource = temp;
                //rgManufacturers.DataBind();
            }
        }

        protected void btnPartNums_Click(object sender, EventArgs e)
        {
            pnlPartNumbers.Visible = true;
            pnlProdType.Visible = false;
            pnlManufacturers.Visible = false;
            //mode = "pnum";
            rgPartNumbers.Rebind();
            //loadPartNums();
        }

        protected void btnProdTypes_Click(object sender, EventArgs e)
        {
            pnlProdType.Visible = true;
            pnlManufacturers.Visible = false;
            pnlProdType.Visible = false;
            //mode = "type";
            rgProdType.Rebind();
            //loadProductTypes();
        }

        protected void btnManufacturers_Click(object sender, EventArgs e)
        {
            pnlManufacturers.Visible = true;
            pnlPartNumbers.Visible = false;
            pnlProdType.Visible = false;
            //mode = "manu";
            rgManufacturers.Rebind();
            //loadManufacturers();
        }

        protected void rgManufacturers_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            loadManufacturers();
        }

        protected void rgProdType_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            loadProductTypes();
        }

        protected void rgPartNumbers_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            loadPartNums();
        }
    }
}