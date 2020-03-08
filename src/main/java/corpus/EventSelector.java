import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import com.opencsv.CSVWriter;
import com.sun.xml.internal.ws.client.sei.ResponseBuilder;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils;
import corpus.Article;
import corpus.CsvReader;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.channels.Channels;
import java.nio.channels.FileChannel;
import java.nio.channels.ReadableByteChannel;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpConnectionManager;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.MultiThreadedHttpConnectionManager;
import org.apache.commons.httpclient.methods.MultipartPostMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.multipart.FilePart;
import org.apache.commons.httpclient.methods.multipart.MultipartRequestEntity;
import org.apache.commons.httpclient.methods.multipart.Part;
import org.apache.commons.httpclient.methods.multipart.StringPart;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpEntity;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.python.util.PythonInterpreter;

@WebServlet(name = "eventSelector")
//Requests are expected to be made as: multipart/form-data MME type
public class EventSelector extends HttpServlet {
    private static final String path = "/Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/web/template/csvFiles/";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Retrieving selection of event on that particular month in the form
        ArrayList<String> selection = new ArrayList<String>();

        selection.add(request.getParameter("january"));
        selection.add(request.getParameter("february"));
        selection.add(request.getParameter("march"));
        selection.add(request.getParameter("april"));
        selection.add(request.getParameter("may"));
        selection.add(request.getParameter("june"));
        selection.add(request.getParameter("july"));
        selection.add(request.getParameter("august"));
        selection.add(request.getParameter("september"));
        selection.add(request.getParameter("october"));
        selection.add(request.getParameter("november"));
        selection.add(request.getParameter("december"));

        //Name of csv of the whole TimeMap
        String originalCsvName = "history.csv";

        //Reading from CsvFile
        Reader reader = Files.newBufferedReader(Paths.get(path + originalCsvName));
        CSVReader originalCsvReader = new CSVReaderBuilder(reader).withSkipLines(1).build();

        //List of arrays which each entry based on the row ID
        List<String[]> records = originalCsvReader.readAll();

        //List of arrays having each column of a row, basically all the entries corresponding to each column just on that particular row
        ArrayList<String[]> selectedRecords = new ArrayList<String[]>();

        for (int i = 0; i < selection.size(); i++) {
            Integer rowNumber = Integer.parseInt(selection.get(i));
            selectedRecords.add(records.get(rowNumber));
        }

        //Writing to a new csvFile, only the events from the form selections
        File file = new File("/Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/web/template/generatedCsv/historyGenerated.csv");
        FileWriter outputfile = new FileWriter(file);
        CSVWriter csvWriter = new CSVWriter(outputfile);

        String[] columnNames = {"Title", "Start", "Description", "Place", "Location", "Media", "Source URL"};
        csvWriter.writeNext(columnNames);

        csvWriter.writeAll(selectedRecords);
        csvWriter.close();

        //A python script for generating the calendar as a .pdf will be run
        String pythonOutput = null;

//        String scriptPath = "python /Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/java/corpus/CalendarGenerator/callirhoe/callirhoe.py /Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/java/corpus/CalendarGenerator/callirhoe/Events/test.csv";
//        String pythonpath = "/usr/bin/python2.7"
//        File pdfFile = doPostRequestToPythonServer(csv);
//        Process p = Runtime.getRuntime().exec( "python /Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/java/corpus/CalendarGenerator/callirhoe/creator.py /Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/java/corpus/CalendarGenerator/callirhoe/Events/test.csv");
//        if (p.isAlive())
//        {
//            Process pTwo = Runtime.getRuntime().exec("python calmagick '/Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/java/corpus/CalendarGenerator/callirhoe/Resources/background.jpg' --range=1:12/2018 --outdir=expore -j 2 --with-holidays=/Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/java/corpus/CalendarGenerator/callirhoe/holidays");
//
//        }
//        BufferedReader stdInput = new BufferedReader(new InputStreamReader(p.getInputStream()));

//        //The command will have an output, it will be written here
//        System.out.println("Output of the python script:\n");
//        while ((pythonOutput = stdInput.readLine()) != null) {
//            System.out.println(pythonOutput);
//        }

//        System.out.println(System.getProperty("user.dir"));

        //Generates a pdf from the form
//        sendPythonRequest();

        sendCsvRequest("http://127.0.0.1:5000/generate",  "auth",  "/Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/web/template/generatedCsv/test.csv",  "success", request, response);
//        File pdfFile = doPostRequestToPythonServer(csv);

//        generatePdf(request, response);


    }


    public void sendCsvRequest(String url, String authData, String attachmentFilePath, String outputFilePathName, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String charset = "UTF-8";
        File binaryFile = new File(attachmentFilePath);
        String boundary = "------------------------" + Long.toHexString(System.currentTimeMillis()); // Just generate some unique random value.
        String CRLF = "\r\n"; // Line separator required by multipart/form-data.
        int responseCode = 0;

        try {
            //Set POST general headers along with the boundary string (the seperator string of each part)
            URLConnection connection = new URL(url).openConnection();
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
            connection.addRequestProperty("User-Agent", "CheckpaySrv/1.0.0");
            connection.addRequestProperty("Accept", "*/*");
            connection.addRequestProperty("Authentication", authData);

            OutputStream output = connection.getOutputStream();
            PrintWriter writer = new PrintWriter(new OutputStreamWriter(output, charset), true);

            // Send binary file - part
            // Part header
            writer.append("--" + boundary).append(CRLF);
            writer.append("Content-Disposition: form-data; name=\"file\"; filename=\"" + binaryFile.getName() + "\"").append(CRLF);
            writer.append("Content-Type: application/octet-stream").append(CRLF);// + URLConnection.guessContentTypeFromName(binaryFile.getName())).append(CRLF);
            writer.append(CRLF).flush();

            // File data
            Files.copy(binaryFile.toPath(), output);
            output.flush();

            // End of multipart/form-data.
            writer.append(CRLF).append("--" + boundary + "--").flush();

            responseCode = ((HttpURLConnection) connection).getResponseCode();

            if (responseCode != 200) //We operate only on HTTP code 200
                return;
            InputStream Instream = ((HttpURLConnection) connection).getInputStream();

            // Write csv file
            BufferedInputStream BISin = new BufferedInputStream(Instream);
            FileOutputStream FOSfile = new FileOutputStream(outputFilePathName);
            BufferedOutputStream out = new BufferedOutputStream(FOSfile);

            int i;
            while ((i = BISin.read()) != -1) {
                out.write(i);
            }

            ((HttpURLConnection) connection).setRequestMethod("POST");

//            // Writing the post data to the HTTP request body
//            BufferedWriter httpRequestBodyWriter = new BufferedWriter(new OutputStreamWriter(connection.getOutputStream()));
//            httpRequestBodyWriter.write("visitorName=Johnny+Jacobs&luckyNumber=1234");
//            httpRequestBodyWriter.close();

            // Get a readable channel from url connection
            ReadableByteChannel readableChannelForHttpResponseBody = Channels.newChannel(connection.getInputStream());

            // Create the file channel to save file
            FileOutputStream fosForDownloadedFile = new FileOutputStream("calendar.pdf");
            FileChannel fileChannelForDownloadedFile = fosForDownloadedFile.getChannel();

            // Save the contents of HTTP response to local file
            fileChannelForDownloadedFile.transferFrom(readableChannelForHttpResponseBody, 0, Long.MAX_VALUE);

//



            // Cleanup
            out.flush();
            out.close();


        } catch (Exception e) {
            e.printStackTrace();
        }

//        File downloadFile = new File("/Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/web/template/generatedCsv/test.csv");
////        String relativePath = downloadFile.getCanonicalPath();
//
////        System.out.println(relativePath);
//
////        File passDownloadFile = new File(relativePath);
//        FileInputStream in = new FileInputStream(downloadFile);
//
//        response.setContentType("application/octet-stream");
//        response.setContentLength((int) downloadFile.length());
//
//        // Set file to be returned as the pdf to the user - download
//        String key = "Content-Disposition";
//        String value = String.format("attachment; filename=\"%s\"", downloadFile.getName());
//
//        response.setHeader(key, value);
//
//        //Returning the stream from the response - actually receiving the file
//        OutputStream outFile = response.getOutputStream();
//
//        byte[] buffer = new byte[4096];
//        int bytes = -1;
//
//        while ((bytes = in.read(buffer)) != -1)
//        {
//            outFile.write(buffer, 0, bytes);
//        }



    }

    private void generatePdf(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
    {

//       String path = "/../../template/pdfFiles/FirstCalendar (1).pdf";
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


