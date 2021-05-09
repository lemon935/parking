<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>停车管理收费系统</title>
    <meta name="description" content="Neat">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   

    <!-- Favicon -->
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="<%=basePath %>static/v1/css/neat.min.css?v=1.0">
    
     
    <style>
    .gradient {
    background: #002453;
    background: -moz-linear-gradient(45deg, #002453 0%, #ff2b4a 100%);
    background: -webkit-gradient(linear, left bottom, right top, color-stop(0%,#002453), color-stop(100%,#ff2b4a));
    background: -webkit-linear-gradient(45deg, #002453 0%,#ff2b4a 100%);
    background: -o-linear-gradient(45deg, #002453 0%,#ff2b4a 100%);
    background: -ms-linear-gradient(45deg, #002453 0%,#ff2b4a 100%);
    background: linear-gradient(45deg, #002453 0%,#ff2b4a 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#002453', endColorstr='#ff2b4a',GradientType=1 );
}
.gradient {
    left: 0;
    opacity: 0.8;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
}

.cw{background:#787468;
display:inline-block;margin-bottom:15px;margin-right:15px;
padding:15px;border-radius:24px;width:180px;height:300px;}
.cw-inner{border:4px dashed #fff; border-radius:24px;height:270px;position:relative;
line-height:250px;font-size:30px;color:#fff;text-align:center;

}
.cw-inner p{font-size:30px;color:#fff;text-align:center;
}
.cw-inner .car{display:none}
.cw.disab .cw-inner .car{display:block}
.navbar li a{font-size:18px;color:#fff;display:block;padding:12px 15px;}
.navbar li {display:inline-block;}
    </style>
  </head>
 <body style="background:#fff;background-size:cover">
  
	<!-- header-section-ends -->
  <div class="hd" style="border-color: #2083fe;
    background-color: #2083fe;">
   <div class="">
   <div class="container" STYLE="width:80%;max-width:80%">
   	<ul class="navbar navbar-default">
   		<li>
   			<a style="font-weight:bold; color:#FFF;font-size:21px;" href="<%=basePath %>">停车管理收费系统</a>
   		</li>
   		<c:forEach items="${list }" var="u1">
   		<li>
   			<a href="<%=basePath %>backendui/order?area=${u1.id}">${u1.title} </a>
   		</li>
   		</c:forEach>
   		
   	</ul>
   </div>
   </div>
  </div>
  
  
<h2 style="padding:20px;color:#333;text-align:right">
<a class="btn btn-danger " style="color:#333;z-index:999" href="<%=basePath %>backendui/index">
<i class="fa fa-user"></i>
我的</a>
</h2>
    <div class="container" STYLE="width:90%;max-width:90%">
    <div class="row">
    
  
     <div class="col-md-12" >
     <div style="border:0px solid #ddd;background:#fff">
     
              <div style="text-align:center;">
              <c:forEach items="${list1 }" var="u1">
              
              <div class="cw" datam="${u1.description }" 
              datac="${u1.bodytext }" datax="${u1.uid }" datay="${u1.id }" >
              	<div class="cw-inner">
              	<p style="position:relative;z-index:99">${u1.title }
              	</p>
              	<div class="car" style="z-index:1;margin:0 auto;position:absolute;top:0;left:0;width:100%">
              		<img style="width:80%;height:240px;margin:0 auto;display:block;" src="<%=basePath %>static/car.png">
              	</div>
              	</div>
              	
              	
              </div>
              <!-- 
              <button datam="${u1.description }" 
              datac="${u1.bodytext }" datax="${u.id }" datay="${u1.id }" 
              style="width:120px;margin-bottom:10px;" class="c-btn c-btn-primary">${u1.title }</button>
               -->
              
              
            </c:forEach>
              </div>
              
     </div></div>
     
   
          
          
          
          
          
          
         
        
        </div>

    <!-- Main JavaScript -->
    <script src="<%=basePath %>static/v1/js/neat.min.js?v=1.0"></script>
    <script src="<%=basePath %>static/layer/layer.min.js?v=1.0"></script>
    <link href="<%=basePath %>static/dist/sweetalert.css" rel="stylesheet" >
    <script src="<%=basePath %>static/dist/sweetalert.min.js"></script>
    
    
<c:if test="${!empty state}">
		
			<script>layer.alert("成功，请登录",{icon:1});
			
setTimeout(function(){
window.location.href = "<%=basePath%>backendui/login.html";
				}, 1500);
			</script>
		
	
    
    

	</c:if>
    	
<script>
$(document).ready(function(){
	
	$(".cw").each(function(item){
		var that = $(this);
		var datax = $(this).attr("datax");
		var datay = $(this).attr("datay");
		var ps = "x="+datax+"&y="+datay;
		$.get("<%=basePath%>backendui/check?"+ps,function(rest){
			if(rest==2){
				that.addClass("disab")
			}
		})
	})
		
	$(".cw").click(function(){
		if( $(this).hasClass("disab")) return;
		var id = $(this).attr("datay");
		var d = $(this).attr("datam");
		var v = $(this).attr("datac");
		var datax = $(this).attr("datax");
		var datay = $(this).attr("datay");
		
		swal({
	         title:d,
	         text:v,	       
	         showCancelButton:true,
	         closeOnConfirm:true,
	         confirmButtonText:'我要停车',
	         cancelButtonText:'取消',
	         animation:'slide-from-top',	       
	     },function(){
	    	
	    	 <c:if test="${empty userid}">
	    	 layer.alert("请您登录",{icon:2});
	    	 </c:if>
	    	 <c:if test="${not empty userid}">
	    	 
	    	 goTo(datax,datay);
	    	 
	    	 layer.prompt({title: '登记车牌号', formType: 1}, function(pass, index){
	    		  //layer.close(index);
	    		  alert(pass);
	    		});
	    	 
	    	 
	    	 
	    	 
	    	 
	    	 
	    	 </c:if>
	     });
		
	  
		
	});
	
	
});

function goTo(datax,datay){
	swal({
        title:'登记车牌号',
        text:'',
        type:'input',
        showCancelButton:true,
        closeOnConfirm:false,
        confirmButtonText:'确定',
        cancelButtonText:'取消',
        animation:'slide-from-top',
        inputPlaceholder:'请输入'
    },
    function(inputValue){
       if(inputValue==false) return false;
       if(inputValue==''){
        swal.showInputError('你必须输入时间');
        return false;
       }
       url = "<%=basePath%>backendui/park?x="+datax+"&y="+datay+"&no="+inputValue;
       $.get(url,function(e){
       	layer.alert("停车成功",{icon:1});
       	swal.close();

       	setTimeout(function(){
       	window.location.href = window.location.href;
       					}, 1000);
       })
       
       //swal('非常好','您输入的内容是：'+inputValue,'success');
    }
    );
	 
	 
	
}


</script>
  </body>
</html>