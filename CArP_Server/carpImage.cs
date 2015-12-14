using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MongoDB.Bson;
using MongoDB.Driver;
using MongoDB.Driver.Builders;
using MongoDB.Driver.Linq;

namespace carp
{
    public class carpImage
    {
        public class imgEntity
        {
            public ObjectId Id { get; set; }
            public string id { get; set; }
            public string cordinates { get; set; }
        }
        public string regenerateCarpImage(string id)
        {
             
            var connectionString = "mongodb://localhost";
            var client = new MongoClient(connectionString);
            var server = client.GetServer();

            var database = server.GetDatabase("carpDb");
            var collection = database.GetCollection<imgEntity>("carpImg");

            var query = Query<imgEntity>.EQ(e => e.id, id);

            var entity = collection.FindOne(query);
            return entity.cordinates;
             
        }

        public string createCarpImage()
        {
            var connectionString = "mongodb://localhost";
            var client = new MongoClient(connectionString);
            var server = client.GetServer();
            string[] ids = { "carpImg1", "carpImg2" };

            var database = server.GetDatabase("carpDb");
            var collection = database.GetCollection<imgEntity>("carpImg");

           // var query = Query.EQ("id", "carpImg1");
            var cursor = collection.FindAll();
          
            Random rnd=new Random();
            return ids[rnd.Next(ids.Length)];
        }
    }
}