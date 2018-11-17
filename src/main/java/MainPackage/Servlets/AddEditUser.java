package MainPackage.Servlets;

import MainPackage.Beans.AppUser;
import MainPackage.Beans.UserAdditionalInfos;
import MainPackage.Beans.UserInfo;
import MainPackage.DAO.UserAdditionalInfosDAO;
import MainPackage.DAOImpl.UserAdditionalInfosDAOImpl;
import MainPackage.DAOImpl.UserInfoDAOImpl;
import MainPackage.Util.HashGenerator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/Servlets/AddEditUser")
public class AddEditUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //UserDao userDao = new UserDaoImpl();
        final PrintWriter writer = response.getWriter();
        String username = request.getParameter("username");
        writer.println(username);
        String password = request.getParameter("password");
        writer.println(password);
        String accType = request.getParameter("accType");
        writer.println(accType);
        String accActiv = request.getParameter("accActiv");
        writer.println(accActiv);
        AppUser user = new AppUser();
        user.setProfile(Integer.parseInt(accType));
        user.setIsConfirmed(Integer.parseInt(accActiv));
        user.setUsername(username);
        user.setPasswordHash(HashGenerator.getStringHash(password));
        List<UserAdditionalInfos> additionalInfos = new ArrayList<UserAdditionalInfos>();
        int addInfosCount = Integer.parseInt(request.getParameter("extraDataLength"));
        List<UserInfo> userInfos = new UserInfoDAOImpl().findAll();
        int i =1;
        for(UserInfo u : userInfos)
        {
            UserAdditionalInfos tmp = new UserAdditionalInfos();
            //tmp.setAppUserByUserId(user);
            tmp.setInfoContent(request.getParameter("userAddInfo"+i));
            tmp.setInfoId(u.getId());
            tmp.setUserId(username);
            //tmp.setUserInfoByInfoId(u);
            additionalInfos.add(tmp);
            i++;
        }
        UserAdditionalInfosDAO dao = new UserAdditionalInfosDAOImpl();
        for(UserAdditionalInfos info : additionalInfos){
            dao.saveOrUpdate(info);
        }

        response.sendRedirect("../users.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("../index.jsp");
    }
}
