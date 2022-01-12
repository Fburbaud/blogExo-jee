package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ArticleDao;
import dao.UserDao;
import model.Article;
import model.User;


/**
 * Servlet implementation class Posts
 */
@WebServlet("/creapost")
public class CreaPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ArticleDao articleDao = new ArticleDao();
    UserDao userDao = new UserDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreaPost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("creaPost.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.getAttribute("user");
		
		System.out.println(session.getAttribute("user"));
		User user = (User) session.getAttribute("user");
		Article nouveau = new Article(request.getParameter("titre"), request.getParameter("resume"),
				request.getParameter("contenu"), user);
		articleDao.create(nouveau);
		
		doGet(request,response);
	}

}
