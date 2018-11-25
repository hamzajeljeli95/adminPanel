<%@ page import="MainPackage.DAO.EventsInfoDAO" %>
<%@ page import="MainPackage.DAOImpl.EventsInfoDAOImpl" %>
<%@include file="/includes/pagetop.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="header">
                    <h4 class="title">Catégories des informations des événements additionelles</h4>
                    <%
                        String urlParameter = request.getParameter("infoId");
                        String text = "";
                        if (urlParameter == null || urlParameter.length() == 0) {
                            text = "Ajouter une Catégorie";
                        } else {
                            text = "Modifier une Catégorie";
                        }
                    %>
                    <p class="category"><%= text %></p>
                </div>
                <div class="content">
                    <form method="post" action="./Servlets/AddEditEventInfos">
                            <div class="form-group">
                                <label for="categInfo">Catégorie</label>
                                <%
                                    String val = "";
                                    if (urlParameter != null && urlParameter.length() > 0) {
                                        EventsInfoDAO eventsInfoDAO = new EventsInfoDAOImpl();
                                        val = eventsInfoDAO.findAllBy1Properties("id", Integer.parseInt(request.getParameter("infoId"))).get(0).getInfoType();
                                    }
                                %>
                                <input type="text" required class="form-control" id="categInfo" name="categInfo" aria-describedby="help"
                                       value="<%= val %>">
                                <small id="help" class="form-text text-muted">Assurez vous de saisir la catégorie
                                    correctement.
                                </small>
                            </div>
                            <input hidden name="idEventInfo" value="<%=request.getParameter("infoId")%>">
                            <button type="submit" class="btn btn-primary">Soumettre</button>
                    </form>
                    <br/>
                    <a href="extraeventsinfos.jsp"><button class="btn btn-danger">Annuler</button></a>
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