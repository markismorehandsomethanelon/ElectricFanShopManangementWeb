﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyShopBanQuatDien.Entities
{
    [Serializable]
    public class SupplierEntity
    {
        public string code { get; set; }
        public string name { get; set; }
        public string contactPerson { get; set; }
        public string phoneNumber { get; set; }
        public string address { get; set; }
    }
}