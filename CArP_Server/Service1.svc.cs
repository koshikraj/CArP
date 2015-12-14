using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using MongoDB.Bson;
using MongoDB.Driver;
using MongoDB.Driver.Builders;

namespace carp
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
 
    public class Service1 : IService1
    {
        public class Entity
        {
            public ObjectId Id { get; set; }
            public string userId { get; set; }
            public string password { get; set; }
        }

        public string Getcarp()
        {
            carpImage imgObj = new carpImage();
            return imgObj.createCarpImage();
        }
        public string storePassword(string uid,string cord,string img)
        {
            var connectionString = "mongodb://localhost";
            var client = new MongoClient(connectionString);
            var server = client.GetServer();

            var database = server.GetDatabase("carpDb");
            // string all="";
           
            var authCollection = database.GetCollection<Entity>("carpAuth");
            carpImage imgObj = new carpImage();
            string a=imgObj.regenerateCarpImage(img);
            string[] xy,X;
            int Xp, Yp;
            string ch="";
              int Xl,Xh,Yl,Yh;
              xy = cord.Split(',');
                string[] alpha = a.Split('-');
           
            for (int i = 1; i < xy.Length; i++)
            {
                X=xy[i].Split(':');
                Xp = int.Parse(X[0]);
                Yp = int.Parse(X[1]);
                for (int j = 0; j < alpha.Length; j++)
                {
                    string[] Cx = alpha[j].Split(':');
                    Xl = int.Parse(Cx[0]);
                    Xh = int.Parse(Cx[1]);
                    Yl = int.Parse(Cx[2]);

                    Yh = int.Parse(Cx[3]);
                    if (Xp >= Xl && Xp <= Xh && Yp >= Yl && Yp <= Yh)
                        ch += (char)(j + 65);
                }
          
            }

            var entityAuth = new Entity { userId = uid, password = ch };
            authCollection.Insert(entityAuth);
                return string.Format("sign up complete for {0} pass:{1} ", uid,ch);
        }

        public string validateUserId(string uid, string cord, string img)
        {
            var connectionString = "mongodb://localhost";
            var client = new MongoClient(connectionString);
            var server = client.GetServer();

            var database = server.GetDatabase("carpDb");
            // string all="";

            var authCollection = database.GetCollection<Entity>("carpAuth");
            carpImage imgObj = new carpImage();
            string a = imgObj.regenerateCarpImage(img);
            string[] xy, X;
            int Xp, Yp;
            string ch = "";
            int Xl, Xh, Yl, Yh;
            xy = cord.Split(',');
            string[] alpha = a.Split('-');

            for (int i = 1; i < xy.Length; i++)
            {
                X = xy[i].Split(':');
                Xp = int.Parse(X[0]);
                Yp = int.Parse(X[1]);
                for (int j = 0; j < alpha.Length; j++)
                {
                    string[] Cx = alpha[j].Split(':');
                    Xl = int.Parse(Cx[0]);
                    Xh = int.Parse(Cx[1]);
                    Yl = int.Parse(Cx[2]);

                    Yh = int.Parse(Cx[3]);
                    if (Xp >= Xl && Xp <= Xh && Yp >= Yl && Yp <= Yh)
                        ch += (char)(j + 65);
                }

            }

            var query=Query<Entity>.EQ(e=>e.userId,uid);
            var cursor=authCollection.FindOne(query);
            if (cursor.password == ch)
                return cursor.userId;
            else
                return "login failed";
           

        }
        
    }
}
