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
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "eventSelectorComputing")
//Requests are expected to be made as: multipart/form-data MME type
public class EventSelectorComputing extends HttpServlet {
    private static final String path = "./src/main/web/template/csvFiles/";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Retrieving selection of event on that particular month in the form
        ArrayList<String> selection = new ArrayList<String>();

        selection.add(request.getParameter("januaryComputing"));
        selection.add(request.getParameter("februaryComputing"));
        selection.add(request.getParameter("marchComputing"));
        selection.add(request.getParameter("aprilComputing"));
        selection.add(request.getParameter("mayComputing"));
        selection.add(request.getParameter("juneComputing"));
        selection.add(request.getParameter("julyComputing"));
        selection.add(request.getParameter("augustComputing"));
        selection.add(request.getParameter("septemberComputing"));
        selection.add(request.getParameter("octoberComputing"));
        selection.add(request.getParameter("novemberComputing"));
        selection.add(request.getParameter("decemberComputing"));

        //Name of csv of the whole TimeMap
        String originalCsvName = "historyComputing.csv";

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
        File file = new File("./src/main/web/template/generatedCsv/historyGeneratedComputing.csv");
        FileWriter outputfile = new FileWriter(file);
        CSVWriter csvWriter = new CSVWriter(outputfile);

        String[] columnNames = {"Title", "Date", "Description", "Place", "Location", "Media", "Source URL"};
        //Writes the first row without quotations (header) to match the .py script format
        csvWriter.writeNext(columnNames,false);

        //Writes all records using quotations
        csvWriter.writeAll(selectedRecords);

        csvWriter.close();

        PdfManager.sendCsvRequest("http://127.0.0.1:5000/generate","./src/main/web/template/generatedCsv/historyGeneratedComputing.csv",
                "success", request, response);
    }

}


