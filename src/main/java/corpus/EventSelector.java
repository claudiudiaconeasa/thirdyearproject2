import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import com.opencsv.CSVWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
        String originalCsvName = "historyCorpus.csv";

        //Reading from CsvFile
        Reader reader = Files.newBufferedReader(Paths.get(path + originalCsvName));
        CSVReader originalCsvReader = new CSVReaderBuilder(reader).withSkipLines(1).build();

        //List of arrays which each entry based on the row ID
        List<String[]> records = originalCsvReader.readAll();

        //List of arrays having each column of a row, basically all the entries corresponding to each column just on that particular row
        ArrayList<String[]> selectedRecords = new ArrayList<String[]>();

        for (int i = 0; i < selection.size(); i++)
        {
            Integer rowNumber = Integer.parseInt(selection.get(i));
            selectedRecords.add(records.get(rowNumber));
        }

        //Writing to a new csvFile, only the events from the form selections
        File file = new File("/Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/web/template/generatedCsv/historyGenerated.csv");
        FileWriter outputfile = new FileWriter(file);
        CSVWriter csvWriter = new CSVWriter(outputfile);

        String[] columnNames = {"Title", "Date", "Description", "Place", "Location", "Media", "Source URL"};
        //Writes the first row without quotations (header) to match the .py script format
        csvWriter.writeNext(columnNames,false);

        //Writes all records using quotations
        csvWriter.writeAll(selectedRecords);

        csvWriter.close();

        sendCsvRequest("http://127.0.0.1:5000/generate","/Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/web/template/generatedCsv/historyGenerated.csv",
                       "success", request, response);
    }


    public void sendCsvRequest(String url, String attachmentFilePath, String outputFilePathName, HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        File file = new File(attachmentFilePath);

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
            FileOutputStream fileOut = new FileOutputStream(outputFilePathName);

            //Stream to write byte by byte
            BufferedOutputStream finalOut = new BufferedOutputStream(fileOut);

            response.setContentType("application/octet-stream");
            int i;
            while ((i = bufferInput.read()) != -1)
            {
                finalOut.write(i);
                //Downloading the file
                response.getOutputStream().write(i);
            }

    }

}


