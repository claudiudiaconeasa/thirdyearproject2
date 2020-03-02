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
    private static final String path = "/Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/web/template/csvFiles/";

    public static HashMap<Integer, ArrayList<HashMap<String, String>>> getArticles(String fileName) throws IOException {
        String filePath = path + fileName;

        // The keys of the HashMap will be integers from 1 to 12, representing the number of each month
        HashMap<Integer, ArrayList<HashMap<String, String>>> articles = new HashMap<Integer, ArrayList<HashMap<String, String>>>();

        Reader reader = Files.newBufferedReader(Paths.get(filePath));
        CSVReader csvReader = new CSVReaderBuilder(reader).withSkipLines(1).build();

        String[] record;

        int rowCounter = 0;

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
                HashMap<String, String> newArticle = new HashMap<String, String>();
                newArticle.put("id", Integer.toString(rowCounter));
                newArticle.put("title", record[0]);
                articles.get(month).add(newArticle);
            }
            else
            {
                ArrayList<HashMap<String, String>> newMonth = new ArrayList<HashMap<String, String>>();
                HashMap<String, String> newArticle = new HashMap<String, String>();
                newArticle.put("id", Integer.toString(rowCounter));
                newArticle.put("title", record[0]);
                newMonth.add(newArticle);
                articles.put(month, newMonth);
            }

            rowCounter++;
        }

        System.out.println(articles.get(1).size());

        return articles;
    }
}
