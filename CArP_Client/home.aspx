<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="carpClient.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

#main_container {
    background-color: #FFF;
   
}
#topbar {
    background-color: darkgray;
    height:30px;
    
   
}

#leftbar
        {
    position:relative;
     background-color: darkgray;
     top:5px;
    width:300px;
    height:600px;


        }
#floatbar
        {
    position:absolute;
     background-color: darkgray;
     top:45px;
     right:5px;
    width:200px;
    height:600px;


        }
        
#textbar
        {
    position:absolute;
     background-color: lightgray;
     top:45px;
     right:250px;
    width:750px;
    height:600px;


        }
#logout:hover {
    background-color:white;}

        </style>
    <script type="text/javascript">
        function logout() {
            var h = document.getElementById("hid");
            if (h!=null)
            h.click();
        }
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="main_container">
        <div id="topbar">
            <label style="position:absolute;right:20px;color:black;cursor:pointer;" onclick="logout()" id="logout">logout</label>
           
            <asp:Button ID="hid"  style="display:none" runat="server" onclick="hid_Click" />
        <label id="user" runat="server" style="position:absolute;left:20px;color:black"></label>
             </div> 
        <div id="leftbar">
            </div>
        <div id="textbar">

        </div>
        <div id="floatbar">
            </div>

    
    </div>
    </form>
</body>
</html>
