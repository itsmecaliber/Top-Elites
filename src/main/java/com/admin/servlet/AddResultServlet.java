package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import com.DAO.ResultDAOImpl;
import com.DAO.TournamentDAOImpl;
import com.DB.DBConnect;
import com.entity.ResultDetails;
import com.entity.TournamentDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/add_result")
@MultipartConfig
public class AddResultServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Get parameters from the request
			String tournamentName = req.getParameter("tournament_name");
			Part part = req.getPart("result_file");
			String fileName = part.getSubmittedFileName();

			ResultDetails r = new ResultDetails(tournamentName, fileName);

			ResultDAOImpl dao = new ResultDAOImpl(DBConnect.getConn());

			boolean f = dao.addResult(r);
			HttpSession session = req.getSession();

			// Handle result of the addition
			if (f == true) {

				String path = getServletContext().getRealPath("") + "tournament-logo";

				File file = new File(path);
				part.write(path + File.separator + fileName);

				session.setAttribute("succMsg", "Result Added Successfully");
				resp.sendRedirect("admin/addResult.jsp");
			} else {
				session.setAttribute("failedMsg", "Something Wrong on server");
				resp.sendRedirect("admin/addResult.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
