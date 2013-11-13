using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CathLab.UserControls
{
    public partial class NewManufacturer : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (var context = new cathlabEntities())
            {
                Manufacturer man = new Manufacturer();
                man.Name = tbManufacturerName.Text;
                man.Email = tbxEmail.Text;
                man.PhoneNumber = tbxPhoneNumber.Text;
                man.Address = tbxAddress.Text;
                context.Manufacturers.Add(man);
                context.SaveChanges();
            }
        }
    }
}