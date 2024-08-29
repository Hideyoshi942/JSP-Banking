package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.beneficiaries;
import model.transactions;

public class transactionsDAO implements DAOInterface<transactions> {

  @Override
  public ArrayList<transactions> selectAll() {
    ArrayList<transactions> transactionsList = new ArrayList<>();
    try {
      // Mở kết nối đến cơ sở dữ liệu
      Connection con = JDBCUtil.getConnection();

      // Chuẩn bị câu lệnh SQL để lấy tất cả các giao dịch
      String sql = "SELECT * FROM transactions";
      PreparedStatement st = con.prepareStatement(sql);

      // Thực thi câu lệnh SQL
      ResultSet rs = st.executeQuery();

      // Duyệt qua các kết quả và tạo danh sách các đối tượng transactions
      while (rs.next()) {
        Integer transaction_id = rs.getInt("transaction_id");
        Integer account_id = rs.getInt("account_id");
        String transaction_type = rs.getString("transaction_type");
        String amount = rs.getString("amount");
        String transaction_date = rs.getString("transaction_date");
        Integer beneficiary_id = rs.getInt("beneficiary_id");
        boolean state = rs.getBoolean("state");

        // Tạo đối tượng transactions và thêm vào danh sách
        transactions tran = new transactions(transaction_id, account_id, transaction_type, amount, transaction_date, beneficiary_id, state);
        transactionsList.add(tran);
      }

      // Đóng kết nối cơ sở dữ liệu
      JDBCUtil.closeConnection(con);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return transactionsList;
  }

  @Override
  public transactions selectById(transactions transactions) {
    return null;
  }

  @Override
  public int insert(transactions transactions) {
    int kq = 0;
    try {
      Connection con = JDBCUtil.getConnection();
      String sql = "Insert into transactions(transaction_id, account_id, transaction_type, amount, transaction_date, beneficiary_id, state) values(?,?,?,?,?,?,?)";
      PreparedStatement st = con.prepareStatement(sql);
      st.setInt(1, transactions.getTransaction_id());
      st.setInt(2, transactions.getAccount_id());
      st.setString(3, transactions.getTransaction_type());
      st.setString(4, transactions.getAmount());
      st.setString(5, transactions.getTransaction_date());
      st.setInt(6, transactions.getBeneficiary_id());
      st.setBoolean(7, transactions.isState());
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
  public int insertAll(ArrayList<transactions> t) {
    return 0;
  }

  @Override
  public int update(transactions transactions) {
    return 0;
  }

  @Override
  public int delete(transactions transactions) {
    return 0;
  }

  @Override
  public int deleteAll(ArrayList<transactions> t) {
    return 0;
  }

  public ArrayList<transactions> getAccountByUserId(String userId) {
    ArrayList<transactions> kq = new ArrayList<>();;
    try {
      Connection con = JDBCUtil.getConnection();
      String sql = "SELECT * FROM transactions WHERE account_id = ?";
      PreparedStatement st = con.prepareStatement(sql);
      st.setString(1, userId);
      System.out.println(sql);
      ResultSet rs = st.executeQuery();
      while (rs.next()) {
        Integer transaction_id = rs.getInt("transaction_id");
        Integer account_id = rs.getInt("account_id");
        String transaction_type = rs.getString("transaction_type");
        String amount = rs.getString("amount");
        String transaction_date = rs.getString("transaction_date");
        Integer beneficiary_id = rs.getInt("beneficiary_id");
        boolean state = rs.getBoolean("state");
        transactions tr = new transactions(transaction_id, account_id, transaction_type, amount, transaction_date, beneficiary_id, state);
        kq.add(tr);
      }
      JDBCUtil.closeConnection(con);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return kq;
  }


}
