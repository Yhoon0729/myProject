package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.GuessNumberDAO;
import dao.TicTacToeDAO;
import kic.mskim.MskimRequestMapping;
import kic.mskim.RequestMapping;
import model.GuessNumberRecord;
import model.TicTacToe;

@WebServlet("/content/*")
public class ContentController extends MskimRequestMapping {
	HttpSession session;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session = request.getSession();
		System.out.println("service");
		super.service(request, response);
	}
    
    @RequestMapping("fortunePro")
    public String fortunePro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

       
        Object loginUser = session.getAttribute("loginUser");

        if (loginUser == null) {
            request.setAttribute("msg", "로그인 후 운세를 확인할 수 있습니다.");
            request.setAttribute("url", "login.jsp");
            return "/view/alert.jsp";
        }

        String name = request.getParameter("name");
        request.setAttribute("name", name);
        return "/view/content/fortuneResult.jsp";
    }
    
    @RequestMapping("guessNumber")
    public String guessNumber(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
        GuessNumberDAO dao = new GuessNumberDAO();
       
		List<GuessNumberRecord> li=null;
		try {
			li = dao.getRecords();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        Random random = new Random();
        int number = random.nextInt(100) + 1;
        session.setAttribute("number", number);
        session.setAttribute("attempts", 0); // 시도 횟수를 초기화합니다.
        request.setAttribute("li", li);       
        return "/view/content/guessNumber.jsp";
    }
	
    @RequestMapping("tic")
    public String tic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        TicTacToeDAO dao = new TicTacToeDAO();
        Integer gameId = (Integer) session.getAttribute("gameId");

        try {
            if (gameId == null) {
                TicTacToe game = new TicTacToe();
                gameId = dao.createNewGame(game);
                session.setAttribute("gameId", gameId);
                System.out.println("새로운 게임 생성: gameId = " + gameId);
            }

            TicTacToe game = dao.getGame(gameId);
            String boardState = game.getBoardState();
            System.out.println("gameId:  "+ gameId);
            
            session.setAttribute("gameId", gameId);
            request.setAttribute("boardState", boardState);
            request.setAttribute("currentPlayer", game.getCurrentPlayer());
            System.out.println("게임 로드: " + game.toString());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "/view/content/tic.jsp";
    }

    @RequestMapping("ticMove")
    public String ticMove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TicTacToeDAO dao = new TicTacToeDAO();
        String click = request.getParameter("click");
        Integer gameId = (Integer) session.getAttribute("gameId");
        String msg = "";
        String url = "";
        

        if (click != null && gameId != null) {
        	
            if ("select".equals(click)) {
                int row = Integer.parseInt(request.getParameter("row"));
                int col = Integer.parseInt(request.getParameter("col"));
                TicTacToe game = null;
                try {
                    game = dao.getGame(gameId);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                
                if (game != null) {

                    game.makeMove(row, col);
                    try {
                        dao.saveGame(game, gameId);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                } // end of if(game != null)
                
            	char winner = game.checkForWin();
				if (winner == 'X' || winner == 'O') {
					msg = "플레이어 " + winner + "가 승리했습니다!";
					url = "tic";
					request.setAttribute("msg", msg);
					request.setAttribute("url", url);
					return "/view/alert.jsp";
					
				} else if (game.isBoardFull()) {
					msg = "무승부입니다!";
					url = "tic";
					request.setAttribute("msg", msg);
					request.setAttribute("url", url);
					return "/view/alert.jsp";
				}
                
            } else if ("reset".equals(click)) {
                try {
                    dao.resetGame(gameId);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                
            } // end of if ("select".equals(click))
            
        } // end of if (click != null && gameId != null)
        
        
        return tic(request, response);
    }

    
    
    @RequestMapping("record")
    public String record(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
      

        GuessNumberDAO dao = new GuessNumberDAO();
        List<GuessNumberRecord> records = null;      

        try {
            records = dao.getTopRecords();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("records", records);
        return "/view/content/record.jsp";
    }
    
}
