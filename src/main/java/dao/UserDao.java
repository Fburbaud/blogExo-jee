package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;

public class UserDao {
	public static User currentUser;
	Connection connect = GetConnection.getConnection();
	ResultSet rs = null;
	
	public void create(User user) {
		try {
			if(verifMailDispo(user.getEmail())) {
				PreparedStatement sql = connect.prepareStatement("INSERT INTO "+
					"user (nom, prenom, email, pwd) VALUES (?, ?, ?, PASSWORD(?))");
				sql.setString(1, user.getNom());
				sql.setString(2, user.getPrenom());
				sql.setString(3, user.getEmail());
				sql.setString(4, user.getPwd());
				
				sql.executeUpdate();
			
			}
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
	
	public boolean login(String mail, String mdp) {
		boolean msg = false;
		try {
			PreparedStatement sql = connect.prepareStatement("SELECT * FROM user WHERE email=? AND pwd=PASSWORD(?)");
			sql.setString(1, mail);
			sql.setString(2, mdp);
			rs = sql.executeQuery();
			
			if(rs.next()) {
				msg = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return msg;
		
	}
}
