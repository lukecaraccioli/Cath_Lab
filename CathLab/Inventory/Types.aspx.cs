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
        public string mode;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //loadManufacturers();
            }
        }

        protected void loadManufacturers()
        {
            mode = "manu";
            using (var context = new cathlabEntities())
            {
                var temp = (from man in context.Manufacturers select new { man.Name, man.Email, man.PhoneNumber, man.Address }).ToList();
                rgStuffs.DataSource = temp;
                rgStuffs.Rebind();
            }
        }

        protected void loadProductTypes()
        {
            mode = "type";
            using (var context = new cathlabEntities())
            {
                var temp = (from types in context.ProductTypes select new { types.PartNumbers, types.Type }).ToList();
                rgStuffs.DataSource = temp;
                rgStuffs.Rebind();
            }
        }

        protected void loadPartNums()
        {
            mode = "pnum";
            using (var context = new cathlabEntities())
            {
                var temp = (from pnum in context.PartNumbers select new { pnum.NameSize, pnum.ProductType, pnum.Cost, pnum.Manufacturer }).ToList();
                rgStuffs.DataSource = temp;
                rgStuffs.Rebind();
            }
        }

        protected void btnPartNums_Click(object sender, EventArgs e)
        {
            mode = "pnum";
            //loadPartNums();
        }

        protected void btnProdTypes_Click(object sender, EventArgs e)
        {
            mode = "type";
            //loadProductTypes();
        }

        protected void btnManufacturers_Click(object sender, EventArgs e)
        {
            mode = "manu";
            //loadManufacturers();
        }

        protected void rgStuffs_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            using (var context = new cathlabEntities())
            {                
                switch (mode)
                {
                    case "manu":
                        rgStuffs.DataSource = (from man in context.Manufacturers select new { man.Name, man.Email, man.PhoneNumber, man.Address }).ToList();                        
                        //loadManufacturers();
                        break;
                    case "type":
                        rgStuffs.DataSource = (from types in context.ProductTypes select new { types.PartNumbers, types.Type }).ToList();
                        //loadProductTypes();
                        break;
                    case "pnum":
                        rgStuffs.DataSource = (from pnum in context.PartNumbers select new { pnum.NameSize, pnum.ProductType, pnum.Cost, pnum.Manufacturer }).ToList();
                        //loadPartNums();
                        break;
                    default:
                        break;
                }
            }
        }
    }
}