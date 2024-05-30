package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.GuessNumberRecord;
import model.KicBoard;

public class GuessNumberDAO {

	public Connection getConnection() {
		// 1. driver
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "kic24", "1234");
			return conn;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 2 connection
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}

	public int saveRecord(String userId, String name, int attempts) throws SQLException {

		Connection conn = getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into GuessNumberRecord values (noseq.nextval, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, name);
			pstmt.setInt(3, attempts);

			int num = pstmt.executeUpdate();
			return num;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	public List<GuessNumberRecord> getRecords() throws SQLException {

		Connection conn = getConnection();
		PreparedStatement pstmt = null;

		String sql = "select rank() over (order by attempts) rank, userId, name, attempts from GuessNumberRecord";
		List<GuessNumberRecord> records = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				GuessNumberRecord record = new GuessNumberRecord();
				record.setRank(rs.getInt("rank"));
				record.setUserId(rs.getString("userId"));
				record.setName(rs.getString("name"));
				record.setAttempts(rs.getInt("attempts"));
				records.add(record);
			} // end of while
			
			return records;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} // end of tryCatch
		
		return null;
	} // end of getRecords()
	
    public List<GuessNumberRecord> getTopRecords() throws SQLException {
        Connection conn = getConnection();
        PreparedStatement pstmt = null;
        String sql = "select * from (select rank() over (order by attempts) rank, userId, name, attempts from GuessNumberRecord) where rank <= 3";
        List<GuessNumberRecord> records = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                GuessNumberRecord record = new GuessNumberRecord();
                record.setRank(rs.getInt("rank"));
                record.setUserId(rs.getString("userId"));
                record.setName(rs.getString("name"));
                record.setAttempts(rs.getInt("attempts"));
                records.add(record);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
        return records;
    } // end of getTopRecords()
	
}
