using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace CathLab
{
    public partial class Types : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { }
        }            

        protected void btnPartNums_Click(object sender, EventArgs e)
        {
            rgPartNumbers.Visible = true;
            rgProdType.Visible = false;
            rgManufacturers.Visible = false;
            rgPartNumbers.Rebind();
        }

        protected void btnProdTypes_Click(object sender, EventArgs e)
        {
            rgProdType.Visible = true;
            rgManufacturers.Visible = false;
            rgPartNumbers.Visible = false;
            rgProdType.Rebind();
        }

        protected void btnManufacturers_Click(object sender, EventArgs e)
        {
            rgManufacturers.Visible = true;
            rgPartNumbers.Visible = false;
            rgProdType.Visible = false;
            rgManufacturers.Rebind();
        }

        protected void rgManufacturers_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            using (var context = new cathlabEntities())
                rgManufacturers.DataSource = (from man in context.Manufacturers select new { man.ID, man.Name, man.PhoneNumber, man.Email }).ToList();
        }

        protected void rgProdType_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            using (var context = new cathlabEntities())
                rgProdType.DataSource = (from types in context.ProductTypes select new { types.ID, types.Type }).ToList();
        }

        protected void rgPartNumbers_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            using (var context = new cathlabEntities())
                rgPartNumbers.DataSource = (from pnum in context.PartNumbers select new { pnum.PartNum, pnum.NameSize, pnum.ProductType.Type, pnum.Cost, pnum.Manufacturer.Name }).ToList();
        }

        protected void rgManufacturers_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
        }

        protected void rgPartNumbers_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
        }

        protected void rgProdType_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
        }

        protected void rgPartNumbers_EditCommand(object sender, GridCommandEventArgs e)
        {

        }

        protected void rgPartNumbers_InsertCommand(object sender, GridCommandEventArgs e)
        {

        }
    }
}