package com.student.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

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
@WebServlet("/login")
public class Login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Student s=new Student();
		//StudentDAo ref object
		StudentDAO sdao=new StudentDAOImplementation();
		HttpSession session=req.getSession(true);
		//PrintWriter out=resp.getWriter();
		Student s=sdao.getStudent(req.getParameter("mail"),req.getParameter("password"));
		if(s!=null){ 
			//out.println("<h1 style=\"color:green;\">Login Successful,welcome "+ s.getName()+"</h1>");
			session.setAttribute("student", s);
			req.setAttribute("success", "Login successful");
			RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
			rd.forward(req, resp);
		}
		else{
			//out.println("<h1 style=\"color:red;\">Invalid Credentials");
			req.setAttribute("error", "Invalid Credentials");
			RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
			rd.forward(req, resp);
		}


		//	s.setMail(req.getParameter("mail"));
		//	s.setPassword(req.getParameter("password"));
		//	if(sdao.getStudent(s.getMail(), s.getPassword()) != null) {
		//		out.println("<h1>Login Successfullly</h1>");
		//		
		//	}
		//	else {
		//		out.println("<h1>failed to login</h1>");
		//	}
	}
}