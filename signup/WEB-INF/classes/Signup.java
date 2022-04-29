import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Signup extends HttpServlet{
    Connection conn = null;
    public void init() throws ServletException {
        try{
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/gpay3", "postgres", "PostgreSQLpanda1*");
        }catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
        try {
            
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            //writing data into database
            Statement stmt = conn.createStatement();
            String user_name = request.getParameter("usr_name");
            String user_gmail = request.getParameter("usr_gmail");
            String user_phone = request.getParameter("usr_phone");
            int user_pin = Integer.parseInt(request.getParameter("usr_pin"));
            //String encrpyt_pin = encryption_pin(Integer.toString(user_pin));
            //insert new user to DB
            stmt.executeUpdate("insert into users(u_name,u_gmail,u_phoneno,u_pin) values('"+user_name+"','"+user_gmail+"','"+user_phone+"','"+user_pin+"')");
            stmt.executeUpdate("insert into user_roles(u_gmail,role_name) values('"+user_gmail+"','GPAY_USER')");
            String query1 = "select * from public.users;";
            ResultSet rs_check = stmt.executeQuery(query1);
            int id=0;
            int decrypted_pin=0;
            boolean flag=false;
            while(rs_check.next()){
                //decrypted_pin = Integer.parseInt(decryption_pin(rs_check.getString("u_pin")));
                if ((rs_check.getString("u_gmail").equals(user_gmail)) && (Integer.parseInt(rs_check.getString("u_pin")) == user_pin)){
                    id = Integer.parseInt(rs_check.getString("u_id"));
                    flag=true;
                    break;
                }
            }
            HttpSession session = request.getSession();
            if(!flag){
                request.setAttribute("alert_msg", "Your are not able create account!!!");
                RequestDispatcher rd = request.getRequestDispatcher("http://localhost:8080/signup/signup.jsp");
                rd.forward(request, response);
            }
            session.setAttribute("userId",Integer.toString(id));
            response.sendRedirect("http://localhost:8080/index.jsp");
            
            stmt.close();
            out.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    public String encryption_pin(String pin) {
        Base64.Encoder encoder = Base64.getEncoder();
        return encoder.encodeToString(pin.getBytes());
    }
    public String decryption_pin(String encoded_string) {
        Base64.Decoder decoder = Base64.getDecoder();
        byte[] bytes = decoder.decode(encoded_string);
        return (new String(bytes));
    }
}
