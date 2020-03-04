import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import com.opencsv.CSVWriter;
import corpus.Article;
import corpus.CsvReader;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

//        System.out.println(System.getProperty("user.dir"));
        //Generates a pdf from the form
        generatePdf(request, response);

        //A python script for generating the calendar as a .pdf will be run
//        String pythonOutput = null;
//
////        String scriptPath = "python /Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/java/corpus/CalendarGeneratorPython/callirhoe/creator.py /Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/java/corpus/CalendarGeneratorPython/callirhoe/Events/events.csv"
////        String pythonpath = "/usr/bin/python2.7"
//
//        Process p = Runtime.getRuntime().exec( "python /Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/java/corpus/hello.py");
//        BufferedReader stdInput = new BufferedReader(new InputStreamReader(p.getInputStream()));
//
//        //The command will have an output, it will be read here
//        System.out.println("Output of the python script:\n");
//        while ((pythonOutput = stdInput.readLine()) != null) {
//            System.out.println(pythonOutput);
//        }
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


