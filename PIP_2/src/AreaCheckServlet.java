import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
public class AreaCheckServlet extends HttpServlet
{
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        String s_x = request.getParameter("x");
        String s_y = request.getParameter("y");
        String s_r = request.getParameter("r");
        Double x = Double.parseDouble(s_x);
        Double y = Double.parseDouble(s_y);
        Integer r = Integer.parseInt(s_r);
        String result = checkArea(x, y, r);
        request.setAttribute("result",result);
        request.setAttribute("rad",r);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }

    String checkArea(double x, double y, int r)
    {
        if ((y <= 0.5 * x + ((double)r/2) && y >=0 && x<=0) || (y <= r && x <= (double)r/2 && y >= 0 && x >= 0) ||
            (Math.pow(x, 2) + Math.pow(y, 2) <= Math.pow((double)r/2, 2) && x >= 0 && y <= 0))
        {
            return "Точка входит в область";
        }
        return "Точка не входит в область";
    }

}

