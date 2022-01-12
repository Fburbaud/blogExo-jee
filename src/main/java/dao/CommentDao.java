package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Article;
import model.Comment;
import model.User;

public class CommentDao {
	Connection connect = GetConnection.getConnection();
	ResultSet rs = null;
	List<Comment> listeComments = new ArrayList<>();
	
	public void create(Comment comment) {
		try {
			PreparedStatement sql = connect.prepareStatement("INSERT INTO "+
				"commentaire (nom, created_at, contenu, article) VALUES (?, NOW(), ?, ?)");
			sql.setInt(1, comment.getUser().getId_user());
			sql.setString(2, comment.getContent());
			sql.setInt(3, comment.getArticle().getId_article());
			
			sql.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Comment> read(){
		PreparedStatement sql2;
		try {
			sql2 = connect.prepareStatement("SELECT * FROM commentaire INNER JOIN user"+
					" ON user.id_user=commentaire.nom INNER JOIN article ON"+
					" article.id_article=commentaire.article");
			rs = sql2.executeQuery();
			while(rs.next()) {
				java.util.Date sqlDate = new java.sql.Date(rs.getDate("created_at").getTime());
				Comment comment = new Comment(rs.getInt("id_commentaire"), 
					new User(rs.getInt("id_user"), rs.getString("nom"), rs.getString("prenom")),
					sqlDate, rs.getString("contenu"), new Article(rs.getInt("id_article")));
				listeComments.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listeComments;
	}
}
