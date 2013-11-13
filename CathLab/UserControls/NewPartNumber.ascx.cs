using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CathLab.UserControls
{
    public partial class NewPartNumber : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //loadManufacturers();
            //loadProductTypes();
        }

        //protected void loadManufacturers()
        //{
        //    using (var context = new cathlabEntities())
        //    {
        //        List<Manufacturer> temp = (from man in context.Manufacturers select man).ToList();
        //        //Manufacturer a = new Manufacturer();
        //        //a.ID = 0; a.Name = "All";
        //        //temp.Insert(0, a);
        //        lbxManufacturer.DataValueField = "ID";
        //        lbxManufacturer.DataTextField = "Name";
        //        lbxManufacturer.DataSource = temp;
        //        lbxManufacturer.DataBind();
        //    }
        //}

        //protected void loadProductTypes()
        //{
        //    using (var context = new cathlabEntities())
        //    {
        //        var temp = (from prod in context.Products
        //                    //where prod.PartNumber1.ProductTypeID == typeId
        //                    select new { ID = prod.PartNumber1.ManufacturerID, prod.PartNumber1.Manufacturer.Name }).Distinct();
        //        lbxManufacturer.DataTextField = "Name";
        //        lbxManufacturer.DataValueField = "ID";
        //        lbxManufacturer.DataSource = temp.ToList();
        //        lbxManufacturer.DataBind();
        //    }
        //}

        protected void lbxLocation_TextChanged(object sender, EventArgs e)
        {

        }
    }
}