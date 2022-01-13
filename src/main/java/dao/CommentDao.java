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
				"commentaire (userComment, created_at, contenu, article) VALUES (?, NOW(), ?, ?)");
			sql.setInt(1, comment.getUser().getId_user());
			sql.setString(2, comment.getContent());
			sql.setInt(3, comment.getArticle().getId_article());
			
			sql.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Comment> read(int idArticle){
		PreparedStatement sql2;
		try {
			sql2 = connect.prepareStatement("SELECT * FROM commentaire INNER JOIN user"+
					" ON user.id_user=commentaire.userComment INNER JOIN article ON"+
					" article.id_article=commentaire.article WHERE commentaire.article=?");
			sql2.setInt(1, idArticle);
			rs = sql2.executeQuery();
			while(rs.next()) {
				java.util.Date sqlDate = new java.sql.Date(rs.getDate("created_at").getTime());
				Comment comment = new Comment(rs.getInt("id_commentaire"), 
					new User(rs.getInt("id_user"), rs.getString("nom"), rs.getString("prenom")),
					sqlDate, rs.getString("contenu"));
				listeComments.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listeComments;
	}
	
	public void delete(int idToDelete) {
		try {
			PreparedStatement sql = connect.prepareStatement("DELETE FROM commentaire WHERE id_commentaire=?");
			sql.setInt(1, idToDelete);
			sql.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
