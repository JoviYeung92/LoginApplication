package com.login.controller;
import java.io.IOException;
import java.lang.String;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import com.login.bean.LoginBean;
import com.login.dao.LoginDao;
 
public class LoginServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

private String userName;
private String password;
private LoginBean loginBean;
private LoginDao loginDao;
private String userValidate;
private String fullName;

public LoginServlet() {
}
 
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
    userName = request.getParameter("username");
    password = request.getParameter("password");
   
    
    System.out.println("Inside servlet");    
    loginBean = new LoginBean();
 
    loginBean.setUserName(userName);
    loginBean.setPassword(password);
    
 
    loginDao = new LoginDao();
 
    try
    {
        userValidate = loginDao.authenticateUser(loginBean);
        fullName = loginDao.fullNameDB;
 
        if(userValidate.equals("Manager_Role"))
        {
            System.out.println("Manager's Home");
 
            HttpSession session = request.getSession(); //Creating a session
            session.setAttribute("Manager", userName); //setting session attribute
            request.setAttribute("userName", userName);
            request.setAttribute("fullName", fullName);
            
            request.getRequestDispatcher("/JSP/Manager.jsp").forward(request, response); 
            
        }
        else if(userValidate.equals("User_Role"))
        {
            System.out.println("User's Home");
 
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(10*60);
            session.setAttribute("User", userName);
            request.setAttribute("userName", userName);
            request.setAttribute("fullName", fullName);
            
            request.getRequestDispatcher("/JSP/User.jsp").forward(request, response);
        }
        else
        {
            System.out.println("Error message = "+userValidate);
            request.setAttribute("errMessage", userValidate);
 
            request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
        }
    }
    catch (IOException e1)
    {
        e1.printStackTrace();
    }
    catch (Exception e2)
    {
        e2.printStackTrace();
    }
} //End of doPost()

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
    
    try
    {    
        if(userValidate.equals("Manager_Role"))
        {
            System.out.println("Manager's Home");
 
            HttpSession session = request.getSession(); //Creating a session
            session.setAttribute("Manager", userName); //setting session attribute
            request.setAttribute("userName", userName);
            request.setAttribute("fullName", fullName);
            
            request.getRequestDispatcher("/JSP/Manager.jsp").forward(request, response); 
            
        	// Get the request dispatcher for the page that you want to forward to
        	RequestDispatcher dispatcher = request.getRequestDispatcher("JSP/Manager.jsp");

        	// Forward the request to the destination page
        	dispatcher.forward(request, response);
            
        }
        else if(userValidate.equals("User_Role"))
        {
            System.out.println("User's Home");
 
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(10*60);
            session.setAttribute("User", userName);
            request.setAttribute("userName", userName);
            request.setAttribute("fullName", fullName);
            
            request.getRequestDispatcher("/JSP/User.jsp").forward(request, response);
            
        	// Get the request dispatcher for the page that you want to forward to
        	RequestDispatcher dispatcher = request.getRequestDispatcher("JSP/User.jsp");

        	// Forward the request to the destination page
        	dispatcher.forward(request, response);
        }
        else
        {
            System.out.println("Error message = "+userValidate);
            request.setAttribute("errMessage", userValidate);
 
            request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
        }
    }
    catch (IOException e1)
    {
        e1.printStackTrace();
    }
    catch (Exception e2)
    {
        e2.printStackTrace();
    }
} //End of doGet()
}