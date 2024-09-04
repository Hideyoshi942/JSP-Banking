package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.loans;
import model.transactions;

public class loansDAO implements DAOInterface<loans> {

  @Override
  public ArrayList<loans> selectAll() {
    ArrayList<loans> loansList = new ArrayList<>();
    try {
      // Mở kết nối đến cơ sở dữ liệu
      Connection con = JDBCUtil.getConnection();

      // Chuẩn bị câu lệnh SQL để lấy tất cả các giao dịch
      String sql = "SELECT * FROM loans";
      PreparedStatement st = con.prepareStatement(sql);

      // Thực thi câu lệnh SQL
      ResultSet rs = st.executeQuery();

      // Duyệt qua các kết quả và tạo danh sách các đối tượng transactions
      while (rs.next()) {
        Integer loan_id = rs.getInt("loan_id");
        Integer user_id_loan = rs.getInt("user_id_loan");
        String loan_amount = rs.getString("loan_amount");
        Double interest_rate = rs.getDouble("interest_rate");
        String start_date = rs.getString("start_date");
        String end_date = rs.getString("end_date");

        loans loan = new loans(loan_id, user_id_loan, loan_amount, interest_rate, start_date, end_date);
        loansList.add(loan);
      }

      // Đóng kết nối cơ sở dữ liệu
      JDBCUtil.closeConnection(con);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return loansList;
  }

  @Override
  public loans selectById(loans loans) {
    return null;
  }

  @Override
  public int insert(loans loans) {
    int kq = 0;
    try {
      Connection con = JDBCUtil.getConnection();
      String sql = "Insert into loans(loan_id, user_id_loan, loan_amount, interest_rate, start_date, end_date) values(?,?,?,?,?,?)";
      PreparedStatement st = con.prepareStatement(sql);
      st.setInt(1, loans.getLoan_id());
      st.setInt(2, loans.getUser_id_loan());
      st.setString(3, loans.getLoan_amount());
      st.setDouble(4, loans.getInterest_rate());
      st.setString(5, loans.getStart_date());
      st.setString(6, loans.getEnd_date());
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
  public int insertAll(ArrayList<loans> t) {
    return 0;
  }

  @Override
  public int update(loans loans) {
    return 0;
  }

  @Override
  public int delete(loans loans) {
    int kq = 0;
    try {
      Connection con = JDBCUtil.getConnection();
      String sql = "DELETE FROM loans where loan_id = ?";
      PreparedStatement st = con.prepareStatement(sql);
      st.setInt(1, loans.getLoan_id());
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
  public int deleteAll(ArrayList<loans> t) {
    return 0;
  }

  public ArrayList<loans> selectByUserId(String userId) {
    ArrayList<loans> loansList = new ArrayList<>();
    try {
      // Mở kết nối đến cơ sở dữ liệu
      Connection con = JDBCUtil.getConnection();

      // Chuẩn bị câu lệnh SQL để lấy tất cả các giao dịch
      String sql = "SELECT * FROM loans where user_id_loan = ?";
      PreparedStatement st = con.prepareStatement(sql);
      st.setString(1, userId);
      // Thực thi câu lệnh SQL
      ResultSet rs = st.executeQuery();

      // Duyệt qua các kết quả và tạo danh sách các đối tượng transactions
      while (rs.next()) {
        Integer loan_id = rs.getInt("loan_id");
        Integer user_id_loan = rs.getInt("user_id_loan");
        String loan_amount = rs.getString("loan_amount");
        Double interest_rate = rs.getDouble("interest_rate");
        String start_date = rs.getString("start_date");
        String end_date = rs.getString("end_date");

        loans loan = new loans(loan_id, user_id_loan, loan_amount, interest_rate, start_date, end_date);
        loansList.add(loan);
      }

      // Đóng kết nối cơ sở dữ liệu
      JDBCUtil.closeConnection(con);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return loansList;
  }
}
