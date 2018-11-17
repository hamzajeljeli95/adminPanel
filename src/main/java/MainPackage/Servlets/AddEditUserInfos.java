package MainPackage.Servlets;

import MainPackage.Beans.UserInfo;
import MainPackage.DAO.UserInfoDAO;
import MainPackage.DAOImpl.UserInfoDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Servlets/AddEditUserInfos")
public class AddEditUserInfos extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String value = request.getParameter("categInfo");
        String id = request.getParameter("idUserInfo");
        UserInfo userInfo = new UserInfo();
        userInfo.setInfoType(value);
        try{
            if(id!=null&&id.length()>0)
            {
                userInfo.setId(Integer.parseInt(id));
            }
        }
        catch (Exception e)
        {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
        UserInfoDAO infoDAO = new UserInfoDAOImpl();
        infoDAO.saveOrUpdate(userInfo);
        response.sendRedirect("../extrauserinfos.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("../index.jsp");
    }
}
