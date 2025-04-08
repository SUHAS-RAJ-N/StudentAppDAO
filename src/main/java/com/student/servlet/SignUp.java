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
@WebServlet("/signup")
public class SignUp extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Student s=new Student();
		//creation of reference of StudentDAO
		StudentDAO sdao=new StudentDAOImplementation();
		//creation of reference of PrintWriter class
		//PrintWriter out=resp.getWriter();
		//collectiong the data from the UI (getParameter())
		//String name=req.getparameter("name:);
		//s.setName(name);
		s.setName(req.getParameter("name"));
		s.setPhone(Long.parseLong(req.getParameter("phone")));
		s.setMail(req.getParameter("mail"));
		s.setBranch(req.getParameter("branch"));
		s.setLoc(req.getParameter("loc"));
		if(req.getParameter("password").equals(req.getParameter("confirmPassword"))){
			s.setPassword(req.getParameter("password"));

			if(sdao.insertStudent(s)) {
				//out.println("<h1>Data Saved Successfullly</h1>");
				req.setAttribute("success", "Data saved Successfully!!!");
				RequestDispatcher rd=req.getRequestDispatcher("SignUp.jsp");
				rd.forward(req, resp);
			}
		}
		else {
			//out.println("<h1>failed to save the data</h1>");
			req.setAttribute("error", "failed to save the data");
			RequestDispatcher rd=req.getRequestDispatcher("SignUp.jsp");
			rd.forward(req, resp);
		}


	}
}
