package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Exception.ServiceLayerException;
import com.bean.Customer;
import com.service.CustomerService;

/**
 * Servlet implementation class CustomerController
 */
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public CustomerController() {
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
		CustomerService service = new CustomerService();
		HttpSession session=request.getSession();
		if(action.equalsIgnoreCase("customerCreation"))
		{
			response.sendRedirect(request.getContextPath()+"/JSP/CreateCustomer.jsp");
		}
		if(action.equalsIgnoreCase("executive"))
		{
			response.sendRedirect(request.getContextPath()+"/JSP/Executive.jsp");
		}
		 if (action.equalsIgnoreCase("AddCustomer")) {
			long ssnId = Long.parseLong(request.getParameter("ssnId"));
			String custName = request.getParameter("custName");
			int age = Integer.parseInt(request.getParameter("age"));
			String addressLine1 = request.getParameter("addressLine1");
			String addressLine2 = request.getParameter("addressLine2");
			String address = addressLine1 + addressLine2;
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			System.out.println();
			Customer customerobj = new Customer(ssnId, custName, age, address,
					city, state, "Customer created");
			
			
			
				String message;
				try {
					message = service.addCustomer(customerobj);
					RequestDispatcher requestDispatcher = request
							.getRequestDispatcher("/JSP/successaddingcustomer.jsp");
					request.setAttribute("message", message);
					requestDispatcher.forward(request, response);
				} catch (ServiceLayerException e) {
					// TODO Auto-generated catch block
					RequestDispatcher requestDispatcher = request
							.getRequestDispatcher("/JSP/CreateCustomer.jsp");
					request.setAttribute("message", e.getMessage());
					requestDispatcher.forward(request, response);
					
				}
				
			 
		}
		if (action.equalsIgnoreCase("viewCustomer")) {
			try {
				ArrayList<Customer> customerList = service.viewcustomer();
				request.setAttribute("customerList", customerList);
				ArrayList<Long> ssnIdList = service.getSsnId();
				ArrayList<Integer> customerIdList = service.getCustomerId();
				request.setAttribute("ssnIdList", ssnIdList);
				request.setAttribute("customerIdList", customerIdList);
			}  catch (ServiceLayerException | NumberFormatException e)
			{
				RequestDispatcher rd=request.getRequestDispatcher("/JSP/Error.jsp");
				request.setAttribute("message", e.getMessage());
				rd.forward(request, response);
			}
			RequestDispatcher rd = request
					.getRequestDispatcher("/JSP/viewCustomer.jsp");
			rd.forward(request, response);
		}
		if (action.equalsIgnoreCase("searchById")) {
			try {
				ArrayList<Long> ssnIdList = service.getSsnId();
				ArrayList<Integer> customerIdList = service.getCustomerId();

				request.setAttribute("ssnIdList", ssnIdList);
				request.setAttribute("customerIdList", customerIdList);

				int customerId = Integer.parseInt(request
						.getParameter("customerId"));
				long ssnid=Long.parseLong(request.getParameter("ssnId"));

				Customer customerById = service.viewCustomerById(customerId,ssnid);

				request.setAttribute("customerById", customerById);
			} catch (ServiceLayerException e)
			{
				RequestDispatcher rd=request.getRequestDispatcher("/JSP/Error.jsp");
				request.setAttribute("message", e.getMessage());
				rd.forward(request, response);
			}
			RequestDispatcher rd = request
					.getRequestDispatcher("/JSP/viewCustomer.jsp");
			rd.forward(request, response);}

		if (action.equalsIgnoreCase("edit")) {
			int customerid = Integer.parseInt(request.getParameter("cid"));
			long ssnId = Long.parseLong(request.getParameter("ssnId"));
			String custName = request.getParameter("custName");
			int age = Integer.parseInt(request.getParameter("age"));
			String addressLine = request.getParameter("address");

			String message = request.getParameter("message");

			Customer customer = new Customer(ssnId, customerid, custName,
					age, addressLine, message);

			try {
				String message1 = service.updatecustomer(customer);
				request.setAttribute("msg", message1);
				ArrayList<Long> ssnIdList = service.getSsnId();
				ArrayList<Integer> customerIdList = service.getCustomerId();
				ArrayList<Customer> customerList = service.viewcustomer();
				request.setAttribute("customerList", customerList);
				request.setAttribute("ssnIdList", ssnIdList);
				request.setAttribute("customerIdList", customerIdList);

			} catch (ServiceLayerException e)
			{
				RequestDispatcher rd=request.getRequestDispatcher("/JSP/Error.jsp");
				request.setAttribute("message", e.getMessage());
				rd.forward(request, response);
			}
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/JSP/viewCustomer.jsp");
			requestDispatcher.forward(request, response);

		}

		if(action.equalsIgnoreCase("confirm"))
		{

			int custid=(int) session.getAttribute("custid");
			try {
				String message=service.deleteCustomer(custid);
				request.setAttribute("msg", message);
				ArrayList<Long> ssnIdList = service.getSsnId();
				ArrayList<Integer> customerIdList = service.getCustomerId();
				ArrayList<Customer> customerList = service.viewcustomer();
				request.setAttribute("customerList", customerList);
				request.setAttribute("ssnIdList", ssnIdList);
				request.setAttribute("customerIdList", customerIdList);




				RequestDispatcher requestdispatcher=request.getRequestDispatcher("/JSP/viewCustomer.jsp");
				requestdispatcher.forward(request, response);
			}  catch (ServiceLayerException e)
			{
				RequestDispatcher rd=request.getRequestDispatcher("/JSP/Error.jsp");
				request.setAttribute("message", e.getMessage());
				rd.forward(request, response);
			}

		}
		if(action.equalsIgnoreCase("delete"))
		{
			int customerid=Integer.parseInt(request.getParameter("cid"));
			session.setAttribute("custid", customerid);
			try {
				Customer customer=service.getCustomerOnCustomerId(customerid);

				request.setAttribute("customer", customer);
			}  catch (ServiceLayerException e)
			{
				RequestDispatcher rd=request.getRequestDispatcher("/JSP/Error.jsp");
				request.setAttribute("message", e.getMessage());
				rd.forward(request, response);
			}
			RequestDispatcher requestdispatcher=request.getRequestDispatcher("/JSP/DeleteCustomer.jsp");
			requestdispatcher.forward(request, response);
		}
		if(action.equalsIgnoreCase("cancel"))
		{
			ArrayList<Long> ssnIdList;
			try {
				ssnIdList = service.getSsnId();
				ArrayList<Integer> customerIdList = service.getCustomerId();
				ArrayList<Customer> customerList = service.viewcustomer();
				request.setAttribute("customerList", customerList);
				request.setAttribute("ssnIdList", ssnIdList);
				request.setAttribute("customerIdList", customerIdList);




				RequestDispatcher requestdispatcher=request.getRequestDispatcher("/JSP/viewCustomer.jsp");
				requestdispatcher.forward(request, response);
			}  catch (ServiceLayerException e)
			{
				RequestDispatcher rd=request.getRequestDispatcher("/JSP/Error.jsp");
				request.setAttribute("message", e.getMessage());
				rd.forward(request, response);
			}

		}
		if(action.equalsIgnoreCase("updatee"))
		{

			int customerid=Integer.parseInt(request.getParameter("cid"));

			try {
				Customer customer=service.getCustomerOnCustomerId(customerid);

				request.setAttribute("customer", customer);
			}  catch (ServiceLayerException e)
			{
				RequestDispatcher rd=request.getRequestDispatcher("/JSP/Error.jsp");
				request.setAttribute("message", e.getMessage());
				rd.forward(request, response);
			}
			RequestDispatcher requestdispatcher=request.getRequestDispatcher("/JSP/updatecustomer.jsp");
			requestdispatcher.forward(request, response);
		}
	}
}
