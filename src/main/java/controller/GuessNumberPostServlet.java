package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.GuessNumberDAO;
import kic.mskim.MskimRequestMapping;

@WebServlet("/content/guessNumberPost")
public class GuessNumberPostServlet extends MskimRequestMapping {
    private static final long serialVersionUID = 1L;
    HttpSession session;
    
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session = request.getSession();
		System.out.println("service");
		super.service(request, response);
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        request.setCharacterEncoding("utf-8");
        int number = (int) session.getAttribute("number");
        int guess = Integer.parseInt(request.getParameter("guess"));
        int attempts = (int) session.getAttribute("attempts") + 1;

        session.setAttribute("attempts", attempts);

        String message = "";
        if (guess > number) {
            message = "더 작은 숫자입니다.";
        } else if (guess < number) {
            message = "더 큰 숫자입니다.";
        } else {
            message = "축하합니다! 숫자를 맞추셨습니다. 총 " + attempts + "번 만에 맞추셨습니다.";
            session.removeAttribute("number");

            String userId = (String) session.getAttribute("id");
            String name = (String) session.getAttribute("name");
            GuessNumberDAO dao = new GuessNumberDAO();
            try {
                dao.saveRecord(userId, name, attempts);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        session.setAttribute("number", number);
        request.setAttribute("message", message);
        request.getRequestDispatcher("/view/content/guessNumber.jsp").forward(request, response);
    }
}
