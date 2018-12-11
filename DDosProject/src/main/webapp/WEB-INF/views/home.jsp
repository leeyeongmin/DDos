<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
      <title>Aerial by HTML5 UP</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/libs/css/intro.css" />
      
      
   </head>
   <body class="is-preload">
         <div id="bg"></div>
         <div id="main">

            <!-- Header -->
               <header id="header">
                  <h1>DDos</h1>
                  <a href="loginForm">START</a>
               </header>

            <!-- Footer -->
               <footer id="footer">
                  <span class="copyright">&copy; Designed by : YeDam Final Project Group 2.</span>
               </footer>

         </div>
      <script>
         window.onload = function() { document.body.classList.remove('is-preload'); }
         window.ontouchmove = function() { return false; }
         window.onorientationchange = function() { document.body.scrollTop = 0; }
      </script>
   </body>
</html>