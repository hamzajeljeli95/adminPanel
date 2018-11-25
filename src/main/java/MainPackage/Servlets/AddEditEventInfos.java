package MainPackage.Servlets;

import MainPackage.Beans.EventInfo;
import MainPackage.DAO.EventsInfoDAO;
import MainPackage.DAOImpl.EventsInfoDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Servlets/AddEditEventInfos")
public class AddEditEventInfos extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String value = request.getParameter("categInfo");
        String id = request.getParameter("idEventInfo");
        EventInfo eventInfo = new EventInfo();
        eventInfo.setInfoType(value);
        try{
            if(id!=null&&id.length()>0)
            {
                eventInfo.setId(Integer.parseInt(id));
            }
        }
        catch (Exception e)
        {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
        EventsInfoDAO infoDAO = new EventsInfoDAOImpl();
        infoDAO.saveOrUpdate(eventInfo);
        response.sendRedirect("../extraeventsinfos.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("../index.jsp");
    }
}
