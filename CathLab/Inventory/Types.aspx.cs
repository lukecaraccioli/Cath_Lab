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
            {
                loadManufacturers();
            }
        }

        protected void loadManufacturers()
        {
            using (var context = new cathlabEntities())
            {
                List<Manufacturer> temp = (from man in context.Manufacturers select man).ToList();
                rgStuffs.DataSource = temp;
                rgStuffs.Rebind();
            }
        }

        protected void loadProductTypes()
        {
            using (var context = new cathlabEntities())
            {
                List<ProductType> temp = (from types in context.ProductTypes select types).ToList();
                rgStuffs.DataSource = temp;
                rgStuffs.Rebind();
            }
        }

        protected void loadPartNums()
        {            
            using (var context = new cathlabEntities())
            {
                List<PartNumber> temp = (from pnum in context.PartNumbers select pnum).ToList();
                rgStuffs.DataSource = temp;
                rgStuffs.Rebind();
            }
        }

        protected void btnPartNums_Click(object sender, EventArgs e)
        {
            loadPartNums();
        }

        protected void btnProdTypes_Click(object sender, EventArgs e)
        {
            loadProductTypes();
        }

        protected void btnManufacturers_Click(object sender, EventArgs e)
        {
            loadManufacturers();
        }
    }
}