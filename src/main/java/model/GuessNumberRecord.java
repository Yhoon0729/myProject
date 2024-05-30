package model;

public class GuessNumberRecord {
	private int rank;
	private int num;
    private String userId;
	private String name;
    private int attempts;

    public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}
	
    public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getUserId() {
        return userId;
    }

	public void setUserId(String userId) {
        this.userId = userId;    
    }	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	

    public int getAttempts() {
        return attempts;
    }

    public void setAttempts(int attempts) {
        this.attempts = attempts;
    }

}
