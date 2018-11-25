<%@ page import="MainPackage.Beans.Event" %>
<%@ page import="MainPackage.Beans.EventAdditionalInfos" %>
<%@ page import="java.util.List" %>
<%@ page import="MainPackage.DAOImpl.EventDaoImpl" %>
<%@ page import="MainPackage.DAOImpl.EventAdditionalInfosDAOImpl" %>
<%@include file="/includes/pagetop.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="header">
                    <h4 class="title">Evenements</h4>
                    <p class="category">Liste des Evenements</p>
                    <a href="addeditevent.jsp">
                        <button class="btn btn-default pull-right">Ajouter</button>
                    </a>
                </div>
                <br/>
                <div class="content table-responsive table-full-width">
                    <table id="mytable" class="table table-striped table-bordered table-sm" cellspacing="0"
                           width="100%">
                        <thead>
                        <th>Nom</th>
                        <th>Organisateur</th>
                        <th>Date de début</th>
                        <th>Heure de début</th>
                        <th>Emplacement</th>
                        <th>Operations</th>
                        </thead>
                        <tbody>
                        <%
                            for (Event e : new EventDaoImpl().findAll()) {
                                out.println("<tr>");
                                List<EventAdditionalInfos> additionalInfos = new EventAdditionalInfosDAOImpl().findAllBy1Properties("eventId", e.getId());
                                out.println("<td>" + additionalInfos.get(0).getInfoContent() + "</td>");
                                out.println("<td><a href='addedituser.jsp?userId=" + e.getOrganizerId() + "&userAction=view'>" + e.getOrganizerId() + "</a></td>");
                                out.println("<td>" + additionalInfos.get(1).getInfoContent() + "</td>");
                                out.println("<td>" + additionalInfos.get(2).getInfoContent() + "</td>");
                                out.println("<td><a target=\"_blank\" rel=\"noopener noreferrer\" href='https://www.google.com/maps/place/"+additionalInfos.get(3).getInfoContent()+"'>" + additionalInfos.get(3).getInfoContent() + "</a></td>");
                        %>
                        <td class="td-actions text-right">
                            <a href="addeditevent.jsp?eventId=<%=e.getId()%>&userAction=view">
                                <button type="button" rel="tooltip" title="Afficher"
                                        class="btn btn-info btn-simple btn-xs">
                                    <i class="pe-7s-look"></i>
                                </button>
                            </a>
                        </td>
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