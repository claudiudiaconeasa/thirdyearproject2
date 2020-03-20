import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/* Servlet to redirect the user to the loader page and waiting for the pdf to get generated from the booted flask server
 */
@WebServlet(name = "Downloader")
public class Downloader extends HttpServlet
{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        //UUID of each json generated file on upload
        String id = request.getParameter("jsonId");

        //Generating the pdf from our booted server
        PdfManager.sendCsvRequest("http://165.22.125.196:1337/generate","./src/main/web/template/uploadedTimeLineCsv/" + id + ".csv",
            "success", request, response);
    }


}


