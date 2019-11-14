package es.uc3m.eshop.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import es.uc3m.eshop.model.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserProfileRequestHandler implements es.uc3m.eshop.controlservlet.RequestHandler {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		//Grabs the user from the session and redirects to the userProfile page

		System.out.println("HANDLING PROFILE");

		HttpSession session = request.getSession();
		
		ApplicationUser au;
		
		//Check if there is a user in the session and direct to the login page if not
		if (session.getAttribute("user") == null) {

			System.out.println("Session attribute user returned null");
			return "login.html";
		}
		{
			au = (ApplicationUser) session.getAttribute("user");
			return "userProfile.jsp";
		}
		
		
		
		
		

		
	}

}