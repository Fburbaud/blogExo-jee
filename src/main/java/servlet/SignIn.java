package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

/**
 * Servlet implementation class SignIn
 */
@WebServlet("/signin")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UserDao userDao = new UserDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("signIn.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email_saisi = request.getParameter("email");
		String pwd_saisi = request.getParameter("pwd");
		//User nouveau = new User(email_saisi, pwd_saisi);
		boolean error = false;
		if(userDao.login(email_saisi,pwd_saisi) != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", userDao.login(email_saisi,pwd_saisi));
			response.sendRedirect("home");
		}else {
			error = true;
			request.setAttribute("error", error);
			doGet(request, response);
		}
	}

}
