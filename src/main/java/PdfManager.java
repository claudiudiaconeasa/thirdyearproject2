import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.Files;

public class PdfManager
{
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

        InputStream Instream = ((HttpURLConnection) connection).getInputStream();

        // Write csv file
        BufferedInputStream bufferInput = new BufferedInputStream(Instream);

        //Readin from this path
//        FileOutputStream fileOut = new FileOutputStream(outputFilePathName);

        //Stream to write byte by byte
//        BufferedOutputStream finalOut = new BufferedOutputStream(fileOut);

        response.setContentType("application/octet-stream");
        int i;
        while ((i = bufferInput.read()) != -1)
        {
//            finalOut.write(i);
            //Downloading the file
            response.getOutputStream().write(i);
        }

    }

}
