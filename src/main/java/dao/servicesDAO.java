package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.loans;
import model.services;

public class servicesDAO implements DAOInterface<services> {

  @Override
  public ArrayList<services> selectAll() {
    ArrayList<services> servicesList = new ArrayList<>();
    try {
      // Mở kết nối đến cơ sở dữ liệu
      Connection con = JDBCUtil.getConnection();

      // Chuẩn bị câu lệnh SQL để lấy tất cả các giao dịch
      String sql = "SELECT * FROM services";
      PreparedStatement st = con.prepareStatement(sql);

      // Thực thi câu lệnh SQL
      ResultSet rs = st.executeQuery();

      // Duyệt qua các kết quả và tạo danh sách các đối tượng transactions
      while (rs.next()) {
        Integer service_id = rs.getInt("service_id");
        String service_name = rs.getString("service_name");
        String description = rs.getString("description");
        String fee = rs.getString("fee");

        services sv = new services(service_id, service_name, description, fee);
        servicesList.add(sv);
      }

      // Đóng kết nối cơ sở dữ liệu
      JDBCUtil.closeConnection(con);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return servicesList;
  }

  @Override
  public services selectById(services services) {
    return null;
  }

  @Override
  public int insert(services services) {
    return 0;
  }

  @Override
  public int insertAll(ArrayList<services> t) {
    return 0;
  }

  @Override
  public int update(services services) {
    return 0;
  }

  @Override
  public int delete(services services) {
    return 0;
  }

  @Override
  public int deleteAll(ArrayList<services> t) {
    return 0;
  }
}
