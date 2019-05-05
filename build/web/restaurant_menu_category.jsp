
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>menu category of restaurant</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script type="text/javascript">
            
            function go(obj)
            {
                var image = document.getElementById("ff").value;
                var name = document.getElementById("cname").value;
                var description= document.getElementById("desc").value;
                var ext = image.substring(image.lastIndexOf("."));
                if(ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext ==".JPG")
                {
                    obj.action = obj.action + "?image=" +image+"&name="+ name+"&desc="+description;
                    return true;
                }
                else
                {
                    alert("Upload Image Files only");
                    return false;
                }
            }
         </script>
    </head>
    <body style="background-color: #F4F4F4;">
        <%@include file="header_rest.jsp"%>
            
         <div class="container-fluid" align="center">
           <br/>
                <h2> Add menu category</h2>
                <br>
        <form action="restaurant_menu_category2.jsp" method="post" enctype="multipart/form-data" onsubmit="return go(this)">
            <table align="center">
                <tr>
                    <td>Category Name</td>
                    <td><input type="text" name="cname" id="cname" class="form-control" required/></td>
                </tr>
                <tr>
                    <td><br/>Description</td>
                    <td><br/><textarea rows="5" cols="30" name="description" class="form-control" id="desc" required></textarea></td>
                </tr>
                <tr>
                    <td><br/>Photo</td>
                    <td><br/><input type="file" name="file" id="ff" required class="form-control"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><br/><input type="submit" value="Add" class="btn btn-primary"/></td>
                </tr>
                
            </table>  
        </form><br/><br/>
        </div>
            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
