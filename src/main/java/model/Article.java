package model;

import java.util.Date;

public class Article {
	private int id_article;
	private String titre;
	private String resume;
	private String contenu;
	private Date date_creation;
	private User user;
	
	public Article(int id_article, String titre, String resume, String contenu, Date date_creation, User user) {
		super();
		this.id_article = id_article;
		this.titre = titre;
		this.resume = resume;
		this.contenu = contenu;
		this.date_creation = date_creation;
		this.user = user;
	}

	public int getId_article() {
		return id_article;
	}

	public void setId_article(int id_article) {
		this.id_article = id_article;
	}

	public String getTitre() {
		return titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public String getContenu() {
		return contenu;
	}

	public void setContenu(String contenu) {
		this.contenu = contenu;
	}

	public Date getDate_creation() {
		return date_creation;
	}

	public void setDate_creation(Date date_creation) {
		this.date_creation = date_creation;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
