import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
public class ControllerServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
    {
        PrintWriter out = response.getWriter();
        double x=0;
        double y=0;
        int r=0;
        if(request.getMethod()=="GET")
        {
            if(request.getParameter("x") != null & request.getParameter("y") != null & request.getParameter("r") != null)
            {
                try
                {
                    x = Double.parseDouble(request.getParameter("x"));
                }
                catch (NumberFormatException e)
                {
                    out.println("Error");
                }
                try
                {
                    y = Double.parseDouble(request.getParameter("y"));
                }
                catch (NumberFormatException e)
                {
                    out.println("Error");
                }
                try
                {
                    r = Integer.parseInt(request.getParameter("r"));
                }
                catch (NumberFormatException e)
                {
                    out.println("Error");
                }
                if (y >= -3 & y <= 5 & (r == 1 || r == 2 || r == 3 || r == 4 || r == 5))
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
        else
        {
            out.println("Error");
        }
    }
}