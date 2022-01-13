package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ArticleDao;
import dao.CommentDao;
import model.Article;
import model.Comment;
import model.User;
/**
 * Servlet implementation class SinglePost
 */
@WebServlet("/singlepost")
public class SinglePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArticleDao articleDao = new ArticleDao();
    CommentDao commentDao = new CommentDao();
    List<Comment> listComments = new ArrayList<>();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SinglePost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.getAttribute("user");
		
		int id = Integer.parseInt(request.getParameter("idArticle"));
		request.setAttribute("article", articleDao.findById(id));
		listComments.clear();
		listComments = commentDao.read(id);
		request.setAttribute("listComments", listComments);
		
		request.getRequestDispatcher("singlePost.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.getAttribute("user");
		User user = (User) session.getAttribute("user");
		
		String purpose = request.getParameter("purpose");
						
		if(purpose.equals("D")) {
			int idToDelete = Integer.parseInt(request.getParameter("idArticleToDelete"));
			articleDao.delete(idToDelete);
			response.sendRedirect("home");
		}
		
		if(purpose.equals("C")) {
			int idToComment = Integer.parseInt(request.getParameter("idArticleToComment"));
			Comment nouveau = new Comment(user, request.getParameter("contenu"), new Article(idToComment));
			commentDao.create(nouveau);
			
		}
		
		if(purpose.equals("S")) {
			int idComToDelete = Integer.parseInt(request.getParameter("idCommentToDelete"));
			commentDao.delete(idComToDelete);
		}
		
		doGet(request, response);
	}

}
