import java.io.IOException;
import java.net.URLEncoder;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SalaryProcessor
 */
public class SalaryProcessor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SalaryProcessor() {
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException{
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        // Получение параметра из строки запроса
        String parameter = request.getParameter("salary"); //может быть null
        // Сохранение зарплаты в сессии
        request.getSession().setAttribute("salary", parameter);
        // Сохранение зарплаты в Cookie
        Cookie c = new Cookie("salary", URLEncoder.encode(parameter, "UTF-8"));
        // Установка времени жизни Cookie в секундах
        c.setMaxAge(100);
        response.addCookie(c);
        // Перенаправление на страницу
        response.sendRedirect(response.encodeRedirectURL(request.getContextPath() +
                "/HelloServlet.jsp"));
    }
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
