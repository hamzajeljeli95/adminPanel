package MainPackage.Servlets;

import MainPackage.Beans.AppUser;
import MainPackage.DAO.UserDao;
import MainPackage.DAOImpl.UserDaoImpl;
import MainPackage.Util.HashGenerator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

//@WebServlet(name = "Authentication")
@WebServlet("/Servlets/Authentication")
public class Authentication extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDao = new UserDaoImpl();
        String user = request.getParameter("username");
        String pwd = HashGenerator.getStringHash(request.getParameter("password"));
        /*---------
        System.out.println("password Hash is : "+pwd);
        AppUser myuser = new AppUser();
        myuser.setUsername(user);
        myuser.setPasswordHash(pwd);
        myuser.setIsConfirmed(1);
        userDao.save(myuser);
        //---------*/
        List<AppUser> myList= userDao.findAllBy2Properties("username",user,"passwordHash", pwd);
        if(myList!=null && myList.size()==1)
        {
            //request.getRequestDispatcher("/dashboard.jsp").include(request, response);
            HttpSession session=request.getSession(true);
            response.sendRedirect("../dashboard.jsp");
        }
        else
        {
            response.sendRedirect(request.getHeader("referer"));
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
