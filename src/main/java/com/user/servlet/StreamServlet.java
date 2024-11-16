package com.user.servlet;

import com.DAO.StreamDAOImpl;
import com.DB.DBConnect;
import com.entity.StreamDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/add_stream")
@MultipartConfig
public class StreamServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get the tournament name and stream link from the request
            String tournamentName = req.getParameter("tournamentName");
            String streamLink = req.getParameter("streamLink");

            // Create a StreamDetails object with the obtained data
            StreamDetails streamDetails = new StreamDetails();
            streamDetails.setTournament_name(tournamentName);
            streamDetails.setStream_link(streamLink);

            // Create an instance of StreamDAOImpl with a database connection
            StreamDAOImpl streamDAO = new StreamDAOImpl(DBConnect.getConn());

            // Add the stream details to the database
            boolean isSuccess = streamDAO.addStream(streamDetails);
            HttpSession session = req.getSession();

            // Check if the addition was successful and redirect accordingly
            if (isSuccess) {
                session.setAttribute("succMsg", "Stream Added Successfully");
                resp.sendRedirect("admin/stream.jsp"); // Redirect to the success page
            } else {
                session.setAttribute("failedMsg", "Something Wrong on server");
                resp.sendRedirect("admin/stream.jsp"); // Redirect to the error page
            }

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("failedMsg", "An error occurred while adding the stream");
            resp.sendRedirect("admin/addStream.jsp"); // Redirect to the error page
        }
    }
}
