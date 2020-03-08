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

        generatePdf(request,response);

    }

    private void generatePdf(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
    {

        String path = "/../../template/pdfFiles/FirstCalendar (1).pdf";
//       String relative =
//       String absolutePath = path.toRelativePath
//        String path = getClass().getResource("FirstCalendar (1).pdf").getPath();
//        template/pdfFiles/FirstCalendar (1).pdf
//        String path = "template/pdfFiles/FirstCalendar (1).pdf";
//        String base = "/template";
//
//        String relative = new File(base).toURI().relativize(new File(path).toURI()).getPath();


        File downloadFile = new File("/Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/web/template/pdfFiles/FirstCalendar (1).pdf");
        String relativePath = downloadFile.getCanonicalPath();

        System.out.println(relativePath);

        File passDownloadFile = new File(relativePath);
        FileInputStream in = new FileInputStream(passDownloadFile);

        response.setContentType("application/octet-stream");
        response.setContentLength((int) downloadFile.length());

        // Set file to be returned as the pdf to the user - download
        String key = "Content-Disposition";
        String value = String.format("attachment; filename=\"%s\"", downloadFile.getName());

        response.setHeader(key, value);

        //Returning the stream from the response - actually receiving the file
        OutputStream out = response.getOutputStream();

        byte[] buffer = new byte[4096];
        int bytes = -1;

        while ((bytes = in.read(buffer)) != -1)
        {
            out.write(buffer, 0, bytes);
        }


    }

}


