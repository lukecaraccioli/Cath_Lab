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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { }
        }

        protected void loadManufacturers()
        {
            using (var context = new cathlabEntities())
            {
                var temp = (from man in context.Manufacturers select new { man.ID, man.Name, man.Email, man.PhoneNumber}).ToList();
                rgManufacturers.DataSource = temp;
                //rgManufacturers.DataBind();
            }
        }

        protected void loadProductTypes()
        {
            using (var context = new cathlabEntities())
            {
                var temp = (from types in context.ProductTypes select new { types.ID, types.Type }).ToList();
                rgProdType.DataSource = temp;
                //rgProdType.DataBind();
            }
        }

        protected void loadPartNums()
        {
            using (var context = new cathlabEntities())
            {
                var temp = (from pnum in context.PartNumbers select new { pnum.PartNum, pnum.NameSize, pnum.ProductType.Type, pnum.Cost, pnum.Manufacturer.Name }).ToList();
                rgManufacturers.DataSource = temp;
                //rgManufacturers.DataBind();
            }
        }

        protected void btnPartNums_Click(object sender, EventArgs e)
        {
            pnlPartNumbers.Visible = true;
            pnlProdType.Visible = false;
            pnlManufacturers.Visible = false;
            rgPartNumbers.Rebind();
        }

        protected void btnProdTypes_Click(object sender, EventArgs e)
        {
            pnlProdType.Visible = true;
            pnlManufacturers.Visible = false;
            pnlProdType.Visible = false;
            rgProdType.Rebind();
            //loadProductTypes();
        }

        protected void btnManufacturers_Click(object sender, EventArgs e)
        {
            pnlManufacturers.Visible = true;
            pnlPartNumbers.Visible = false;
            pnlProdType.Visible = false;
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