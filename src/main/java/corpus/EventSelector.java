import com.opencsv.CSVWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet(name = "eventSelector")
//Requests are expected to be made as: multipart/form-data MME type
public class EventSelector extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Retrieving selection of event on that particular month in the form
        String january = request.getParameter("january");
        String february = request.getParameter("february");
        String march = request.getParameter("march");
        String april = request.getParameter("april");
        String may = request.getParameter("may");
        String june = request.getParameter("june");
        String july = request.getParameter("july");
        String august = request.getParameter("august");
        String september = request.getParameter("september");
        String october = request.getParameter("october");
        String november = request.getParameter("november");
        String december = request.getParameter("december");

        PrintWriter writer = response.getWriter();

        String htmlResponse = "<html";

        htmlResponse += "<h2> January selected event is: " + january + "<br/>";
        htmlResponse += "<h2> February selected event is: " + february + "<br/>";
        htmlResponse += "<h2> March selected event is: " + march + "<br/>";
        htmlResponse += "<h2> April selected event is: " + april + "<br/>";
        htmlResponse += "<h2> May selected event is: " + may + "<br/>";
        htmlResponse += "<h2> June selected event is: " + june + "<br/>";
        htmlResponse += "<h2> July selected event is: " + july + "<br/>";
        htmlResponse += "<h2> August selected event is: " + august + "<br/>";
        htmlResponse += "<h2> September selected event is: " + september + "<br/>";
        htmlResponse += "<h2> October selected event is: " + october + "<br/>";
        htmlResponse += "<h2> November selected event is: " + november + "<br/>";
        htmlResponse += "<h2> December selected event is: " + december + "<br/>";

        writer.println(htmlResponse);

        File file = new File("/Users/claudiudiaconeasa/Documents/Claudiu/thirdyearproject/src/main/web/template/images/history.csv");

        // create FileWriter object with file as parameter
        FileWriter outputfile = new FileWriter(file);

        // create CSVWriter with ';' as separator
        CSVWriter csvWriter = new CSVWriter(outputfile);

        String [] columns = {"Title", "Date"};
        csvWriter.writeNext(columns);

        String [] title = {january,february};
        csvWriter.writeNext(title);

        String[] date = {"12/05/1995", "17/06/1944"};
        csvWriter.writeNext(date);

        csvWriter.close();
        
    }
}


