import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import com.opencsv.CSVWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.lang.reflect.Array;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
/* Servlet to write the form selections into a new csv file which will be passed
   to the server in order to generate a pdf
 */
@WebServlet(name = "eventSelector")
public class EventSelector extends HttpServlet {
    private static final String path = "./src/main/web/template/csvFiles/";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

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
            String[] record = records.get(rowNumber);
            String[] recordWithEventId = new String[]{record[0], record[1], record[2], record[3], record[4], record[5], record[6], Integer.toString(rowNumber), "1"};
            selectedRecords.add(recordWithEventId);
        }

        //Writing to a new csvFile, only the events from the form selections
        File file = new File("./src/main/web/template/generatedCsv/historyGenerated.csv");
        FileWriter outputfile = new FileWriter(file);
        CSVWriter csvWriter = new CSVWriter(outputfile);

        String[] columnNames = {"Title", "Date", "Description", "Place", "Location", "Media", "Source URL", "EventId", "CalendarId"};
        //Writes the first row without quotations (header) to match the .py script format
        csvWriter.writeNext(columnNames,false);

        //Writes all records using quotations
        csvWriter.writeAll(selectedRecords);

        csvWriter.close();

        //Request to generate the pdf
        PdfManager.sendCsvRequest("http://165.22.125.196:1337/generate","./src/main/web/template/generatedCsv/historyGenerated.csv",
                       "success", request, response);
    }

}


