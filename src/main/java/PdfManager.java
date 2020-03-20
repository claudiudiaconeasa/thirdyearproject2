import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.Files;

/* Servlet to send a request to the server and return the pdf
 */
@WebServlet(name = "PdfManager")
public class PdfManager extends HttpServlet
{
    //Will redirect to the loader page which is handling a request itself on the frontend
    public static void sendCsvRequest(String url, String path, String outputFilePathName, HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        File file = new File(path);

        //Set POST general headers along with the boundary string (the seperator string of each part)
        URLConnection connection = new URL(url).openConnection();
        connection.setDoOutput(true);

        String boundary = "------------------------" + Long.toHexString(System.currentTimeMillis());
        connection.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);

        OutputStream output = connection.getOutputStream();

        PrintWriter writer = new PrintWriter(new OutputStreamWriter(output, "UTF-8"), true);

        String CRLF = "\r\n"; // Line separator required by multipart/form-data.
        writer.append("--" + boundary).append(CRLF);
        writer.append("Content-Disposition: form-data; name=\"file\"; filename=\"" + file.getName() + "\"").append(CRLF);
        writer.append("Content-Type: application/octet-stream").append(CRLF);// + URLConnection.guessContentTypeFromName(binaryFile.getName())).append(CRLF);
        writer.append(CRLF).flush();

        // File data
        Files.copy(file.toPath(), output);
        output.flush();

        // End of multipart/form-data.
        writer.append(CRLF).append("--" + boundary + "--").flush();

        BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        String inputLine;
        StringBuffer content = new StringBuffer();
        while ((inputLine = in.readLine()) != null)
        {
            content.append(inputLine);
        }
        in.close();

        response.sendRedirect("load.jsp?id=" + content.toString());
    }

    //Sending request to the webserver from the loader page in order to start the download
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        HttpURLConnection connection = (HttpURLConnection) new URL("http://165.22.125.196:1337/poll?idname=" + request.getParameter("idname")).openConnection();

        connection.setRequestMethod("GET");
        connection.setDoOutput(true);

        StringBuilder content;

        try (BufferedReader input = new BufferedReader(new InputStreamReader(connection.getInputStream())))
        {
            if (connection.getContentType().equals("application/pdf"))
            {
                response.setContentType("application/pdf");
                response.setContentLength(connection.getContentLength());
                response.setHeader("Content-Disposition", "attachment; filename=\"calendar.pdf\"");

                InputStream inputStream = connection.getInputStream();
                OutputStream outputStream = response.getOutputStream();

                byte[] chunk = new byte[1024 * 4];
                int n = 0;

                while ((n = inputStream.read(chunk)) != -1)
                {
                    outputStream.write(chunk, 0, n);
                }
            }
            else
            {
                String line;
                content = new StringBuilder();
                while ((line = input.readLine()) != null) {
                    content.append(line);
                    content.append(System.lineSeparator());
                }
            }
        } finally
        {
            connection.disconnect();
        }
    }

}
