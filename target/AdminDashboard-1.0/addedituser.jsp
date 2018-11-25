<%@ page import="MainPackage.Beans.UserInfo" %>
<%@ page import="MainPackage.DAO.UserInfoDAO" %>
<%@ page import="MainPackage.DAOImpl.UserInfoDAOImpl" %>
<%@ page import="MainPackage.Beans.AppUser" %>
<%@ page import="MainPackage.Beans.UserAdditionalInfos" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="MainPackage.DAOImpl.UserDaoImpl" %>
<%@ page import="MainPackage.DAOImpl.UserAdditionalInfosDAOImpl" %>
<%@include file="/includes/pagetop.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="header">
                    <h4 class="title">Utilisateurs</h4>
                    <%
                        String urlParameter = request.getParameter("userId");
                        String viewType = request.getParameter("userAction");
                        String text = "";
                        boolean isReadonly = false;
                        boolean isEditMode = false;
                        boolean isIdFound = false;
                        AppUser currAppUser = new AppUser();
                        List<UserAdditionalInfos> additionalInfos = new ArrayList<UserAdditionalInfos>();
                        if (urlParameter == null || urlParameter.length() == 0) {
                            text = "Ajouter un utilisateur";
                        } else if (viewType != null && viewType.equalsIgnoreCase("view")) {
                            text = "Afficher un utilisateur";
                            isReadonly = true;
                            isIdFound = true;
                        } else {
                            text = "Modifier un utilisateur";
                            isIdFound = true;
                            isEditMode = true;
                        }
                        if (isIdFound) {
                            currAppUser = new UserDaoImpl().findAllBy1Properties("username", urlParameter).get(0);
                            additionalInfos = new UserAdditionalInfosDAOImpl().findAllBy1Properties("userId", urlParameter);
                        }
                    %>
                    <p class="category"><%= text %>
                    </p>
                </div>
                <div class="content">
                    <form method="post" action="./Servlets/AddEditUser">
                        <div class="form-group">
                            <label for="username">Nom d'utilisateur</label>
                            <input type="text" required class="form-control" id="username" name="username"
                                   aria-describedby="help" <%
                                if (isIdFound) {
                                    out.println("value='" + currAppUser.getUsername() + "' disabled");
                                }
                            %>/>
                        </div>
                        <div class="form-group" <%
                            if (isEditMode == false) {
                                out.println("disabled");
                            }
                        %>>
                            <label for="passwordField">Mot de passe</label>
                            <input type="password" required class="form-control" id="passwordField" name="password"
                                   aria-describedby="help" <%
                                if (isIdFound) {
                                    out.println("value='" + currAppUser.getPasswordHash() + "' disabled");
                                }
                            %> />
                            <label><input type="checkbox" id="showPassword" onclick="showPwd()"  <%
                                if (isIdFound) {
                                    out.println("disabled");
                                }%>>Afficher de mot de passe</label>
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
                                              id="radio11"
                                    <% if(isIdFound)
                                {
                                    if(currAppUser.getProfile()==1)
                                        {
                                            out.println("checked");
                                        }
                                    if(isEditMode==false)
                            {
                                out.println("disabled");
                            }
                                }%>> Utilisateur Standard</label>
                            </div>
                            <div class="form-check">
                                <label><input class="form-check-input" type="radio" name="accType" value="0"
                                              id="radio12" <% if(isIdFound)
                                {
                                    if(currAppUser.getProfile()==0)
                                        {
                                            out.println("checked");
                                        }
                                    if(isEditMode==false)
                            {
                                out.println("disabled");
                            }
                                } %>>Administrateur</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-check-label">Activer le compte</label>
                            <div class="form-check">
                                <label><input class="form-check-input" type="radio" name="accActiv" value="1"
                                              id="radio21" <% if(isIdFound)
                                {
                                    if(currAppUser.getIsConfirmed()==1)
                                        {
                                            out.println("checked");
                                        }
                                    if(isEditMode==false)
                            {
                                out.println("disabled");
                            }
                                } %>>Oui</label>
                            </div>
                            <div class="form-check">
                                <label><input class="form-check-input" type="radio" name="accActiv" value="0"
                                              id="radio22" <% if(isIdFound)
                                {
                                    if(currAppUser.getIsConfirmed()==0)
                                        {
                                            out.println("checked");
                                        }
                                    if(isEditMode==false)
                            {
                                out.println("disabled");
                            }
                                } %>>Non</label>
                            </div>
                        </div>
                        <p class="category">Informations complémentaires</p>
                        <br/>
                        <%
                            int count = 0;
                            UserInfoDAO userInfo = new UserInfoDAOImpl();
                            for (UserInfo u : userInfo.findAll()) {
                                count++;
                                String inputType = "text";
                                if (u.getInfoType().toLowerCase().contains("date") && (urlParameter == null || urlParameter.length() == 0)) {
                                    inputType = "date";
                                } else if (u.getInfoType().toLowerCase().contains("mail")) {
                                    inputType = "email";
                                }
                        %>
                        <div class="form-group">
                            <label for="userAddInfo<%=u.getId()%>"><%=u.getInfoType()%>
                            </label>
                            <input type="<%=inputType%>" required class="form-control" id="userAddInfo<%=u.getId()%>"
                                   name="userAddInfo<%=u.getId()%>" value="<%
                                   for(UserAdditionalInfos infos : additionalInfos)
                                       {
                                           if(infos.getInfoId()==u.getId())
                                               {
                                                   out.println(infos.getInfoContent());
                                                   break;
                                               }
                                       }
                                   %>" <% if (isReadonly) {
                                out.println("disabled");
                            }%>/>
                        </div>
                        <%
                            }
                        %>
                        <input hidden value="<%=count%>" name="extraDataLength"/>
                        <input hidden value="<%
                            if(isEditMode)
                                {
                                     out.println("edit");
                                }
                               else
                               {
                                    out.println("new");
                               }

                            %>" name="operation"/>

                        <input type="submit" <%
                            if (isReadonly) {
                                out.print(" disabled ");
                            }
                        %> class="btn btn-primary"/>

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