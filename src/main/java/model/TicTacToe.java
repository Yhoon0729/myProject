package model;

public class TicTacToe {
	private int gameId;
    private String boardState = "---------";
    private char currentPlayer = 'X';

    public int getGameId() {
		return gameId;
	}

	public void setGameId(int gameId) {
		this.gameId = gameId;
	}

	public String getBoardState() {
        return boardState;
    }

    public void setBoardState(String boardState) {
        this.boardState = boardState;
    }

    public char getCurrentPlayer() {
        return currentPlayer;
    }

    public void setCurrentPlayer(char currentPlayer) {
        this.currentPlayer = currentPlayer;
    }

    public void makeMove(int row, int col) {
        int index = row * 3 + col;
        if (boardState.charAt(index) == '-') {
            boardState = boardState.substring(0, index) + currentPlayer + boardState.substring(index + 1);
            currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
        }
    }

    public char checkForWin() {
        String[] lines = {
            boardState.substring(0, 3),
            boardState.substring(3, 6),
            boardState.substring(6, 9),
            "" + boardState.charAt(0) + boardState.charAt(3) + boardState.charAt(6),
            "" + boardState.charAt(1) + boardState.charAt(4) + boardState.charAt(7),
            "" + boardState.charAt(2) + boardState.charAt(5) + boardState.charAt(8),
            "" + boardState.charAt(0) + boardState.charAt(4) + boardState.charAt(8),
            "" + boardState.charAt(2) + boardState.charAt(4) + boardState.charAt(6)  
        };

        for (String line : lines) {
            if (line.equals("XXX")) {
            	return 'X';
            }
            if (line.equals("OOO")) {
            	return 'O';
            }
        }

        return '-';
    }

    public boolean isBoardFull() {
        return !boardState.contains("-");
    }
}
