using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CathLab
{
    public partial class Inventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadManufacturers();
            loadTypes();
        }

        protected void loadTypes()
        {
            using (var context = new cathlabEntities())
            {
                var temp = (from prodtype in context.ProductTypes
                            select prodtype);

                lbxProdType.DataValueField = "ID";
                lbxProdType.DataTextField = "Type";
                lbxProdType.DataSource = temp.ToList();                
                lbxProdType.DataBind();
            }
        }

        protected void loadManufacturers()
        {
            using (var context = new cathlabEntities())
            {
                var temp = (from man in context.Manufacturers
                            select new { man.ID, man.Name });
                lbxManufacturer.DataValueField = "ID";
                lbxManufacturer.DataTextField = "Name";
                lbxManufacturer.DataSource = temp.ToList();                
                lbxManufacturer.DataBind();
            }
        }

        protected void rgInventory_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            //using (var context = new cathlabEntities())
            //{
            //    var temp = (from prodtype in context.ProductTypes
            //                select prodtype).ToList();
            //    rgInventory.DataSource = temp;
            //}
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            int typeId;
            int.TryParse(lbxProdType.SelectedValue, out typeId);
            int manId = int.Parse(lbxManufacturer.SelectedValue);
            using (var context = new cathlabEntities())
            {
                var temp = (from prod in context.Products
                            where prod.PartNumber1.ManufacturerID == manId && prod.PartNumber1.ProductTypeID == typeId
                            select prod);
                rgInventory.DataSource = temp.ToList();
            }

        }        
    }
}