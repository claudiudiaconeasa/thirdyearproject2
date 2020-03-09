import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;


@WebServlet(name="Preview")
public class Preview extends HttpServlet
{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String jsonId = request.getPathInfo().substring((1));
        request.setAttribute("jsonId", jsonId);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/download.jsp");
        dispatcher.forward(request, response);
    }
}
