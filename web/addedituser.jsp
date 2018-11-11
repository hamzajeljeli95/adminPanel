<%@ page import="MainPackage.Beans.UserInfo" %>
<%@ page import="MainPackage.DAO.UserInfoDAO" %>
<%@ page import="MainPackage.DAOImpl.UserInfoDAOImpl" %>
<%@include file="/includes/pagetop.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="header">
                    <h4 class="title">Utilisateurs</h4>
                    <%
                        String urlParameter = request.getParameter("userId");
                        String text = "";
                        if (urlParameter == null || urlParameter.length() == 0) {
                            text = "Ajouter un utilisateur";
                        } else {
                            text = "Modifier un utilisateur";
                        }
                    %>
                    <p class="category"><%= text %>
                    </p>
                </div>
                <div class="content">
                    <form method="post" action="./Servlets/AddEditUserInfos">
                        <div class="form-group">
                            <label for="username">Nom d'utilisateur</label>
                            <input type="text" required class="form-control" id="username" name="username"
                                   aria-describedby="help"/>
                        </div>
                        <div class="form-group">
                            <label for="passwordField">Mot de passe</label>
                            <input type="password" required class="form-control" id="passwordField" name="password"
                                   aria-describedby="help"/>
                            <label><input type="checkbox" id="showPassword" onclick="showPwd()">Afficher de mot de passe</label>
                            <script>
                                function showPwd() {
                                    var x = document.getElementById("passwordField");
                                    if (x.type === "password") {
                                        x.type = "text";
                                    } else {
                                        x.type = "password";
                                    }
                                }
                            </script>
                        </div>
                        <div class="form-group">
                            <label class="form-check-label">Type du compte</label>
                            <div class="form-check">
                                <label><input class="form-check-input" type="radio" name="accType" value="1"
                                              id="radio11" checked>Utilisateur Standard</label>
                            </div>
                            <div class="form-check">
                                <label><input class="form-check-input" type="radio" name="accType" value="0"
                                              id="radio12">Administrateur</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-check-label">Activer le compte</label>
                            <div class="form-check">
                                <label><input class="form-check-input" type="radio" name="accActiv" value="1"
                                              id="radio21" checked>Oui</label>
                            </div>
                            <div class="form-check">
                                <label><input class="form-check-input" type="radio" name="accActiv" value="0"
                                              id="radio22">Non</label>
                            </div>
                        </div>
                        <p class="category">Informations complémentaires</p>
                        <br/>
                        <%
                            UserInfoDAO userInfo = new UserInfoDAOImpl();
                            for (UserInfo u : userInfo.findAll()) {
                                String inputType="text";
                                if(u.getInfoType().toLowerCase().contains("date"))
                                {
                                    inputType="date";
                                }
                                else if(u.getInfoType().toLowerCase().contains("mail"))
                                {
                                    inputType="email";
                                }
                        %>
                        <div class="form-group">
                            <label for="userAddInfo<%=u.getId()%>"><%=u.getInfoType()%></label>
                            <input type="<%=inputType%>" class="form-control" id="userAddInfo<%=u.getId()%>" name="userAddInfo<%=u.getId()%>"/>
                        </div>
                        <%
                            }
                        %>
                        <button type="submit" class="btn btn-primary">Soumettre</button>
                    </form>
                    <br/>
                    <a href="users.jsp">
                        <button class="btn btn-danger">Annuler</button>
                    </a>
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