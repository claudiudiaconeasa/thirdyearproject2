import com.fasterxml.jackson.databind.ObjectMapper;
import com.opencsv.CSVReader;
import corpus.CsvReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.UUID;

@WebServlet(name = "DownloadExample")
//Requests are expected to be made as: multipart/form-data MME type
@MultipartConfig
public class DownloadExample extends HttpServlet
{

    //Retrieves the destination and filepart
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        generatePdf(request, response);
    }

    private void generatePdf(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
    {

        String path = "./src/main/web/template/exampleCsv/PlainExample.csv";

        File downloadFile = new File(path);
        FileInputStream in = new FileInputStream(downloadFile);

        response.setContentType("application/octet-stream");
        response.setContentLength((int) downloadFile.length());

        // Set file to be returned as the pdf to the user - download
        String key = "Content-Disposition";
        String value = String.format("attachment; filename=\"%s\"", downloadFile.getName());

        response.setHeader(key, value);

        //Returning the stream from the response - actually receiving the file
        OutputStream download = response.getOutputStream();

        byte[] buffer = new byte[4096];
        int bytes = -1;

        while ((bytes = in.read(buffer)) != -1)
        {
            download.write(buffer, 0, bytes);
        }
    }
}



