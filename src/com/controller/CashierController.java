package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Exception.DataLayerException;
import com.Exception.ServiceLayerException;
import com.bean.Account;
import com.bean.Transaction;
import com.dao.TransactionDAO;
import com.service.AccountService;
import com.service.CashierService;

public class CashierController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CashierController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		TransactionDAO tdao=new TransactionDAO();
		CashierService cashierService = new CashierService();
		AccountService accountservice = new AccountService();
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("cashierhome")) {
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/JSP/Cashier.jsp");
			requestDispatcher.forward(request, response);
		}




		if (action.equalsIgnoreCase("cashiersearch")) {
			if (request.getParameter("select").equalsIgnoreCase("CustomerID")) {
				// We can replace this by session

				ArrayList<Long> accountIdList = accountservice.getAccountIdByCustomerId(Integer.parseInt(request
						.getParameter("id")));


				if (accountIdList.size()>0) {
					//System.out.println("!=null");
					session.setAttribute("customerId",
							request.getParameter("id"));
					request.setAttribute("accountIdList", accountIdList);
					RequestDispatcher requestDispatcher = request
							.getRequestDispatcher("/JSP/ViewAccountByCustomerId.jsp");
					requestDispatcher.forward(request, response);
				} else {
					//System.out.println("==null");
					request.setAttribute("msg", "Enter valid customer Id");
					RequestDispatcher requestDispatcher = request
							.getRequestDispatcher("/JSP/Cashier.jsp");
					requestDispatcher.forward(request, response);
				}



			} 
			else {

				int acctId=Integer
						.parseInt(request.getParameter("id"));
				session.setAttribute("acctId", acctId);
				Account accounts = accountservice.getCashierAccount(acctId);
				ArrayList<Account> accountslist = accountservice
						.getAllAccount();
				System.out.println(accountslist);

				if(accounts.getAccountType()==null){
					request.setAttribute("msg", "Enter valid Account Id");
					RequestDispatcher requestDispatcher = request
							.getRequestDispatcher("/JSP/Cashier.jsp");
					requestDispatcher.forward(request, response);


				}
				else {
					RequestDispatcher requestDispatcher = request
							.getRequestDispatcher("/JSP/CashierAccount.jsp");
					request.setAttribute("accounts", accounts);
					request.setAttribute("accountslist", accountslist);
					requestDispatcher.forward(request, response);}


			}
		}









		if (action.equalsIgnoreCase("depositAmount")) {
			long AccountId = Long.parseLong(request.getParameter("AccountId"));
			Calendar today = Calendar.getInstance();
			today.clear(Calendar.HOUR); today.clear(Calendar.MINUTE); today.clear(Calendar.SECOND);
			Date todayDate = today.getTime();
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			String nowdate=sdf.format(todayDate);
			java.util.Date nowdate1 = null;
			double Balance = Double.parseDouble(request
					.getParameter("depositAmount"));
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/JSP/TransactionSuccessful.jsp");
			try {
				nowdate1 = sdf.parse(nowdate);
				java.sql.Date nowdate2 = new java.sql.Date(nowdate1.getTime());
				Transaction transaction=new Transaction(nowdate2, "Deposit amount", Balance, "Deposit",AccountId );
				tdao.addTransaction(transaction);
			} catch (ParseException  |DataLayerException e)
			{

			}


			boolean success = cashierService.DepositAmount(AccountId,
					Balance);
			if (success) {
				request.setAttribute("msg",
						"Amount deposited successfully. New balance is "
								+ accountservice.getBalance(AccountId));
				requestDispatcher.forward(request, response);
			} 


		}
		if (action.equalsIgnoreCase("withdrawAmount")) {
			long AccountId = Long.parseLong(request.getParameter("AccountId"));
			double Balance = Double.parseDouble(request
					.getParameter("withdrawAmount"));
			Calendar today = Calendar.getInstance();
			today.clear(Calendar.HOUR); today.clear(Calendar.MINUTE); today.clear(Calendar.SECOND);
			Date todayDate = today.getTime();
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			String nowdate=sdf.format(todayDate);
			java.util.Date nowdate1 = null;

			try {
				nowdate1 = sdf.parse(nowdate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			java.sql.Date nowdate2 = new java.sql.Date(nowdate1.getTime());
			Transaction transaction=new Transaction(nowdate2, "Withdrawing amount", Balance, "Withdraw",AccountId );
			try {
				tdao.addTransaction(transaction);
			} catch (DataLayerException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/JSP/TransactionSuccessful.jsp");

			boolean success = cashierService.WithDrawAmount(AccountId,
					Balance);
			if (success) {
				request.setAttribute("msg",
						"Amount withdrawed successfully. New balance is "
								+ accountservice.getBalance(AccountId));
				requestDispatcher.forward(request, response);
			} 

		}
		if (action.equalsIgnoreCase("TransferAmount")) {

			long fromAccountId = Long.parseLong(request
					.getParameter("fromaccountId"));
			Calendar today = Calendar.getInstance();
			today.clear(Calendar.HOUR); today.clear(Calendar.MINUTE); today.clear(Calendar.SECOND);
			Date todayDate = today.getTime();
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			String nowdate=sdf.format(todayDate);
			java.util.Date nowdate1 = null;
			long toAccountId = Long.parseLong(request
					.getParameter("toaccountid"));
			double amount = Double.parseDouble(request.getParameter("amount"));
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/JSP/TransactionSuccessful.jsp");
			try {
				nowdate1 = sdf.parse(nowdate);
				java.sql.Date nowdate2 = new java.sql.Date(nowdate1.getTime());
				Transaction transaction=new Transaction(nowdate2, "Transfer amount", amount, "Transfer",fromAccountId );
				tdao.addTransaction(transaction);
			}  catch ( DataLayerException| ParseException e)
			{


			}

			boolean success = cashierService.TransferAmount(fromAccountId,
					toAccountId, amount);
			if (success) {
				request.setAttribute("msg",
						"Amount transfered successfully. New balance is "
								+ accountservice.getBalance(fromAccountId));
			} 

			requestDispatcher.forward(request, response);
		}
		if(action.equalsIgnoreCase("transaction"))
		{
			response.sendRedirect(request.getContextPath()+"/JSP/TransactionDate.jsp");
		}
		if(action.equalsIgnoreCase("viewtransaction"))
		{
			String sdate=request.getParameter("startdate");
			String edate=request.getParameter("enddate");
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			java.util.Date startDate1;
			
			try {
				startDate1 = sdf.parse(sdate);
				java.sql.Date startDate = new java.sql.Date(startDate1.getTime());
				java.util.Date endDate1 = sdf.parse(edate);
				java.sql.Date endDate = new java.sql.Date(endDate1.getTime());
				try {
					int id=(int) session.getAttribute("acctId");
					ArrayList<Transaction> transactionList=tdao.viewtransaction(startDate, endDate,id);
					request.setAttribute("transactionList", transactionList);
					RequestDispatcher requestDispatcher=request.getRequestDispatcher("/JSP/ViewTransaction.jsp");
					requestDispatcher.forward(request, response);
				}  catch ( DataLayerException e)
				{
					RequestDispatcher rd=request.getRequestDispatcher("/JSP/Error.jsp");
					request.setAttribute("message", e.getMessage());
					rd.forward(request, response);
				}


			}  catch (ParseException e)
			{
				RequestDispatcher rd=request.getRequestDispatcher("/JSP/Error.jsp");
				request.setAttribute("message", e.getMessage());
				rd.forward(request, response);
			}


		}
		if(action.equalsIgnoreCase("searchAccount")){

			int customerId=Integer.parseInt(session.getAttribute("customerId").toString());
			int accountID=Integer.parseInt(request.getParameter("id"));
			session.setAttribute("acctId", accountID);
			
			ArrayList<Long>  accountIdList = accountservice.getAccountIdByCustomerId(customerId);
			request.setAttribute("accountIdList", accountIdList);
			Account accounts = accountservice.getCashierAccount(Integer
					.parseInt(request.getParameter("id")));
			ArrayList<Account> accountslist = accountservice
					.getAllAccount();
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/JSP/ViewAccountByCustomerId.jsp");
			request.setAttribute("accounts", accounts);
			request.setAttribute("accountslist", accountslist);
			requestDispatcher.forward(request, response);


		}  
	}

}


