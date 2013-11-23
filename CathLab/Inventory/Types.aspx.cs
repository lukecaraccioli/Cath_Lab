using System;
using System.Data.Entity.Infrastructure;
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
        public static string pnum;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { }
        }

        #region Data Load
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
                rgPartNumbers.DataSource = (from pnum in context.PartNumbers select new { pnum.PartNum, pnum.NameSize, pnum.ProductType.Type, pnum.Cost, pnum.Manufacturer.Name, pnum.Par }).ToList();
        }
        #endregion Data Load

        protected void rgManufacturers_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            using (var context = new cathlabEntities())
            {
                int pnum = int.Parse(e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ID"].ToString());
                ProductType pt = context.ProductTypes.Find(ID);
            }
            
        }

        protected void rgPartNumbers_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                using (var context = new cathlabEntities())
                {
                    int PNum = int.Parse(e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["PartNum"].ToString());
                    PartNumber pn = context.PartNumbers.Find(PNum);
                    pn.NameSize = (e.Item.FindControl("tbNameSize") as RadTextBox).Text;
                    pn.Cost = int.Parse((e.Item.FindControl("tbCost") as RadTextBox).Text);
                    pn.Par = int.Parse((e.Item.FindControl("tbPar") as RadTextBox).Text);
                    context.SaveChanges();
                }
            }
        }

        protected void rgProdType_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            using (var context = new cathlabEntities())
            {
                int ID = int.Parse(e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ID"].ToString());
                ProductType pt = context.ProductTypes.Find(ID);
                pt.Type = (e.Item.FindControl("tbType") as RadTextBox).Text;
                context.SaveChanges();
            }
        }

        #region Delete
        protected void rgPartNumbers_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (GridDataItem)e.Item;
            string PartNum = item.GetDataKeyValue("PartNum").ToString();
            using (var context = new cathlabEntities())
            {
                PartNumber pn = context.PartNumbers.Find(PartNum);
                try
                {
                    context.PartNumbers.Remove(pn);
                    context.SaveChanges();
                }
                catch (DbUpdateException)
                {
                    rnLabel.Text = "ERROR! Cannot delete, there are products<br/> in the database of that part number.";
                    RadNotification.Show();
                }
            }
        }

        protected void rgManufacturers_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (GridDataItem)e.Item;
            int ID = (int)item.GetDataKeyValue("ID");
            using (var context = new cathlabEntities())
            {
                Manufacturer m = context.Manufacturers.Find(ID);
                try
                {
                    context.Manufacturers.Remove(m);
                    context.SaveChanges();
                }
                catch (DbUpdateException)
                {
                    rnLabel.Text = "ERROR! Can't delete manufacturer. Products in database rely on this entry.";
                    RadNotification.Show();
                }
            }
        }

        protected void rgProdType_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (GridDataItem)e.Item;
            int ID = (int)item.GetDataKeyValue("ID");
            using (var context = new cathlabEntities())
            {
                ProductType pt = context.ProductTypes.Find(ID);
                try
                {
                    context.ProductTypes.Remove(pt);
                    context.SaveChanges();
                }
                catch (DbUpdateException)
                {
                    rnLabel.Text = "ERROR! Can't delete product type. Products in database rely on this entry.";
                    RadNotification.Show();
                }
            }
        }
        #endregion Delete       

        protected void tbPNSearch_TextChanged(object sender, EventArgs e)
        {
            using (var context = new cathlabEntities())          
                rgPartNumbers.DataSource = (from pnum in context.PartNumbers select new { pnum.PartNum, pnum.NameSize, pnum.ProductType.Type, pnum.Cost, pnum.Manufacturer.Name, pnum.Par })
                    .Where(a => a.PartNum.Contains(tbPNSearch.Text)).ToList();            
        }

        protected void btnNewPartNum_Click(object sender, EventArgs e)
        {
            //pnlNewPartNumber.Visible = true;
            //pnlNewManufacturer.Visible = false;
            //pnlNewProdType.Visible = false;
        }

        protected void btnManufacturer_Click(object sender, EventArgs e)
        {
            //pnlNewPartNumber.Visible = false;
            //pnlNewManufacturer.Visible = true;
            //pnlNewProdType.Visible = false;
        }

        protected void btnProductType_Click(object sender, EventArgs e)
        {
            //pnlNewPartNumber.Visible = false;
            //pnlNewManufacturer.Visible = false;
            //pnlNewProdType.Visible = true;
        }

        //#region NewPartNum
        //protected void btnPNSubmit_Click(object sender, EventArgs e)
        //{
        //    using (var context = new cathlabEntities())
        //    {
        //        int cost, par;
        //        int.TryParse(tbNCost.Text, out cost);
        //        int.TryParse(tbNPar.Text, out par);
        //        PartNumber pn = new PartNumber();
        //        pn.PartNum = pnum;
        //        pn.NameSize = tbNNameSize.Text;
        //        pn.ManufacturerID = int.Parse(lbxManufacturer.SelectedValue);   //
        //        pn.ProductTypeID = int.Parse(lbxProdType.SelectedValue);        //                
        //        pn.Cost = cost;
        //        pn.Par = par;
        //        context.PartNumbers.Add(pn);
        //        context.SaveChanges();
        //        pnlNewPartNumber.Visible = true;
        //        pnlNewPartNumber.Visible = false;
        //        //autopopulate();
        //    }
        //}

        //protected void loadManufacturers()
        //{
        //    using (var context = new cathlabEntities())
        //    {
        //        List<Manufacturer> temp = (from man in context.Manufacturers select man).ToList();
        //        Manufacturer a = new Manufacturer();
        //        a.ID = 0; a.Name = "New Manufacturer";
        //        temp.Insert(0, a);
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
        //        List<ProductType> temp = (from prodtype in context.ProductTypes select prodtype).ToList();
        //        ProductType a = new ProductType();
        //        a.ID = 0; a.Type = "New Type";
        //        temp.Insert(0, a);
        //        lbxProdType.DataValueField = "ID";
        //        lbxProdType.DataTextField = "Type";
        //        lbxProdType.DataSource = temp;
        //        lbxProdType.DataBind();
        //    }
        //}
        //#endregion NewPartNum

        //#region NewManufacturer
        //protected void lbxManufacturer_TextChanged(object sender, EventArgs e)
        //{
        //    int manID = -1;
        //    int.TryParse(lbxManufacturer.SelectedValue, out manID);
        //    if (manID == 0)
        //    {
        //        pnlNewManufacturer.Visible = true;
        //        pnlNewPartNumber.Visible = false;
        //        pnlNewProdType.Visible = false;
        //    }
        //    //else
        //    //{ }
        //}

        //protected void btnManSubmit_Click(object sender, EventArgs e)
        //{
        //    using (var context = new cathlabEntities())
        //    {
        //        string manName = tbManufacturerName.Text;
        //        Manufacturer man = new Manufacturer();
        //        man.Name = tbManufacturerName.Text;
        //        man.Email = tbxEmail.Text;
        //        man.PhoneNumber = tbxPhoneNumber.Text;
        //        man.Address = tbxAddress.Text;
        //        context.Manufacturers.Add(man);
        //        context.SaveChanges();
        //        int mmm = (int)(from mann in context.Manufacturers where mann.Name == manName select mann.ID).First();
        //        loadManufacturers();
        //        pnlNewPartNumber.Visible = true;
        //        pnlNewManufacturer.Visible = false;
        //        lbxManufacturer.SelectedValue = mmm.ToString();
        //    }
        //}

        //protected void btnManCancel_Click(object sender, EventArgs e)
        //{
        //    pnlNewManufacturer.Visible = false;
        //    pnlNewProdType.Visible = false;
        //    pnlNewPartNumber.Visible = true;
        //}
        //#endregion NewManufacturer

        //#region ProdType
        //protected void lbxProdType_TextChanged(object sender, EventArgs e)
        //{
        //    int prodTypeID = -1;
        //    int.TryParse(lbxProdType.SelectedValue, out prodTypeID);
        //    if (prodTypeID == 0)
        //    {
        //        pnlNewProdType.Visible = true;
        //        pnlNewManufacturer.Visible = false;
        //        pnlNewPartNumber.Visible = false;
        //    }
        //    //else
        //    //{ }
        //}

        //protected void btnPTSubmit_Click(object sender, EventArgs e)
        //{
        //    using (var context = new cathlabEntities())
        //    {
        //        // Check for existing Prod Type?
        //        string ptType = tbNProdType.Text;
        //        ProductType pt = new ProductType();
        //        pt.Type = tbNProdType.Text;
        //        context.ProductTypes.Add(pt);
        //        context.SaveChanges();
        //        int ptID = (int)(from prodType in context.ProductTypes where prodType.Type == ptType select prodType.ID).First();
        //        loadProductTypes();
        //        pnlNewPartNumber.Visible = true;
        //        pnlNewProdType.Visible = false;
        //        loadProductTypes();
        //        lbxProdType.SelectedValue = ptID.ToString();
        //    }
        //}

        //protected void btnPTCancel_Click(object sender, EventArgs e)
        //{
        //    pnlNewPartNumber.Visible = true;
        //    pnlNewProdType.Visible = false;
        //}
        //#endregion ProdType
    }
}