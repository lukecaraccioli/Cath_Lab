﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

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
                loadProductTypes();                
            }
        }

        #region PopulateListboxes
        protected void loadProductTypes()
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

        protected void lbxProdType_TextChanged(object sender, EventArgs e)
        {
            int.TryParse(lbxProdType.SelectedValue, out typeId);
            if (typeId == 0)
            {
                loadManufacturers();
                //lbxManufacturer.SelectedValue = "0";
            }
            else
            {
                using (var context = new cathlabEntities())
                {
                    List<Manufacturer> temp = (from prod in context.Products
                                               where prod.PartNumber1.ProductTypeID == typeId
                                               select prod.PartNumber1.Manufacturer).Distinct().ToList();
                    Manufacturer a = new Manufacturer();
                    a.ID = 0; a.Name = "All";
                    temp.Insert(0, a);
                    lbxManufacturer.DataTextField = "Name";
                    lbxManufacturer.DataValueField = "ID";
                    lbxManufacturer.DataSource = temp;
                    lbxManufacturer.DataBind();
                }
            }
            rgInventory.Rebind();
            lbxLocation.DataSource = null;
            lbxLocation.DataBind();
            //lbxManufacturer.SelectedValue = "0";
            //lbxLocation.SelectedValue = "0";
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

        protected void lbxManufacturer_TextChanged(object sender, EventArgs e)
        {
            int.TryParse(lbxManufacturer.SelectedValue, out manId);
            if (manId == 0)
            {
                loadLocations();
                //lbxLocation.SelectedValue = "0";
            }
            else
            {
                using (var context = new cathlabEntities())
                {
                    var temp = (from prod in context.Products
                                where prod.PartNumber1.ManufacturerID == manId && prod.PartNumber1.ProductTypeID == typeId
                                select new { ID = prod.LocationID, Name = prod.Location.LocationName }).Distinct().ToList();
                    lbxLocation.DataTextField = "Name";
                    lbxLocation.DataValueField = "ID";
                    lbxLocation.DataSource = temp;
                    lbxLocation.DataBind();
                }
            }
            rgInventory.Rebind();
            //lbxLocation.SelectedValue = "0";
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

        protected void lbxLocation_TextChanged(object sender, EventArgs e)
        {
            int.TryParse(lbxLocation.SelectedValue, out locId);
            rgInventory.Rebind();
        }
        #endregion PopulateListboxes

        protected void rgInventory_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            using (var context = new cathlabEntities())
            {
                var temp = context.GetProductCounts().AsEnumerable();
                //(from prod in context.Products
                //        select new
                //        {
                //            prod.ID,
                //            prod.PartNumber,
                //            prod.PartNumber1,
                //            prod.PartNumber1.NameSize,
                //            prod.PartNumber1.ProductType.Type,
                //            prod.Location.LocationName,
                //            prod.PartNumber1.Manufacturer.Name,
                //            prod.LocationID,
                //            //prod.SerialNumber,
                //            //prod.ExpirationDate,
                //            //prod.PartNumber1.NameSize
                //        }).Distinct();
                //            //.Select(prod => new
                //            //{
                //            //    prod.ID,
                //            //    prod.PartNumber,
                //            //    Manufacturer = prod.Name,
                //            //    prod.PartNumber1.NameSize,
                //            //    //Count = (from p in context.Products where p.PartNumber == prod.PartNumber select p).Count(),
                //            //    Count = 8,
                //            //    prod.PartNumber1.ProductType.Type,
                //            //    prod.PartNumber1,
                //            //    prod.LocationID,                                    
                //            //});
                if (typeId != 0)
                    temp = temp.Where(a => a.ProductTypeID == typeId);
                if (manId != 0)
                    temp = temp.Where(a => a.ManufacturerID == manId);
                if (locId != 0)
                    temp = temp.Where(a => a.LocationID == locId);
                rgInventory.MasterTableView.DataSource = temp.ToList();
            }
        }
        
        protected void rgInventory_DetailTableDataBind(object sender, GridDetailTableDataBindEventArgs e)
        {
            GridDataItem dataItem = (GridDataItem)e.DetailTableView.ParentItem;
            using (var context = new cathlabEntities())
            {
                string PartNum = dataItem.GetDataKeyValue("PartNumber").ToString();
                int LocationID = (int)dataItem.GetDataKeyValue("LocationID");
                var temp = (from prod in context.Products
                            where prod.PartNumber == PartNum && prod.LocationID == LocationID
                            select new { prod.Location.LocationName, prod.LotNumber, prod.SerialNumber, prod.ExpirationDate });
                e.DetailTableView.DataSource = temp.ToList();
            }
        }
    }
}