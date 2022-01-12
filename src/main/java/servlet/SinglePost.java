package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ArticleDao;
import model.User;

/**
 * Servlet implementation class SinglePost
 */
@WebServlet("/singlepost")
public class SinglePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArticleDao articleDao = new ArticleDao();
       
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
		
		request.getRequestDispatcher("singlePost.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int idToDelete = Integer.parseInt(request.getParameter("idArticleToDelete"));
		String delete = request.getParameter("purpose");
		if(delete.equals("D")) {
			articleDao.delete(idToDelete);
			response.sendRedirect("home");
		}
		
	}

}
