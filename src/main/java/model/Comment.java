package model;

import java.util.Date;

public class Comment {
	private int id_comment;
	private User user;
	private Date created_at;
	private String content;
	private Article article;
	
	public Comment(int id_comment, User user, Date created_at, String content, Article article) {
		super();
		this.id_comment = id_comment;
		this.user = user;
		this.created_at = created_at;
		this.content = content;
		this.article = article;
	}

	public Comment(User user, String content, Article article) {
		super();
		this.user = user;
		this.content = content;
		this.article = article;
	}

	public int getId_comment() {
		return id_comment;
	}

	public void setId_comment(int id_comment) {
		this.id_comment = id_comment;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}
	
}
