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
    <title> 停车管理收费系统</title>
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
    </style>
  </head>
  <body style="background:url(<%=basePath %>static/34.jpg) no-repeat;background-size:cover">
<div class="gradient"></div>
    <div class="o-page o-page--center" style="padding-top:0px">
      <div class="o-page__card" style="margin-left:0px;">
        <div class="c-card c-card--center" style="min-height:980px;">
          <span style="width:100%;font-size:25px;background:none" class="c-icon c-icon--large u-mb-small">
           停车管理收费系统
          </span>

          <h4 class="u-mb-medium"> </h4>
          <form action="<%=basePath %>backendui/reg" method="post" >
            <div class="c-field">
              <label class="c-field__label">账号</label>
              <input class="c-input u-mb-small" type="text" name="username" placeholder="账号" required>
            </div>
            
            <div class="c-field">
              <label class="c-field__label">密码</label>
              <input class="c-input u-mb-small" type="password" name="password" placeholder="密码" required>
            </div>
            
             <div class="c-field">
              <label class="c-field__label">确认密码</label>
              <input class="c-input u-mb-small" type="password" name="password2" placeholder="确认密码" required>
            </div>
            
              <div class="c-field">
              <label class="c-field__label">电话</label>
              <input class="c-input u-mb-small" type="text" name="tel" placeholder="电话" required>
            </div>
            
              <div class="c-field">
              <label class="c-field__label">邮箱</label>
              <input class="c-input u-mb-small" type="text" name="email" placeholder="邮箱" required>
            </div>

            <button class="c-btn c-btn--fullwidth c-btn--info">下一步</button>
            <br>
            <br>
            <a href="<%=basePath %>backendui/login">返回登录</a>
          </form>
        </div>
      </div>
    </div>

    <!-- Main JavaScript -->
    <script src="<%=basePath %>static/v1/js/neat.min.js?v=1.0"></script>
    <script src="<%=basePath %>static/layer/layer.min.js?v=1.0"></script>
    
<c:if test="${!empty state}">
		
			<script>layer.alert("注册成功，请登录",{icon:1});
			
setTimeout(function(){
window.location.href = "<%=basePath%>backendui/login.html";
				}, 1500);
			</script>
		
		

    
    

	</c:if>
    
  </body>
</html>