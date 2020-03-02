package corpus;

import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;

import java.io.IOException;
import java.io.Reader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;


public class CsvReader
{
    private static final String path = "/Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/web/template/csvFiles/history.csv";

    public static void main(String[] args) throws IOException {
        // The keys of the HashMap will be integers from 1 to 12, representing the number of each month
        HashMap<Integer, ArrayList<String>> articles = new HashMap<Integer, ArrayList<String>>();

        Reader reader = Files.newBufferedReader(Paths.get(path));
        CSVReader csvReader = new CSVReaderBuilder(reader).withSkipLines(1).build();

        String[] record;

        while ((record = csvReader.readNext()) != null)
        {
            // Here, we extract the date string from the CSV
            String date = record[1];

            // Now we need to get the month from the date string
            String[] dateParameters = date.split("/");

            // The second element on that dateParameters array is the month
            // We want to add it to our articles HashMap
            Integer month = Integer.parseInt(dateParameters[1]);

            if (articles.containsKey(month)) {
                articles.get(month).add(record[0]);
            }
            else
            {
                ArrayList<String> newMonth = new ArrayList<String>();
                newMonth.add(record[0]);
                articles.put(month, newMonth);
            }
        }
        System.out.println(articles);
    }
}
