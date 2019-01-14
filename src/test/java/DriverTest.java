
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverTest {

	public static void main(String args[]) {
		Connection conn;

		try {

			Class.forName("org.mariadb.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(
					"jdbc:mariadb://127.0.0.1:3306/hellomind", "hellomind", "1111");
			System.out.println("Success!");

		} catch (SQLException ex) {
			System.out.println("SQLException:" + ex);

		} catch (Exception e) {
			System.out.println("Exception:" + e);

		}
	}
}
