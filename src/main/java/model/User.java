package model;

public class User {
	private int id_user;
	private String nom;
	private String prenom;
	private String email;
	private String pwd;
	
	public User(int id_user) {
		super();
		this.id_user = id_user;
	}

	public User(String email, String pwd) {
		super();
		this.email = email;
		this.pwd = pwd;
	}

	public User(int id_user, String nom, String prenom) {
		super();
		this.id_user = id_user;
		this.nom = nom;
		this.prenom = prenom;
	}

	public User(int id_user, String nom, String prenom, String email) {
		super();
		this.id_user = id_user;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
	}

	public User(String nom, String prenom, String email, String pwd) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.pwd = pwd;
	}

	public User(int id_user, String nom, String prenom, String email, String pwd) {
		super();
		this.id_user = id_user;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.pwd = pwd;
	}

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
}
