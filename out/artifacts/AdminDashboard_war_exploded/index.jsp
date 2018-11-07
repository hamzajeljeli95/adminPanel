<!doctype html>
<html lang="fr">
<%
if(request.getSession(false).getAttribute("isConnected")!=null&&request.getSession(false).getAttribute("isConnected").equals("true"))
{
    response.sendRedirect("dashboard.jsp");
}
%>
<head>
    <%@include file="includes/headers.jsp" %>
</head>
<body>
<div class="wrapper">
    <div class="main-panel">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <div class="card card-user">
                                    <div class="image">
                                        <img src="assets/img/full-screen-image-3.jpg" alt="..."/>
                                    </div>
                                    <div class="content">
                                        <div class="author">
                                            <a href="#">
                                                <img class="avatar border-gray" src="assets/img/faces/tim_vector.jpe"
                                                     alt="..."/>
                                                <div class="content">

                                                    <form method="post" action="./Servlets/Authentication">
                                                        <div class="row">

                                                            <div class="form-group">
                                                                <label>Nom d'utilisateur</label>
                                                                <input type="text" name="username" class="form-control"
                                                                       placeholder="login">
                                                            </div>

                                                        </div>
                                                        <div class="row">

                                                            <div class="form-group">
                                                                <label>Mot de passe</label>
                                                                <input type="password" class="form-control"
                                                                       placeholder="password" name="password">
                                                            </div>
                                                        </div>
                                                        <button type="submit" class="btn btn-info btn-fill center-pill">
                                                            Se conencter
                                                        </button>
                                                        <div class="clearfix"></div>
                                                    </form>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
