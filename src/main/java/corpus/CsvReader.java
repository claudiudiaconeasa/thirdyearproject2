package corpus;

import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;

import java.io.IOException;
import java.io.Reader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;


/* Data is read from a CSV file in order to extract the exact information to be placed into a form*/

public class CsvReader
{
    private static final String csvPath = "./src/main/web/template/csvFiles/";
    private static final String uploadedCsvPath = "./src/main/web/template/uploadedTimeLineCsv/";

    //Reading from our TimeMap formated CSV file
    public static CSVReader getReader(String fileName, boolean uploaded) throws IOException
    {
        String filePath;

        //Check to see if the path is for our pre-existing examples or we're going to use the user's uploaded format in order to generate their own TimeLine
        if(uploaded)
        {
            filePath = uploadedCsvPath + fileName;
        } else {
            filePath = csvPath + fileName;
        }

        //Reading from the CSV file itself
        Reader reader = Files.newBufferedReader(Paths.get(filePath));
        CSVReader csvReader = new CSVReaderBuilder(reader).withSkipLines(1).build();

        return csvReader;
    }


    /* Extracting all the articles based on id,date,title so that we can write them into a new csv based on the selections in the form
    * Each key stands for a particular month in one year
    * HashMap would contain ArrayLists of these events, indexed by the key which knows the month of each List itelf
    */


    public static HashMap<Integer, ArrayList<Article>> getArticlesForForm(CSVReader csvReader) throws IOException
    {
        // The keys of the HashMap will be integers from 1 to 12, representing the number of each month
        HashMap<Integer, ArrayList<Article>> articles = new HashMap<Integer, ArrayList<Article>>();

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
                Article newArticle = new Article(Integer.toString(rowCounter), record[0], record[1]);
                articles.get(month).add(newArticle);
            }

            else
            {
                //Same as previous if statement, just that we have a new array list that needs to be added to the new key
                ArrayList<Article> newMonth = new ArrayList<Article>();
                Article newArticle = new Article(Integer.toString(rowCounter), record[0], record[1]);
                newMonth.add(newArticle);
                articles.put(month, newMonth);
            }

            //Going through each row
            rowCounter++;
        }

        return articles;
    }
}
