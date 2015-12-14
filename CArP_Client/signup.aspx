<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="carpClient.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>carp client</title>
   <style type="text/css">

body {
    background-color: #FFF;
    margin: 200px;
    margin-top: 100px;
}
#contentContainer {
    width: 450px;
    height: 450px;
    
    overflow: hidden;
    background-color: #F2F2F2;
    cursor: pointer;
}
    #disp
    {
        position:absolute;color:black;
        top:120px;
        left:30px;
        font-size : 20px;
        font-family:'Arial Rounded MT';
        

    }
       #textuser
       {
            position:absolute;color:black;
        top:100px;
        left:700px;
        font-size : 20px;
        background-color : slategrey;
          font-family:'Arial Rounded MT';
          height:300px;
          width:500px;
          padding-left:30px;
          padding-top:30px;
       }
    #strength
    {
        position:absolute;
        top:200px;
        left:20px;
        font-size : 20px;
        font-family:'Arial Rounded MT';
        

    }
#but {position:absolute;color:white;cursor:pointer;
 background-color : #6BFF8A;
    background-image : linear-gradient(to bottom, transparent 0%, rgba(0, 0, 0, 0.2) 100%);
    color : #fff;
    display : block;
    font-family : arial,sans-serif;
    font-size : 20px;
    padding : 5px 10px;
    text-align : center;
    text-decoration : none;
    transition : background-color 0.5s ease 0s;
    width : 100px;
    top:250px;
    left:20px;


}

#but:hover {
    background-color : #000030;}

#thing {
    position: relative;
    left: 50px;
    top: 50px;
    transition: left .5s ease-in, top .5s ease-in;
}
    body
    {
        background-color:lightgray;
       
    }
</style>
</head>
 

<body>
    <div id="contentContainer" runat="server">
    <img id="thing" src="Untitled.png"/>
</div>
 
<script src="http://www.kirupa.com/prefixfree.min.js"></script>
<script>
    var theThing = document.querySelector("#thing");
    var container = document.querySelector("#contentContainer");
    var ch =0, Cord = "";
    container.addEventListener("click", getClickPosition, false);

    function getClickPosition(e) {
        var parentPosition = getPosition(e.currentTarget);
        var xPosition = e.clientX - parentPosition.x - (theThing.clientWidth / 2);
        var yPosition = e.clientY - parentPosition.y - (theThing.clientHeight / 2);
        var Xp = e.clientX - 200, Yp = e.clientY - 100;


        theThing.style.left = xPosition + "px";
        theThing.style.top = yPosition + "px";
        //document.getElementById("disp").innerHTML = Xp + " ";
        //document.getElementById("disp").innerHTML += Yp;
        ch++;
        var pass_strength, col;
        Cord += "," + String(Xp) + ":" + String(Yp);
        document.getElementById("disp").innerHTML = Array(ch+1).join("* ");
        if (ch < 6) {
            col = "red";
            pass_strength = "weak";
        }
        else
            if (ch < 10) {
                pass_strength = "strong";
                col = "green";
            }
            else
                pass_strength = "very strong";
        document.getElementById("Hidden").value = Cord;
        document.getElementById("strength").style.color = col;
        document.getElementById("strength").innerHTML = "(" + pass_strength + " password!)";
    }

    function getPosition(element) {
        var xPosition = 0;
        var yPosition = 0;

        while (element) {
            xPosition += (element.offsetLeft - element.scrollLeft + element.clientLeft);
            yPosition += (element.offsetTop - element.scrollTop + element.clientTop);
            element = element.offsetParent;


        }
        return { x: xPosition, y: yPosition };

    }
    function Onsubmit() {
        if (ch == "ADMIN")
            document.getElementById("disp").innerHTML = "login successful";
        else {
            document.getElementById("disp").innerHTML = "login failure Try Again";
            document.getElementById("contentContainer").style.backgroundImage = "url('CAP2.jpg')";

        }
        ch = "";

    }
    function DivClicked() {
        var btnHidden = document.getElementById("hidButton");
        if (btnHidden != null) {
            btnHidden.click();
        }
    }
</script>
    
      


    <form id="form1" runat="server">
    <div id="textuser">   Enter user name: 
        <input id="loginText" type="text" runat="server" value="username" size="30"/>
        <br/>
        <br/>Enter password:
        <asp:Label ID="disp" runat="server" Text=""></asp:Label>
       
        <asp:Label ID="strength" runat="server" Text=""></asp:Label>
        <asp:Button ID="hidButton" runat="server" Text="Button" style="display:none" onclick="Button1_Click"/>
        <input id="Hidden" type="hidden" value="" runat="server"/>
        <div id="but" runat="server" onclick="DivClicked()">
        submit
        </div>
        </div>
    </form>
</body>
</html>
