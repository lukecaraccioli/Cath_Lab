using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CathLab
{
    public partial class ProductEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadLocs();
        }

        protected void autopopulate()
        {
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