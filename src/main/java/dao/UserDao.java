package dao;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import model.User;

public class UserDao {
	public static User currentUser;
	Connection connect = GetConnection.getConnection();
	ResultSet rs = null;
	
	public void create(User user) {
		try {
				PreparedStatement sql = connect.prepareStatement("INSERT INTO "+
					"user (nom, prenom, email, pwd) VALUES (?, ?, ?, ?)");
				sql.setString(1, user.getNom());
				sql.setString(2, user.getPrenom());
				sql.setString(3, user.getEmail());
				try {
					sql.setString(4, encode(user.getPwd()));
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				sql.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public boolean verifMailDispo(String email) {
		boolean check = true;
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM user WHERE email=?");
			sql.setString(1, email);
			rs = sql.executeQuery();
			
			if(rs.next()) {
				currentUser = new User(rs.getString("nom"), rs.getString("prenom"), rs.getString("email"), rs.getString("pwd"));
				check = false;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}
	
	public User login(String mail, String mdp) {
		//boolean msg = false;
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM user"+
					" WHERE email=? AND pwd=?");
			sql.setString(1, mail);
			try {
				sql.setString(2, encode(mdp));
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			rs = sql.executeQuery();
			
			if(rs.next()) {
				//msg = true;
				User user = new User(rs.getInt("id_user"), rs.getString("nom"), rs.getString("prenom"), rs.getString("email"));
				return user;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//cryptage du pwd:
	public static String encode(String value) throws NoSuchAlgorithmException {
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		byte[] hash = md.digest(value.getBytes(StandardCharsets.UTF_8));
		String encoded = Base64.getEncoder().encodeToString(hash);
		
		return encoded;
	}
}
