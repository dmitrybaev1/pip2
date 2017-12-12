import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
public class AreaCheckServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        String s_x = request.getParameter("x");
        String s_y = request.getParameter("y");
        String s_r = request.getParameter("r");
        Double x = Double.parseDouble(s_x);
        Double y = Double.parseDouble(s_y);
        Integer r = Integer.parseInt(s_r);
        String result = checkArea(x,y,r);
        request.getSession().setAttribute("x",x);
        request.getSession().setAttribute("y",y);
        request.getSession().setAttribute("r",r);
        request.getSession().setAttribute("result",result);
        form(out,x,y,r,result);

    }
    String checkArea(double x,double y,int r){
        if((y<=0.5*x+((double)r/2)&&y>=0&&x<=0)||(y<=r&&x<=(double)r/2&&y>=0&&x>=0)||(Math.pow(x,2)+Math.pow(y,2)<=Math.pow((double)r/2,2)&&x>=0&&y<=0))
            return "Точка входит в область";
        return "Точка не входит в область";
    }
    void form(PrintWriter out,double x,double y,int r,String result){
        out.println("<html><head><title>result</title><style>table\n" +
                "        {\n" +
                "            table-layout:fixed;\n" +
                "            width:50%;\n" +
                "        }\n" +
                "        td\n" +
                "        {\n" +
                "            vertical-align:bottom;\n" +
                "            text-align:left;\n" +
                "            border: 1px solid black;\n" +
                "            overflow:auto;\n" +
                "        }\n" +
                "\t.values\n" +
                "        {\n" +
                "            font-size:20pt;\n" +
                "        }\n" +
                "\t.name\n" +
                "        {\n" +
                "            font-size:25pt;\n" +
                "            font-weight:600;\n" +
                "        }\n" +
                "</style>" +
                "<head>\n" +
                "<body>\n" +
                " <table class=\"calculation\">\n" +
                "\t<tr>\n" +
                "\t  <td class=\"name\">X:</td>\n" +
                "\t  <td class=\"values\">"+x+"</td>\n" +
                "\t</tr>\n" +
                "\t<tr>\n" +
                "\t  <td class=\"name\">Y:</td>\n" +
                "\t  <td class=\"values\">"+y+"</td>\n" +
                "\t</tr>\n" +
                "\t<tr>\n" +
                "\t  <td class=\"name\">R:</td>\n" +
                "\t  <td class=\"values\">"+r+"</td>\n" +
                "\t</tr>\n" +
                "\t<tr>\n" +
                "\t  <td class=\"name\">Результат:</td>\n" +
                "\t  <td class=\"values\">"+result+"</td>\n" +
                "\t</tr>\n" +
                "</table>\n" +
                "<a href=\"index.jsp\" class=\"values\">Назад</a>\n" +
                "</body>\n" +
                "</html>");
    }
}

