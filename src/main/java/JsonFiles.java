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
/* Servlet to get the generated json file with UUID assigned  after upload in order to pass it
  to the server to idenity it before download
    */
@WebServlet(name = "JsonFiles")
public class JsonFiles extends HttpServlet
{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String jsonId = request.getPathInfo().substring((1));

        String path = "./src/main/web/template/generatedTimeLineJson/" + jsonId + ".json";
        String content = new String(Files.readAllBytes(Paths.get(path)), StandardCharsets.UTF_8);

        PrintWriter outWriter = response.getWriter();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        outWriter.print(content);
        outWriter.flush();

    }

}
