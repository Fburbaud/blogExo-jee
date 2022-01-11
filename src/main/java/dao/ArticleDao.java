package dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Article;
import model.User;

public class ArticleDao {
	Connection connect = GetConnection.getConnection();
	ResultSet rs = null;
	List<Article> listeArticles = new ArrayList<>();
	
	public void create(Article article) {
		try {
			PreparedStatement sql = connect.prepareStatement("INSERT INTO "+
				"article (titre, resume, contenu, date_creation, auteur) VALUES (?, ?, ?, NOW(), ?)");
			sql.setString(1, article.getTitre());
			sql.setString(2, article.getResume());
			sql.setString(3, article.getContenu());
			sql.setInt(3, article.getUser().getId_user());
			
			sql.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Article> read(){
		PreparedStatement sql2;
		try {
			sql2 = connect.prepareStatement("SELECT * FROM article WHERE isVisible=?");
			sql2.setInt(1, 1);
			rs = sql2.executeQuery();
			while(rs.next()) {
				java.util.Date sqlDate = new java.sql.Date(rs.getDate("dateReception").getTime());
				Article article = new Article(rs.getInt("id_article"),
					rs.getString("titre"),rs.getString("resume"), rs.getString("contenu"),
					sqlDate, new User(rs.getString("prenom"), rs.getString("nom")));
				listeArticles.add(article);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listeArticles;
	}
}
