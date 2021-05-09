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
   .c-sidebar__link ,.c-sidebar__item.has-submenu>.c-sidebar__link{font-size:20px;}
    </style>
  </head>
  <body>

    <div class="o-page">
      <div class="o-page__sidebar js-page-sidebar">
        <aside class="c-sidebar" style="background-color: #222;">
          <div class="c-sidebar__brand">
            <a style="font-size:20px;color:#FFF;font-weight:bold;" href="<%=basePath %>backendui/index">
            停车管理收费系统
            </a>
          </div>

          <!-- Scrollable -->
          <div class="c-sidebar__body">
            <span class="c-sidebar__title">操作菜单</span>
            <ul class="c-sidebar__list">
              <li>
                <a class="c-sidebar__link " style href="<%=basePath %>">
                  <i class="c-sidebar__icon feather icon-file"></i>停车首页
                </a>
              </li>             
            </ul>

             <span class="c-sidebar__title">navigation</span>
  <ul class="c-sidebar__list">
  
    <c:if test="${user.type eq 5 }">    
              <li class="c-sidebar__item has-submenu">
                <a class="c-sidebar__link" data-toggle="collapse" href="#sidebar-submenu" aria-expanded="false" aria-controls="sidebar-submenu">
                    <i class="c-sidebar__icon feather icon-hash"></i>用户管理
                </a>

                <div>
                  <ul class="c-sidebar__list collapse" id="sidebar-submenu">
                    <li><a class="c-sidebar__link" target="mainFrame" href="<%=basePath %>users/users/list">用户管理</a></li>
                    <li><a class="c-sidebar__link" target="mainFrame" href="<%=basePath %>users/users/add">创建用户</a></li>
                  </ul>
                </div>                 
              </li>
              
              
              <li class="c-sidebar__item has-submenu">
                <a class="c-sidebar__link" data-toggle="collapse" href="#sidebar-submenu1" aria-expanded="false" aria-controls="sidebar-submenu1">
                    <i class="c-sidebar__icon feather icon-hash"></i>区域管理
                </a>

                <div>
                  <ul class="c-sidebar__list collapse" id="sidebar-submenu1">
                    <li><a class="c-sidebar__link" target="mainFrame" href="<%=basePath %>infocate/infocate/list">区域管理</a></li>
                    <li><a class="c-sidebar__link" target="mainFrame" href="<%=basePath %>infocate/infocate/add">新增区域</a></li>
                  </ul>
                </div>                 
              </li>
              
              
              <li class="c-sidebar__item has-submenu">
                <a class="c-sidebar__link" data-toggle="collapse" href="#sidebar-submenu11" aria-expanded="false" aria-controls="sidebar-submenu11">
                    <i class="c-sidebar__icon feather icon-hash"></i>车位管理
                </a>

                <div>
                  <ul class="c-sidebar__list collapse" id="sidebar-submenu11">
                    <li><a class="c-sidebar__link" target="mainFrame" href="<%=basePath %>news/news/list">车位管理</a></li>
                    <li><a class="c-sidebar__link" target="mainFrame" href="<%=basePath %>news/news/add">新增车位</a></li>
                  </ul>
                </div>                 
              </li>
              
           
              
               <li>
                <a class="c-sidebar__link" target="mainFrame" href="<%=basePath %>park/park/list">
                  <i class="c-sidebar__icon feather icon-file-text"></i>停车信息管理
                </a>
              </li>
               <li>
                <a class="c-sidebar__link" target="mainFrame" href="<%=basePath %>autocar/autocar/list">
                  <i class="c-sidebar__icon feather icon-file-text"></i>车位长租管理
                </a>
              </li>
              
              
              </c:if>
                <c:if test="${user.type eq 1 }">
                
                 <li>
                <a class="c-sidebar__link" target="mainFrame" href="<%=basePath %>park/park/mylist">
                  <i class="c-sidebar__icon feather icon-file-text"></i>停车记录
                </a>
              </li>
                
                  <li class="c-sidebar__item has-submenu">
                <a class="c-sidebar__link" data-toggle="collapse" href="#sidebar-submenu11" aria-expanded="false" aria-controls="sidebar-submenu11">
                    <i class="c-sidebar__icon feather icon-hash"></i>车位长租管理
                </a>

                <div>
                  <ul class="c-sidebar__list collapse" id="sidebar-submenu11">
                    <li><a class="c-sidebar__link" target="mainFrame" href="<%=basePath %>autocar/autocar/mylist">我的长租</a></li>
                    <li><a class="c-sidebar__link" target="mainFrame" href="<%=basePath %>autocar/autocar/add">在线长租</a></li>
                  </ul>
                </div>                 
              </li>
                </c:if>
                
                
                
                 <li>
                <a class="c-sidebar__link" target="mainFrame" href="<%=basePath %>message/message/list">
                  <i class="c-sidebar__icon feather icon-file-text"></i>平台公告
                </a>
              </li>
              
            </ul>

            
          </div>
          

       
        </aside>
      </div>

      <main class="o-page__content">
        <header  style="" class="c-navbar u-mb-medium">
          <button class="c-sidebar-toggle js-sidebar-toggle">
            <i class="feather icon-align-left"></i>
          </button>

          <h2 class="c-navbar__title" style="color:#ddd"> hi,${username } </h2>

          

        

          <div class="c-dropdown dropdown">
            <div style="color:#333" class="c-avatar c-avatar--xsmall dropdown-toggle" id="dropdownMenuAvatar" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
               欢迎您，${user.username } ！
            </div>

            <div class="c-dropdown__menu has-arrow dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuAvatar">
              <a class="c-dropdown__item dropdown-item"  target="mainFrame" href="<%=basePath%>users/users/profile">
              资料更新</a>
              <a class="c-dropdown__item dropdown-item" target="mainFrame" href="<%=basePath%>users/users/password">密码设置</a>
              <a class="c-dropdown__item dropdown-item" href="<%=basePath%>backendui/logout?retUrl=login">注销登录</a>
            </div>
          </div>
        </header>

        <div class="container" style="width:100%;max-width:100%">
          <div class="row">
          
          <iframe name="mainFrame"  id="iframe" style="min-height:1200px;overflow:hidden;" width="100%" height="100%" frameborder="0"></iframe>
          </div>
      </main>
    </div>

    <!-- Main JavaScript -->
    <script src="<%=basePath %>static/v1/js/neat.min.js?v=1.0"></script>
  </body>
</html>