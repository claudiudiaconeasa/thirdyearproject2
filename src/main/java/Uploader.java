
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.fasterxml.jackson.databind.MappingIterator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.csv.CsvMapper;
import com.fasterxml.jackson.dataformat.csv.CsvSchema;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils;

@WebServlet(name = "Uploader")
//Requests are expected to be made as: multipart/form-data MME type
@MultipartConfig
public class Uploader extends HttpServlet
{
//    //Will retrieve the name of the file from the file part
//    private String getFile(final Part part) {
//        for (String content : part.getHeader("content-disposition").split(";"))
//        {
//            if (content.trim().startsWith("name"))
//            {
//                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
//            }
//        }
//        return null;
//    }

    //Retrieves the destination and filepart
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        response.setContentType("text/html;charset=UTF-8");
        int read = 0;

        //Generate uuid for the name of the csv file
        UUID id = UUID.randomUUID();
        String randomId = id.toString() + ".csv";

        //Remove .csv extension in the name and add +.json
        String randomIdJson = id + ".json";

        // Create path components to save the file
        final Part filePart = request.getPart("file");

//  final String name = getFile(filePart);

        final PrintWriter writer = response.getWriter();

        final String path = "/Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/web/template/uploadedFile";

        OutputStream out = null;
        InputStream filecontent = null;

        //File copied to the final destination
        out = new FileOutputStream(new File(path + File.separator + randomId));
        filecontent = filePart.getInputStream();

        final byte[] bytes = new byte[1024];

        while ((read = filecontent.read(bytes)) != -1)
        {
            out.write(bytes, 0, read);
        }

        //Convert Csv to Json
        csvToJson(randomId,randomIdJson);

//        writer.println("New file " + name + " created at " + path);
        //Going to the download button
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/download.jsp");
        dispatcher.forward(request, response);

    }

    public void csvToJson(String fileCsv, String fileJson) throws IOException
    {

        String path = "/Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/web/template/uploadedFile/";
        String filePathCsv = path + fileCsv;

        File csvFile = new File(filePathCsv);

        String pathJson = "/Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/web/template/generatedJson/";
        String filePathJson = pathJson + fileJson;

        File jsonFormat = new File(filePathJson);


        //Read from csv and store into a list
        List<Map<?, ?>> content = readObjectsFromCsv(csvFile);

        //Convert to Json
        writeAsJson(content, jsonFormat);

    }

    public static void writeAsJson(List<Map<?, ?>> content, File file) throws IOException
    {
        ObjectMapper map = new ObjectMapper();

        map.writeValue(file, content);
    }

    public static List<Map<?, ?>> readObjectsFromCsv(File file) throws IOException
    {
        CsvSchema csvSchema = CsvSchema.emptySchema().withHeader();

        CsvMapper csvMapper = new CsvMapper();

        MappingIterator<Map<?, ?>> map = csvMapper.reader(Map.class).with(csvSchema).readValues(file);

        return map.readAll();
    }

    }



