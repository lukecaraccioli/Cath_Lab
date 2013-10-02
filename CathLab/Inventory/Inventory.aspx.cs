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
        public static int typeId;
        public static int manId;
        public static int locId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                loadTypes();
                loadLocs();
                rgInventory.Rebind();
            }
        }

        protected void loadTypes()
        {
            using (var context = new cathlabEntities())
            {
                List<ProductType> temp = (from prodtype in context.ProductTypes select prodtype).ToList();
                ProductType a = new ProductType();
                a.ID = 0; a.Type = "ALL";
                temp.Insert(0, a);
                lbxProdType.DataValueField = "ID";
                lbxProdType.DataTextField = "Type";
                lbxProdType.DataSource = temp;
                lbxProdType.DataBind();
            }
        }

        // Populate the manufacturer listbox
        protected void lbxProdType_TextChanged(object sender, EventArgs e)
        {
            int.TryParse(lbxProdType.SelectedValue, out typeId);
            if (typeId == 0)
                loadManufacturers();
            else
            {
                using (var context = new cathlabEntities())
                {
                    var temp = (from prod in context.Products
                                where prod.PartNumber1.ProductTypeID == typeId
                                select new { ID = prod.PartNumber1.ManufacturerID, prod.PartNumber1.Manufacturer.Name }).Distinct();
                    lbxManufacturer.DataTextField = "Name";
                    lbxManufacturer.DataValueField = "ID";
                    lbxManufacturer.DataSource = temp.ToList();
                    lbxManufacturer.DataBind();
                }
            }
            lbxManufacturer.SelectedIndex = 0;
        }

        protected void loadManufacturers()
        {
            using (var context = new cathlabEntities())
            {
                List<Manufacturer> temp = (from man in context.Manufacturers select man).ToList();
                Manufacturer a = new Manufacturer();
                a.ID = 0; a.Name = "All";
                temp.Insert(0, a);
                lbxManufacturer.DataValueField = "ID";
                lbxManufacturer.DataTextField = "Name";
                lbxManufacturer.DataSource = temp;
                lbxManufacturer.DataBind();
            }
        }

        // Populate the location listbox
        protected void lbxManufacturer_TextChanged(object sender, EventArgs e)
        {
            int.TryParse(lbxManufacturer.SelectedValue, out manId);
            if (manId == 0)
                loadLocations();
            else
            {
                using (var context = new cathlabEntities())
                {
                    var temp = (from prod in context.Products
                                where prod.PartNumber1.ManufacturerID == manId
                                select new { ID = prod.LocationID, Name = prod.Location.LocationName }).Distinct();
                    lbxLocation.DataTextField = "Name";
                    lbxLocation.DataValueField = "ID";
                    lbxLocation.DataSource = temp.ToList();
                    lbxLocation.DataBind();
                }
            }
            lbxLocation.SelectedIndex = 0;
        }

        protected void loadLocations()
        {
            using (var context = new cathlabEntities())
            {
                List<Location> temp = (from loc in context.Locations select loc).ToList();
                Location a = new Location();
                a.ID = 0; a.LocationName = "All";
                temp.Insert(0, a);
                lbxLocation.DataValueField = "ID";
                lbxLocation.DataTextField = "LocationName";
                lbxLocation.DataSource = temp;
                lbxLocation.DataBind();
            }
        }

        protected void rgInventory_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadData();
        }

        protected void lbxLocation_TextChanged(object sender, EventArgs e)
        {
            int.TryParse(lbxLocation.SelectedValue, out locId);
        }

        protected void LoadData()
        {
            using (var context = new cathlabEntities())
            {
                var temp = (from prod in context.Products
                            select new { prod.ID, prod.PartNumber, prod.PartNumber1, prod.SerialNumber, prod.ExpirationDate, prod.Location.LocationName, prod.LocationID, prod.PartNumber1.NameSize });
                if (typeId != 0)
                    temp = temp.Where(a => a.PartNumber1.ProductTypeID == typeId);
                if (manId != 0)
                    temp = temp.Where(a => a.PartNumber1.ManufacturerID == manId);
                if (locId != 0)
                    temp = temp.Where(a => a.LocationID == locId);
                rgInventory.DataSource = temp.ToList();
            }
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            rgInventory.Rebind();
        }

        protected void btnEntry_Click(object sender, EventArgs e)
        {
            pnlView.Visible = false;
            pnlEntry.Visible = true;
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            pnlView.Visible = true;
            pnlEntry.Visible = false;
        }

        protected void autopopulate()
        {
            //string[] parts = txtPartNum.Text.Split(',');
            string part = txtPartNum.Text;
            using (var context = new cathlabEntities())
            {
                var temp = (from pnum in context.PartNumbers
                            where pnum.PartNum == part
                            select new { pnum.Manufacturer.Name, pnum.NameSize, pnum.ProductType.Type }).SingleOrDefault();
                txtManufacturer.Text = temp.Name;
                txtNameSize.Text = temp.NameSize;
                txtProdType.Text = temp.Type;
            }
        }

        protected void loadLocs()
        {
            using (var context = new cathlabEntities())
            {
                List<Location> temp = (from loc in context.Locations select loc).ToList();
                lbxLoc.DataValueField = "ID";
                lbxLoc.DataTextField = "LocationName";
                lbxLoc.DataSource = temp;
                lbxLoc.DataBind();
            }
        }

        protected void btnInsertProduct_Click(object sender, EventArgs e)
        {
            using (var context = new cathlabEntities())
            {
                Product prod = new Product();
                prod.PartNumber = txtPartNum.Text;
                prod.LotNumber = int.Parse(txtLotNumber.Text);
                prod.ExpirationDate = rdpExpiration.SelectedDate;
                prod.LocationID = int.Parse(lbxLoc.SelectedValue);
                context.Products.Add(prod);
                context.SaveChanges();
            }
        }

        protected void btnAutopopulate_Click(object sender, EventArgs e)
        {
            autopopulate();
        }
    }
}