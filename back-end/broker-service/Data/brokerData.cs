
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using System.Collections.Generic;
using broker.Models;

namespace broker.Data
{
    public class BrokerData
    {
       
       
       

        public List<Broker> service { get; set; }

        public int  totalPage { get; set; }

       public BrokerData(int totalPage, List<Broker> brokers){
           this.totalPage=totalPage;
           this.service=service;
       }



       

       




    }

}