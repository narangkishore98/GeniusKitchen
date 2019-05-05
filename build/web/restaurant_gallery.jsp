

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant gallery</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script type="text/javascript">
            function go(obj)
            {
                var name = document.getElementById("ff").value;
                var ext = name.substring(name.lastIndexOf("."));
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".JPG")
                {
                    var cap = document.getElementById("caption").value;
                    obj.action = obj.action + "?fn=" + name + "&cap=" + cap;
                    return true;
                }
                else
                {
                    alert("Upload Image Files only");
                    return false;
                }
            }
             var xmlhttp;
            
            function go1()
            {
                try
                {
                    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP")  // For Old Microsoft Browsers
                }
                catch (e)
                {
                    try
                    {
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")  // For Microsoft IE 6.0+
                    }
                    catch (e2)
                    {
                        xmlhttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
                    }
                }
                xmlhttp.onreadystatechange=go2;
                xmlhttp.open("GET","./restaurant_gallery",true);
                xmlhttp.send();
            }
            function go2()
            {
                if (xmlhttp.readyState===4 && xmlhttp.status===200)
                {
                    document.getElementById("pic").innerHTML=xmlhttp.responseText;
                }
            }
            function delete23(ob)
            {
//                alert(ob);
                try
                {
                    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP") // For Old Microsoft Browsers
                }
                catch(e)
                {
                    try
                    {
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP") //For Microsoft IE 6.0+
                    }
                    catch(e2)
                    {
                        xmlhttp = new XMLHttpRequest(); //For Mozilla, Opera Browsers
                    }
                }
                
                var flag = confirm("Are you sure you want to delete?");
                if(flag)
                {
                 xmlhttp.onreadystatechange=delete24;
                 xmlhttp.open("GET","./restaurant_gallery_delete?id="+ob,true);
                 xmlhttp.send();
                }
            }
            function delete24()
            {
//                alert(xmlhttp.responseText);
                 if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    go1();
                    //document.getElementById("pic").innerHTML=xmlhttp.responseText;
                }
            }
        </script>
    </head>
    
    <body onload="go1()" style="background-color: #F4F4F4;">
        <%@include file="header_rest.jsp"%>
            
         <div class="container-fluid" align="center">
           <br/>
                <h2>Restaurant Gallery</h2>
                <br>
        
        <div id="pic">
            
        </div>
        
        <form action="restaurant_gallery2.jsp" method="post" enctype="multipart/form-data" onsubmit="return go(this);">
            <table>
                <tr>
                    <td>Caption</td>
                    <td><input type="text" name="caption" id="caption" required class="form-control"/></td>
                </tr>
                <tr>
                    <td><br/>Select File</td>
                    <td><br/><input type="file" name="file" id="ff" required class="form-control"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><br/><input type="submit" value="Upload File" class="btn btn-danger"></td>
                </tr>
            </table>
        </form>
                <br/><br/>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
