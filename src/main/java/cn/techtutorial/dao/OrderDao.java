package cn.techtutorial.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.techtutorial.model.Order; // Order model class එක import කරන්න

public class OrderDao {
    private Connection con; // Database Connection එක ගබඩා කිරීමට

    private String query; // SQL queries ගබඩා කිරීමට
    private PreparedStatement pst; // SQL statements execute කිරීමට
    private ResultSet rs;
    // Constructor: Database Connection එකක් parameter එකක් ලෙස ලබා ගනී
    public OrderDao(Connection con) {
        this.con = con;
    }

    // Order එකක් database එකට ඇතුළත් කිරීමේ method එක
    public boolean insertOrder(Order model) {
        boolean result = false; // ක්‍රියාවලිය සාර්ථකද අසාර්ථකද යන්න දැක්වීමට
        try {
            // SQL INSERT query එක.
            // product_id යනු Order class එකේ getId() මඟින් ලැබෙන අගය යැයි උපකල්පනය කරයි.
            // order_id සාමාන්‍යයෙන් auto-increment වන නිසා query එකට ඇතුළත් නොවේ.
            query = "INSERT INTO orders (0_id,p_id,u_id,o_quantity,o_date) VALUES (?,?,?,?)";
            
            pst = this.con.prepareStatement(query);
            pst.setInt(1, model.getId()); // Product ID එක (Order model එකේ getId() මඟින්)
            pst.setInt(2, model.getUid()); // User ID එක
            pst.setInt(3, model.getQuantity()); // Quantity එක
            pst.setString(4, model.getDate()); // Date (String format එකෙන්)

            int rowCount = pst.executeUpdate(); // Query එක execute කර, බලපෑ rows ගණන ලබා ගනී

            if (rowCount > 0) {
                result = true; // සාර්ථක නම් true කරන්න
            }

        } catch (SQLException e) {
            e.printStackTrace(); // දෝෂයක් ඇති වුවහොත් console එකේ print කරන්න
            System.out.println(e.getMessage()); // දෝෂ පණිවිඩය print කරන්න
        } finally {
            // Resources වසා දැමීම
            try {
                if (pst != null) pst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return result; // ප්‍රතිඵලය ආපසු ලබා දෙයි
    }
}