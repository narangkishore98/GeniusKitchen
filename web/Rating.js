var n = 0;
var n1 = 0;
var n2 = 0;
var n3 = 0;
// Overall Rating
function fill(obj)
{
    var img = obj.src;
    var id = obj.id;
    var val = parseInt(id.substring(id.indexOf("_") + 1));
    var i;
    if (n === 0)
    {
        i = 1;
    }
    else
    {
        i = n + 1;
    }
    for (; i <= 5; i++)
    {
        if (i <= val)
        {
            document.getElementById("rating_" + i).src = "rating/filled_star.png";

        }
        else
        {
            document.getElementById("rating_" + i).src = "rating/empty_star.png";
        }
    }

}
function selected(obj)
{
    var id = obj.id;
    var val = parseInt(id.substring(id.indexOf("_") + 1));
    n = val;
    document.getElementById("rate").value = n;
}
function unfill(obj)
{
    var i;
    if (n == 0)
    {
        i = 1;
    }
    else
    {
        i = n + 1;
    }
    for (; i <= 5; i++)
    {
        document.getElementById("rating_" + i).src = "rating/empty_star.png";
    }
}

//Spicy
function fill1(obj)
{
    var img = obj.src;
    var id = obj.id;
    var val = parseInt(id.substring(id.indexOf("_") + 1));
    var i;
    if (n1 === 0)
    {
        i = 1;
    }
    else
    {
        i = n1 + 1;
    }
    for (; i <= 5; i++)
    {
        if (i <= val)
        {
            document.getElementById("rating1_" + i).src = "rating/filled_star.png";

        }
        else
        {
            document.getElementById("rating1_" + i).src = "rating/empty_star.png";
        }
    }

}
function selected1(obj)
{
    var id = obj.id;
    var val = parseInt(id.substring(id.indexOf("_") + 1));
    n1 = val;
    document.getElementById("rate1").value = n1;
}
function unfill1(obj)
{
    var i;
    if (n1 === 0)
    {
        i = 1;
    }
    else
    {
        i = n1 + 1;
    }
    for (; i <= 5; i++)
    {
        document.getElementById("rating1_" + i).src = "rating/empty_star.png";
    }
}

//Yummy
function fill2(obj)
{
    var img = obj.src;
    var id = obj.id;
    var val = parseInt(id.substring(id.indexOf("_") + 1));
    var i;
    if (n2 === 0)
    {
        i = 1;
    }
    else
    {
        i = n2 + 1;
    }
    for (; i <= 5; i++)
    {
        if (i <= val)
        {
            document.getElementById("rating2_" + i).src = "rating/filled_star.png";

        }
        else
        {
            document.getElementById("rating2_" + i).src = "rating/empty_star.png";
        }
    }

}
function selected2(obj)
{
    var id = obj.id;
    var val = parseInt(id.substring(id.indexOf("_") + 1));
    n2 = val;
    document.getElementById("rate2").value = n2;
}
function unfill2(obj)
{
    var i;
    if (n2 === 0)
    {
        i = 1;
    }
    else
    {
        i = n2 + 1;
    }
    for (; i <= 5; i++)
    {
        document.getElementById("rating2_" + i).src = "rating/empty_star.png";
    }
}

//Presentation
function fill3(obj)
{
    var img = obj.src;
    var id = obj.id;
    var val = parseInt(id.substring(id.indexOf("_") + 1));
    var i;
    if (n3 === 0)
    {
        i = 1;
    }
    else
    {
        i = n3 + 1;
    }
    for (; i <= 5; i++)
    {
        if (i <= val)
        {
            document.getElementById("rating3_" + i).src = "rating/filled_star.png";

        }
        else
        {
            document.getElementById("rating3_" + i).src = "rating/empty_star.png";
        }
    }

}
function selected3(obj)
{
    var id = obj.id;
    var val = parseInt(id.substring(id.indexOf("_") + 1));
    n3 = val;
    document.getElementById("rate3").value = n3;
}
function unfill3(obj)
{
    var i;
    if (n3 === 0)
    {
        i = 1;
    }
    else
    {
        i = n3 + 1;
    }
    for (; i <= 5; i++)
    {
        document.getElementById("rating3_" + i).src = "rating/empty_star.png";
    }
}