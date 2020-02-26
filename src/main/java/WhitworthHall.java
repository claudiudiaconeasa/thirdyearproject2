import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//Redirect to article about Whitworth Hall
@WebServlet(name = "WhitworthHall")
public class WhitworthHall extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.getRequestDispatcher("/whitworthhall.jsp").forward(request,response);}
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
