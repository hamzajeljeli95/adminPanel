<%@ page import="MainPackage.Beans.UserInfo" %>
<%@ page import="MainPackage.DAO.UserInfoDAO" %>
<%@ page import="MainPackage.DAOImpl.UserInfoDAOImpl" %>
<%@ page import="java.util.List" %>
<%@include file="/includes/pagetop.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="header">
                    <h4 class="title">Catégories des informations des événements additionelles</h4>
                    <p class="category">Liste des informations possibles</p>
                    <a href="addedituserinfo.jsp">
                        <button class="btn btn-default pull-right">Ajouter</button>
                    </a>
                </div>

                <div class="content table-responsive table-full-width">
                    <table id="mytable" class="table table-striped table-bordered table-sm" cellspacing="0"
                           width="100%">
                        <thead>
                        <th>ID</th>
                        <th>Libellé</th>
                        </thead>
                        <tbody>
                        <%
                            UserInfoDAO userInfoDAO = new UserInfoDAOImpl();
                            List<UserInfo> userInfos = userInfoDAO.findAll();
                            for (UserInfo u : userInfos) {
                        %>
                        <tr>
                            <td><%= u.getId() %>
                            </td>
                            <td><%= u.getInfoType() %>
                            </td>
                            <td>
                                <a href="addedituserinfo.jsp?infoId=<%= u.getId() %>">
                                    <button class="btn btn-info btn-fill center-pill">Modifier</button>
                                </a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                    <center></center>
                </div>
            </div>
        </div>
        <footer class="footer">

            <p class="copyright pull-right">
                &copy;
                <script>document.write(new Date().getFullYear())</script>
                <a href="#">CampRandoApp</a>
            </p>
        </footer>
    </div>
</div>
<%@include file="/includes/pagebuttom.jsp" %>