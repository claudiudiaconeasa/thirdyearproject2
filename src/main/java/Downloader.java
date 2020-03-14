import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Downloader")
//Requests are expected to be made as: multipart/form-data MME type
public class Downloader extends HttpServlet
{

    //Retrieves the destination and filepart
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String id = request.getParameter("jsonId");

        PdfManager.sendCsvRequest("http://127.0.0.1:5000/generate","./src/main/web/template/uploadedTimeLineCsv/" + id + ".csv",
            "success", request, response);
    }


}


