package dao;

import model.TicTacToe;

import java.sql.*;

public class TicTacToeDAO {

    public Connection getConnection() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "kic24", "1234");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public TicTacToe getGame(int gameId) throws SQLException {
		Connection conn = getConnection();
        TicTacToe game = new TicTacToe();
        try {
            if (conn != null) {
                String sql = "select boardState, currentPlayer from TicTacToeGame where gameId = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, gameId);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    String boardState = rs.getString("boardState");
                    char currentPlayer = rs.getString("currentPlayer").charAt(0);

                    game.setBoardState(boardState);
                    game.setCurrentPlayer(currentPlayer);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return game;
    }

    public void saveGame(TicTacToe game, int gameId) throws SQLException {
        try (Connection connection = getConnection()) {
            if (connection != null) {
                String sql = "update TicTacToeGame set boardState = ?, currentPlayer = ? where gameId = ?";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, game.getBoardState());
                pstmt.setString(2, String.valueOf(game.getCurrentPlayer()));
                pstmt.setInt(3, gameId);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int createNewGame(TicTacToe game) throws SQLException {
        int gameId = 1;
        
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into TicTacToeGame (gameId, boardState, currentPlayer) values (ticseq.nextval, ?, ?)";
        
        try {
        		pstmt = conn.prepareStatement(sql);
        		pstmt.setString(1, game.getBoardState());
        		pstmt.setString(2, String.valueOf(game.getCurrentPlayer()));
        		pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        
        return gameId;
    }

    public void resetGame(int gameId) throws SQLException {
    	Connection conn = getConnection();
		PreparedStatement pstmt = null;
        try {
                String sql = "update TicTacToeGame set boardState = ?, currentPlayer = ? where gameId = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, "---------");
                pstmt.setString(2, "X");
                pstmt.setInt(3, gameId);
                pstmt.executeUpdate();
        } catch (SQLException e) { 
            e.printStackTrace();
        }
    }
}
