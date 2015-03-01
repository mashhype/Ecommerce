package couchPotato;
import java.sql.*;

public class UserDB {

	public static int insert(User user) {
		
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;
		
		String query = "INSERT INTO User (FirstName, LastName, EmailAddress, Password) " + "VALUES (?, ?, ?, ?)";
		
		try {
			
			ps = connection.prepareStatement(query);
			ps.setString(1,  user.getFirstName());
			ps.setString(2,  user.getLastName());
			ps.setString(3,  user.getEmail());
			ps.setString(4,  user.getPassword());
			return ps.executeUpdate();
		
		} catch(SQLException e) {
			
			e.printStackTrace();
			return 0;
		
		} finally {
			
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(connection);
		
		}
	}

	public static int update(User user) {
		
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;
		
		String query = "UPDATE User SET " + "FirstName = ?" + "LastName = ?" + "EmailAddress = ?, " + "Password = ?, " + "WHERE EmailAddress = ?";
		
		try {
			
			ps = connection.prepareStatement(query);
			ps.setString(1,  user.getFirstName());
			ps.setString(2,  user.getLastName());
			ps.setString(3,  user.getEmail());
			ps.setString(4,  user.getPassword());
			return ps.executeUpdate();
		
		} catch(SQLException e) {
			
			e.printStackTrace();
			return 0;
			
		} finally {
			
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(connection);
		
		}
		
	}

	public static int delete(User user) {
		
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;
		
		String query = "DELETE FROM User " + "WHERE EmailAddress = ?";
		
		try {
			
			ps = connection.prepareStatement(query);
			ps.setString(1,  user.getEmail());
			return ps.executeUpdate();
		
		} catch(SQLException e) {
			
			e.printStackTrace();
			return 0;
			
		} finally {
			
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(connection);
		
		}
	}

	public static boolean emailExists(String emailAddress) {
		
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String query = "SELECT EmailAddress FROM User " + "WHERE EmailAddress = ?";
		
		try {
			
			ps = connection.prepareStatement(query);
			ps.setString(1,  emailAddress);
			rs = ps.executeQuery();
			return rs.next();
		
		} catch(SQLException e) {
			
			e.printStackTrace();
			return false;
			
		} finally {
			
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(connection);
		
		}
	}
	
	public static boolean passwordMatch(String email, String password) {
		
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String query = "SELECT Password FROM User " + "WHERE EmailAddress = ? AND password = ?";
		
		try {
			
			ps = connection.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2,  password);
			rs = ps.executeQuery();
			return rs.next();
		
		} catch(SQLException e) {
			
			e.printStackTrace();
			return false;
			
		} finally {
			
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(connection);
		
		}
	}
	
	//if the email address doesnt exist then create a new record in the db
	public static User selectUser(String emailAddress) {
		
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String query = "SELECT * FROM User " + "WHERE EmailAddress = ?";
		
		try {
			
			ps = connection.prepareStatement(query);
			ps.setString(1,  emailAddress);
			rs = ps.executeQuery();
			User user = null;
			if (rs.next()) {
				
				user = new User();
				user.setEmail(rs.getString("EmailAddress"));
				user.setPassword(rs.getString("Password"));
			}
			return user;
		
		} catch(SQLException e) {
			
			e.printStackTrace();
			return null;
			
		} finally {
			
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(connection);
		
		}
	}

}
