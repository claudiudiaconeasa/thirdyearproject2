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

    public static HashMap<Integer, ArrayList<Article>> getArticles(String fileName) throws IOException {
        String filePath = path + fileName;

        // The keys of the HashMap will be integers from 1 to 12, representing the number of each month
        HashMap<Integer, ArrayList<Article>> articles = new HashMap<Integer, ArrayList<Article>>();

        //Reading from the history.csv TimeMap
        Reader reader = Files.newBufferedReader(Paths.get(filePath));
        CSVReader csvReader = new CSVReaderBuilder(reader).withSkipLines(1).build();

        String[] record;

        int rowCounter = 0;

        while ((record = csvReader.readNext()) != null)
        {
            //record[1] is the second column with our date
            String date = record[1];

            //Splitting the date to add on the select form based on "/"
            String[] dateParameters = date.split("/");

            //Column has an entry of String, it will be casted to int
            Integer month = Integer.parseInt(dateParameters[1]);

            if (articles.containsKey(month))
            {
                //Adding article to the articles Hashmap where the key is the month for each arraylist
                Article newArticle = new Article(Integer.toString(rowCounter), record[0]);
                articles.get(month).add(newArticle);
            }

            else
            {
                //Same as previous if statement, just that we have a new array list that needs to be added to the new key
                ArrayList<Article> newMonth = new ArrayList<Article>();
                Article newArticle = new Article(Integer.toString(rowCounter), record[0]);
                newMonth.add(newArticle);
                articles.put(month, newMonth);
            }

            //Going through each row
            rowCounter++;
        }

        return articles;
    }
}
