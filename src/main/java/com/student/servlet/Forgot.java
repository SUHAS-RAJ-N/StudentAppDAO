package com.student.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.student.dao.StudentDAO;
import com.student.dao.StudentDAOImplementation;
import com.student.dto.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/forgot")
public class Forgot  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//creation of StudentDAO ref object
		
		StudentDAO sdao=new StudentDAOImplementation();
		HttpSession session =req.getSession(false);
		//Printwriter ref object
		//PrintWriter out=resp.getWriter();
		
		
		Student s=sdao.getStudent(Long.parseLong(req.getParameter("phone")),req.getParameter("mail"));
		if(s!=null) {
			if(req.getParameter("password").equals(req.getParameter("confirmPassword"))) {
				s.setPassword(req.getParameter("password"));
				if(sdao.updateStudent(s)) {
					//out.println("<h1 style=\"color:green;\">Password Updated Successfully</h1>");
					req.setAttribute("success1", "password updated Sucessfully");
					RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
					rd.forward(req, resp);
				}else {
					//out.println("<h1>Failed to update!!</h1>");
					req.setAttribute("error1", "Failed to update!!");
					RequestDispatcher rd=req.getRequestDispatcher("Forgot.jsp");
					rd.forward(req, resp);
				}
			}
			else {
				//out.println("<h1>Password Mismatched</h1>");
				req.setAttribute("mismatch1", "Password Mismatched");
				RequestDispatcher rd=req.getRequestDispatcher("Forgot.jsp");
				rd.forward(req, resp);
			}
		}
		else {
			//out.println("</h1>Student not found!!</h1>");
			req.setAttribute("not found", "Student not found");
			RequestDispatcher rd=req.getRequestDispatcher("Forgot.jsp");
			rd.forward(req, resp);
		}
	}

}
