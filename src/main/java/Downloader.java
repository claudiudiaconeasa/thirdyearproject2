import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;

@WebServlet(name = "Downloader")
//Requests are expected to be made as: multipart/form-data MME type
public class Downloader extends HttpServlet
{

    //Retrieves the destination and filepart
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String id = request.getParameter("jsonId");

        PdfManager.sendCsvRequest("http://127.0.0.1:5000/generate","/Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/web/template/uploadedTimeLineCsv/" + id + ".csv",
            "success", request, response);
    }


}


