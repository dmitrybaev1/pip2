import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
public class ControllerServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
    {
        PrintWriter out = response.getWriter();
        if(request.getMethod()=="GET")
        {
            if(request.getParameter("x") != null & request.getParameter("y") != null & request.getParameter("r") != null)
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/areacheck");
                dispatcher.forward(request, response);
            }
            else
            {
                out.println("Error");
            }
        }
        else
        {
            out.println("Error");
        }
    }
}
