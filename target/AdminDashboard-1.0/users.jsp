<%@ page import="MainPackage.Beans.AppUser" %>
<%@ page import="MainPackage.DAOImpl.UserDaoImpl" %>
<%@ page import="MainPackage.DAOImpl.UserAdditionalInfosDAOImpl" %>
<%@ page import="MainPackage.Beans.UserAdditionalInfos" %>
<%@ page import="java.util.List" %>
<%@include file="/includes/pagetop.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="header">
                    <h4 class="title">Utilisateurs</h4>
                    <p class="category">Liste des utilisateurs</p>
                    <a href="addedituser.jsp">
                        <button class="btn btn-default pull-right">Ajouter</button>
                    </a>
                </div>
                <br/>
                <div class="content table-responsive table-full-width">
                    <table id="mytable" class="table table-striped table-bordered table-sm" cellspacing="0"
                           width="100%">
                        <thead>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Email</th>
                        <th>TYPE DU COMPTE</th>
                        <th>Est activé</th>
                        <th>Operations</th>
                        </thead>
                        <tbody>
                        <%
                            for (AppUser u : new UserDaoImpl().findAll()) {
                                out.println("<tr>");
                                out.println("<td>" + u.getUsername() + "</td>");
                                List<UserAdditionalInfos> additionalInfos = new UserAdditionalInfosDAOImpl().findAllBy1Properties("userId",u.getUsername());
                                out.println("<td>" + additionalInfos.get(0).getInfoContent() + "</td>");
                                out.println("<td>" + additionalInfos.get(1).getInfoContent() + "</td>");
                                out.println("<td>" + additionalInfos.get(2).getInfoContent() + "</td>");
                                if (u.getProfile() == 0) {
                                    out.println("<td>Administrateur</td>");
                                } else {
                                    out.println("<td>Utilisateur Standard</td>");
                                }
                                if (u.getIsConfirmed() == 1) {
                                    out.println("<td>Oui</td>");
                                } else {
                                    out.println("<td>Non</td>");
                                }
                        %>
                        <td class="td-actions text-right">
                            <a href="addedituser.jsp?userId=<%=u.getUsername()%>&userAction=view"><button type="button" rel="tooltip" title="Afficher"
                                    class="btn btn-info btn-simple btn-xs">
                                <i class="pe-7s-look"></i>
                            </button>
                        </td></a>
                        <%
                                out.println("</tr>");
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