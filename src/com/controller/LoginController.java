package com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Exception.ServiceLayerException;
import com.service.LoginService;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = request.getParameter("action");
		 HttpSession session=request.getSession(false);
		 if(session==null || session.getAttribute("loginAccount")==null)
		 {
		
		     if (action.equalsIgnoreCase("loginAccount")) {
			
           
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			LoginService service = new LoginService();
			RequestDispatcher requestDispatcher;
		
			try {
				
				String type = service.getRole(username, password);
				session=request.getSession(true);
				session.setAttribute("username", username);
				if (type != null) {
					
					if (type.equalsIgnoreCase("Executive")){
						
						
						response.sendRedirect(request.getContextPath()+"/JSP/Executive.jsp");
					}
					else{
						
						response.sendRedirect(request.getContextPath()+"/JSP/Cashier.jsp");
					}
				} else {
					request.setAttribute("msg", "Invalid login");
					requestDispatcher = request
						
							.getRequestDispatcher("/JSP/Login.jsp");
					requestDispatcher.forward(request, response);
				}
			}  catch (ServiceLayerException e)
			{
				RequestDispatcher rd=request.getRequestDispatcher("/JSP/Error.jsp");
				request.setAttribute("message", e.getMessage());
				rd.forward(request, response);
			}
		     }

			if (action.equalsIgnoreCase("Logout")) {
				session=request.getSession(false);
				session.setAttribute("username", "");
				response.sendRedirect(request.getContextPath() + "/JSP/Login.jsp");
			}
		}
		 }
	}

