package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Exception.ServiceLayerException;
import com.bean.Account;

import com.service.AccountService;


/**
 * Servlet implementation class AccountController
 */
public class AccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AccountController() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doPost(request, response);
}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		AccountService service=new AccountService();
		HttpSession session=request.getSession();
		if(action.equalsIgnoreCase("AccountCreation"))
		{
			ArrayList<Integer> customerIdList;
		
				customerIdList = service.getCustomerId();
				ArrayList<String> customerNameList=service.getCustomerName();
				request.setAttribute("customerIdList", customerIdList);
				request.setAttribute("customerList", customerNameList);
				RequestDispatcher rd=request.getRequestDispatcher("/JSP/CreateAccount.jsp");
				rd.forward(request, response);
			
				 
		}
		if(action.equalsIgnoreCase("Add Account"))
		{
			int custId=Integer.parseInt(request.getParameter("cid"));
			String accType=request.getParameter("accType");
			double balance=Double.parseDouble(request.getParameter("Balance"));
			Date date=new Date();
			java.sql.Date date1= new java.sql.Date(date.getTime());
			Timestamp lastUpdated1= new Timestamp(date1.getTime());
			Account account=new Account(custId, 0, accType, balance, "InActive", "Account created", lastUpdated1);

			
					String message=service.addAccount(account);
					request.setAttribute("message", message);
				
			
			 RequestDispatcher rd=request.getRequestDispatcher("/JSP/SuccessAccount.jsp");
			 rd.forward(request, response);
			
		}
		
		
		if(action.equalsIgnoreCase("viewAccount"))
		{
		
				ArrayList<Account> accountList=service.viewAccount();
				request.setAttribute("accountList", accountList);
		
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("/JSP/ViewAccount.jsp");
			requestDispatcher.forward(request, response);
		}
		if(action.equalsIgnoreCase("deleteacc"))
		{
			long accId=Long.parseLong(request.getParameter("aid"));
			session.setAttribute("accId",accId );
			try {
				Account account=service.getAccById(accId);
				request.setAttribute("account", account);
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("/JSP/DeleteAccount.jsp");
				requestDispatcher.forward(request, response);
			}  catch (ServiceLayerException e)
			{
				RequestDispatcher rd=request.getRequestDispatcher("/JSP/Error.jsp");
				request.setAttribute("message", e.getMessage());
				rd.forward(request, response);
			}
		}
		if(action.equalsIgnoreCase("Delete"))
		{
			long accountId=(Long) session.getAttribute("accId");
		
				String message=service.deleteAccount(accountId);
				request.setAttribute("message", message);
				ArrayList<Account> accountList=service.viewAccount();
				request.setAttribute("accountList", accountList);
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("/JSP/ViewAccount.jsp");
				requestDispatcher.forward(request, response);
			
		}
		if(action.equalsIgnoreCase("Cancel"))
		{
			
				ArrayList<Account> accountList=service.viewAccount();
				request.setAttribute("accountList", accountList);
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("/JSP/ViewAccount.jsp");
			requestDispatcher.forward(request, response);
		}
	}

}
