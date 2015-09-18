/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Db.FinalFactory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gjk
 */
public class FolderServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String action = request.getParameter("actiontype");
        
        System.out.println("operation:" +action);

       if(action.equals("addfeed")){ 
       
        String url = request.getParameter("url");
        String name = request.getParameter("name");
        String folder_id = request.getParameter("folder");
        
        HttpSession session = request.getSession(true);
        String username = (String)session.getAttribute("name");
        int uid = FinalFactory.getUserDAOInstance().findIdByUserName(username);
        
        FinalFactory.getRssDAOInstance().addFeedIntoFolder(url, name);
        int fid = FinalFactory.getRssDAOInstance().findFidByUrl(url);
        FinalFactory.getRssDAOInstance().addSubscribe(uid, fid, Integer.parseInt(folder_id));
        
    }
       else if(action.equals("addfolder")){
       
           String foldername = request.getParameter("foldername");
           HttpSession session = request.getSession(true);
           String username = (String)session.getAttribute("name");
           int uid = FinalFactory.getUserDAOInstance().findIdByUserName(username);
           
           System.out.println("addfolder"+uid+"|"+foldername);
           
           FinalFactory.getRssDAOInstance().addfolder(uid, foldername);
           
       }
          response.sendRedirect("RSS_reader.jsp");

    }
    
  
}
