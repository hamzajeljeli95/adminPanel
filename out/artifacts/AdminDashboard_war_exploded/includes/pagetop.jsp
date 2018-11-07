<%--
  Created by IntelliJ IDEA.
  User: Hamza
  Date: 07/11/2018
  Time: 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>

<html lang="fr">
<head>
    <script>
        function loginError() {
            alert("Vous n'êtes pas connecté, Vous allez être redirigé vers la page de connexion.");
        }
    </script>
    <%
        if (request.getSession(false).getAttribute("isConnected") == null || request.getSession(false).getAttribute("isConnected").equals("false")) {
    %>
    <script>
        loginError();
        window.location = "index.jsp";
    </script>
    <%
        }
    %>
    <%@include file="headers.jsp" %>
</head>
<body>

<div class="wrapper">
    <div class="sidebar" data-color="purple" data-image="assets/img/sidebar-5.jpg">
        <div class="sidebar-wrapper">
            <div class="logo">
                <a class="simple-text">
                    Bonjour !
                </a>
            </div>
            <%@include file="navi.jsp" %>
        </div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="./Servlets/Logout">
                            <p>Se déconnecter</p>
                        </a>
                    </li>
                    <li class="separator hidden-lg"></li>
                </ul>
            </div>
        </nav>
        <div class="content">