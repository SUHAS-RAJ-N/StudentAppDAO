package com.student.servlet;

import java.io.IOException;

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
@WebServlet("/update")
public class UpdateAccount extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	HttpSession session =req.getSession(false);
	Student s1=(Student)session.getAttribute("student");
	
	s1.setName(req.getParameter("name"));
	s1.setPhone( Long.parseLong(req.getParameter("phone")));
	s1.setMail( req.getParameter("mail"));
	s1.setBranch( req.getParameter("branch"));
	s1.setLoc(req.getParameter("location"));
	StudentDAO sdao=new StudentDAOImplementation();
	if(sdao.updateStudent(s1)) {
		req.setAttribute("success", "Your Account Updated Successfullyy!");
		RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
		rd.forward(req, resp);
	}
	else {
		req.setAttribute("error", "Failed to Update the Account");
		RequestDispatcher rd=req.getRequestDispatcher("UpdateAccount.jsp");
		rd.forward(req, resp);
	}
}
}
