
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.*;

import com.fasterxml.jackson.databind.MappingIterator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.csv.CsvMapper;
import com.fasterxml.jackson.dataformat.csv.CsvSchema;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.opencsv.CSVReader;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils;
import corpus.Article;
import corpus.CsvReader;
import org.json.JSONObject;

@WebServlet(name = "Uploader")
//Requests are expected to be made as: multipart/form-data MME type
@MultipartConfig
public class Uploader extends HttpServlet
{
    public String generateCsvId()
    {
        UUID id = UUID.randomUUID();
        String randomId = id.toString() + ".csv";

        return randomId;
    }

    public String generateJsonId()
    {
        String csvId = generateCsvId();

        String jsonId = csvId.substring(0, csvId.length() - 4) + ".json";

        return jsonId;
    }

    //Retrieves the destination and filepart
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        int read = 0;

        String id = UUID.randomUUID().toString();

        String csvId = id + ".csv";
        String jsonId = id + ".json";

        // Create path components to save the file
        final Part filePart = request.getPart("file");

        final PrintWriter writer = response.getWriter();

        final String path = "../../thirdyearproject/src/main/web/template/uploadedTimeLineCsv";

        OutputStream out = null;
        InputStream filecontent = null;

        //File copied to the final destination
        out = new FileOutputStream(new File(path + File.separator + csvId));
        filecontent = filePart.getInputStream();

        final byte[] bytes = new byte[1024];

        while ((read = filecontent.read(bytes)) != -1)
        {
            out.write(bytes, 0, read);
        }

        //Convert Csv to Json
        csvToJson(csvId, jsonId);


        //Going to the download button
        response.sendRedirect("/thirdyearproject_war_exploded/preview/" + id);

    }

    public void csvToJson(String fileCsv, String fileJson) throws IOException
    {
        CSVReader reader =  CsvReader.getReader(fileCsv, true);

        HashMap<String, Collection> events = new HashMap<>();
        Collection listOfEvents = new ArrayList<>();

        String[] record;

        while((record = reader.readNext()) != null) {
            HashMap<String, Object> event = new HashMap<>();

            HashMap<String, String> startDate = new HashMap<>();
            String[] dateAttributes = record[1].split("/");
            startDate.put("year", dateAttributes[2]);
            startDate.put("month", dateAttributes[1]);
            startDate.put("day", dateAttributes[0]);

            HashMap<String, String> text = new HashMap<>();
            text.put("headline", record[0]);
            text.put("text", record[2]);

            HashMap<String, String> media = new HashMap<>();
            media.put("url", record[5]);

            event.put("start_date", startDate);
            event.put("text", text);
            event.put("media", media);

            listOfEvents.add(event);
        }

        events.put("events", listOfEvents);

        String pathJson = "../../thirdyearproject/src/main/web/template/generatedTimeLineJson/";
        String filePathJson = pathJson + fileJson;

        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(new File(filePathJson), events);
    }
}



