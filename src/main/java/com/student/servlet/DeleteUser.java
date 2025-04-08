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
@WebServlet("/Delete")
public class DeleteUser extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//HttpSession session=req.getSession(false);
	StudentDAO sdao=new StudentDAOImplementation();
	//Student s1=(Student)session.getAttribute("student");
	Student s=new Student();
	s.setId(Integer.parseInt( req.getParameter("id")));
	if(sdao.deleteStudent(s)) {
		req.setAttribute("success", "Account deleted Successfully");
		RequestDispatcher rd=req.getRequestDispatcher("ViewUsers.jsp");
		rd.forward(req, resp);
	}else {
		req.setAttribute("error", "Failed to Delete the Account");
		RequestDispatcher rd=req.getRequestDispatcher("ViewUsers.jsp");
		rd.forward(req, resp);
	}
}
}
