import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;

@WebServlet(name = "Uploader")
//Requests are expected to be made as: multipart/form-data MME type
@MultipartConfig
public class Uploader extends HttpServlet
{
    //Will retrieve the name of the file from the file part
    private String getFile(final Part part) {
        for (String content : part.getHeader("content-disposition").split(";"))
        {
            if (content.trim().startsWith("name"))
            {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    //Retrieves the destination and filepart
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        response.setContentType("text/html;charset=UTF-8");
        int read = 0;

        // Create path components to save the file
        final Part filePart = request.getPart("file");
        final String name = getFile(filePart);

        final PrintWriter writer = response.getWriter();

        final String path = "/Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/web/template/uploadedFile";

        OutputStream out = null;
        InputStream filecontent = null;

        //File copied to the final destination
        out = new FileOutputStream(new File(path + File.separator + name));
        filecontent = filePart.getInputStream();

        final byte[] bytes = new byte[1024];

        while ((read = filecontent.read(bytes)) != -1)
        {
            out.write(bytes, 0, read);
        }

//        writer.println("New file " + name + " created at " + path);
        //Going to the download button
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/download.jsp");
        dispatcher.forward(request, response);


    }

    }



