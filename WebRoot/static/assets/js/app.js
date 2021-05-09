

animates = [
    "bounce",
    "flash",
    "pulse",
    "rubberBand",
    "shake",
    "swing",
    "tada",
    "wobble",
    "jello",
    "bounceIn",
    "bounceInDown",
    "bounceInLeft",
    "bounceInRight",
    "bounceInUp",

    "fadeIn",
    "fadeInDown",
    "fadeInDownBig",
    "fadeInLeft",
    "fadeInLeftBig",
    "fadeInRight",
    "fadeInRightBig",
    "fadeInUp",
    "fadeInUpBig",

    "flip",
    "flipInX",
    "flipInY",

    "lightSpeedIn",

    "rotateIn",
    "rotateInDownLeft",
    "rotateInDownRight",
    "rotateInUpLeft",
    "rotateInUpRight",

    "slideInUp",
    "slideInDown",
    "slideInLeft",
    "slideInRight",

    "zoomIn",
    "zoomInDown",
    "zoomInLeft",
    "zoomInRight",
    "zoomInUp",


    "jackInTheBox",
    "rollIn",

];


function rnd(n, m){
    var random = Math.floor(Math.random()*(m-n+1)+n);
    return random;
}

var a = ["success","info","danger","warning"];
var b = ["success","primary","info","danger","warning","default"];

$(document).ready(function(){


    $("table").removeClass("sTable");

   // $("table").css("background","#fff");
    $("input[type=text],input[type=password],textarea").addClass("form-control");
    $("button,input[type=submit]").addClass("btn-round btn-sm btn-xs  btn btn-primary");
    $("table th").attr("style","");
    $("table td").each(function(){
        $(this).attr("style","");
        var html =$(this).html();
        html = html.replace("[","");
        html = html.replace("[","");
        html = html.replace("[","");	html = html.replace("[","");
        html = html.replace("[","");
        html = html.replace("[","");
        html = html.replace("]","");
        html = html.replace("]","");
        html = html.replace("]","");html = html.replace("]","");
        html = html.replace("]","");
        html = html.replace("|","");
        html = html.replace("|","");
        html = html.replace("|","");
        html = html.replace("|","");
        $(this).html(html);
    });
    $("table").addClass("table table-striped ");
   // $("table td a").addClass("btn btn-"+b[rnd(0,b.length-1)]);
    $(".title h6").addClass("alert alert-" + a[rnd(0, a.length - 1)]);
    $(".container_12").find("p").eq(0).css("width","200px");
    $(".container_12").find("p").eq(0).addClass("label label-" + a[rnd(0, a.length - 1)]);
    $(".nNote").addClass("alert alert-"+a[rnd(0,a.length-1)]);

    $(".widget").css("border-radius","0px");
    //$(".widget").css("padding","20px");
    $(".widget").css("margin","0px");
    //$(".widget").css("marginTop","20px");
    //$("body,table>thead>tr>th,.table thead td,.table>thead>tr>th,table>tr>td,table>tr>td a").css("color","#fff");
    $("table td a,.table-operate a").each(function(){
        $(this).addClass("button btn-round btn-xs btn btn-"+b[$(this).index()]);
    })
    $(".formRow").css("border","none");
    $(".widget,.table,input,button").each(function () {
        //$(this).addClass(" animated "+animates[rnd(0,animates.length)]);
        $(this).addClass(" animated fadeIn");
    });
    $("form").css("width","50%");
    $("table thead tr,thead td").css("background","none");
    $("table thead tr,thead td").css("color","#000");
    $("table thead tr,thead td").css("font-weight","bold");
    $("table thead td").css("border-bottom","none");
   // $("table,table td").css("border-color","#455360");
    $(".page-content").css("background","none");
    $("body").css("background","#fff"); $("body").css("padding","18px 10px");
    $("table").css("background","#fff");
    $(".page-header").css("border-bottom","none");
    $(".page-header h1").css("color","#455360");
    $(".page-header h1").css("margin-left","0px");
    $(".page-header h1").css("padding-left","10px");
    $(".page-header h1").css("border-left","4px solid #455360");
    $(".form-horizontal .control-label").css("text-align","left");
    $(".form-actions,select,input.form-control").css("background","none");
    //$(".form-actions,select,input.form-control").css("border","none");
   // $(".form-control").css("border-bottom","1px solid #007bff");
    $(".card,hr").css("border","none!important");
    $(".d-flex a,.card-header,hr,.hr,#breadcrumbs").hide();
    //$(".card").hide();
 //   $("#breadcrumbs,.page-header").hide();
    $(".portlet-title,.title").hide();//addClass("alert alert-" + a[rnd(0, a.length - 1)]);
    $(".tpl-portlet-components").css("width","100%");
    
    $("button[type=submit]").css("margin-top","15px");
});
