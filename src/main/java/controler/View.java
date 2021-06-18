package controler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.NoticeDTO;
import vo.NoticeVO;

/**
 * Servlet implementation class View
 */
@WebServlet("/View.do")
public class View extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public View() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html; charset=UTF-8");
		
		String no = request.getParameter("no");
		
		NoticeDTO dto = new NoticeDTO();
		request.setAttribute("no",dto.View(no).getNo());
		request.setAttribute("title",dto.View(no).getTitle());
		request.setAttribute("body",dto.View(no).getBody());
		request.setAttribute("wdate",dto.View(no).getWdate());
		request.setAttribute("hit",dto.View(no).getHit());
		request.setAttribute("file",dto.View(no).getFile());

		RequestDispatcher rd = request.getRequestDispatcher("/board/view.jsp");
		rd.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
