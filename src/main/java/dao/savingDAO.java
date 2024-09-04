package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.account;
import model.loans;
import model.saving;

public class savingDAO implements DAOInterface<saving> {

  @Override
  public ArrayList<saving> selectAll() {
    return null;
  }

  @Override
  public saving selectById(saving saving) {
    return null;
  }

  @Override
  public int insert(saving saving) {
    int kq = 0;
    try {
      Connection con = JDBCUtil.getConnection();
      String sql = "Insert into saving_accounts(saving_id, saving_user_id, saving_account_id, saving_number, account_type, balance, create_at, interest_rate, time_saving, state) values(?,?,?,?,?,?,?,?,?,?)";
      PreparedStatement st = con.prepareStatement(sql);
      st.setInt(1, saving.getSaving_id());
      st.setInt(2, saving.getUser_id_account());
      st.setInt(3, saving.getAccount_id());
      st.setString(4, saving.getAccount_number());
      st.setString(5, saving.getAccount_type());
      st.setString(6, saving.getBalance());
      st.setString(7, saving.getCreated_at());
      st.setDouble(8, saving.getInterest_rate());
      st.setString(9, saving.getTime_saving());
      st.setBoolean(10, saving.isState());
      kq = st.executeUpdate();
      System.out.println("Bạn đã thực thi: " + sql);
      System.out.println("Có " + kq + " dòng bị thay đổi!");
      con.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
    return kq;
  }

  @Override
  public int insertAll(ArrayList<saving> t) {
    return 0;
  }

  @Override
  public int update(saving saving) {
    return 0;
  }

  @Override
  public int delete(saving saving) {
    return 0;
  }

  @Override
  public int deleteAll(ArrayList<saving> t) {
    return 0;
  }

  public saving getSavingAccountByUserId(String userId) {
    saving kq = null;
    try {
      Connection con = JDBCUtil.getConnection();
      String sql = "SELECT * FROM saving_accounts WHERE saving_account_id = ?";
      PreparedStatement st = con.prepareStatement(sql);
      st.setString(1, userId);
      System.out.println(sql);
      ResultSet rs = st.executeQuery();
      while (rs.next()) {
        Integer saving_id = rs.getInt("saving_id");
        Integer saving_user_id = rs.getInt("saving_user_id");
        Integer saving_account_id = rs.getInt("saving_account_id");

        String saving_number = rs.getString("saving_number");
        String account_type = rs.getString("account_type");
        String balance = rs.getString("balance");
        String create_at = rs.getString("create_at");
        double interest_rate = rs.getDouble("interest_rate");
        String time_saving = rs.getString("time_saving");
        boolean state = rs.getBoolean("state");
        kq = new saving(saving_id, saving_user_id, saving_account_id, saving_number, account_type, balance, create_at, interest_rate, time_saving, state);
      }
      JDBCUtil.closeConnection(con);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return kq;
  }

  public ArrayList<saving> selectByUserId(String userId) {
    ArrayList<saving> savingList = new ArrayList<>();
    try {
      // Mở kết nối đến cơ sở dữ liệu
      Connection con = JDBCUtil.getConnection();

      // Chuẩn bị câu lệnh SQL để lấy tất cả các giao dịch
      String sql = "SELECT * FROM saving_accounts where saving_account_id = ?";
      PreparedStatement st = con.prepareStatement(sql);
      st.setString(1, userId);
      // Thực thi câu lệnh SQL
      ResultSet rs = st.executeQuery();

      // Duyệt qua các kết quả và tạo danh sách các đối tượng transactions
      while (rs.next()) {
        Integer saving_id = rs.getInt("saving_id");
        Integer saving_user_id = rs.getInt("saving_user_id");
        Integer saving_account_id = rs.getInt("saving_account_id");

        String saving_number = rs.getString("saving_number");
        String account_type = rs.getString("account_type");
        String balance = rs.getString("balance");
        String create_at = rs.getString("create_at");
        double interest_rate = rs.getDouble("interest_rate");
        String time_saving = rs.getString("time_saving");
        boolean state = rs.getBoolean("state");
        saving sv = new saving(saving_id, saving_user_id, saving_account_id, saving_number, account_type, balance, create_at, interest_rate, time_saving, state);

        savingList.add(sv);
      }

      // Đóng kết nối cơ sở dữ liệu
      JDBCUtil.closeConnection(con);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return savingList;
  }
}


