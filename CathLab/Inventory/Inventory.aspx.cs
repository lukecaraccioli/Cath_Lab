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
        public class lbxResult
        {
            public int ID { get; set; }
            public string Name { get; set; }
            public lbxResult(int id, string name)
            {
                ID = id;
                Name = name;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                loadManufacturers();
                loadTypes();
                loadLocations();
            }
        }

        protected void loadTypes()
        {
            using (var context = new cathlabEntities())
            {
                List<ProductType> temp = (from prodtype in context.ProductTypes
                                                   select prodtype).ToList();
                ProductType a = new ProductType();
                a.ID = 0;
                a.Type = "ALL";
                temp.Insert(0,a);
                lbxProdType.DataValueField = "ID";
                lbxProdType.DataTextField = "Type";
                lbxProdType.DataSource = temp;                
                lbxProdType.DataBind();
            }
        }

        protected void loadManufacturers()
        {
            using (var context = new cathlabEntities())
            {
                List<Manufacturer> temp = (from man in context.Manufacturers
                            select man).ToList();
                Manufacturer a = new Manufacturer();
                a.ID = 0;
                a.Name = "All";
                temp.Insert(0, a);
                lbxManufacturer.DataValueField = "ID";
                lbxManufacturer.DataTextField = "Name";
                lbxManufacturer.DataSource = temp;                
                lbxManufacturer.DataBind();
            }
        }

        protected void loadLocations()
        {
            using (var context = new cathlabEntities())
            {
                List<Location> temp = (from loc in context.Locations
                            select loc).ToList();
                Location a = new Location();
                a.ID = 0;
                a.LocationName = "All";
                temp.Insert(0, a);
                lbxLocation.DataValueField = "ID";
                lbxLocation.DataTextField = "LocationName";
                lbxLocation.DataSource = temp;
                lbxLocation.DataBind();
            }
        }

        protected void rgInventory_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            using (var context = new cathlabEntities())
            {
                var temp = (from prodtype in context.ProductTypes
                            select prodtype).ToList();
                rgInventory.DataSource = temp;
            }
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            int typeId; int.TryParse(lbxProdType.SelectedValue, out typeId);
            int manId; int.TryParse(lbxManufacturer.SelectedValue, out manId);
            int locId; int.TryParse(lbxLocation.SelectedValue, out locId);
            using (var context = new cathlabEntities())
            {
                var temp = (from prod in context.Products
                            where prod.PartNumber1.ManufacturerID == manId && prod.PartNumber1.ProductTypeID == typeId
                            select prod).ToList();
                rgInventory.DataSource = temp;
                rgInventory.DataBind();
            }
        }
    }
}