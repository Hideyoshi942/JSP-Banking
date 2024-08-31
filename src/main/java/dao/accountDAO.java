package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.account;

public class accountDAO implements DAOInterface<account>{

  @Override
  public ArrayList<account> selectAll() {
    return null;
  }

  @Override
  public account selectById(account account) {
    return null;
  }

  @Override
  public int insert(account account) {
    int kq = 0;
    try {
      Connection con = JDBCUtil.getConnection();
      String sql = "Insert into accounts(account_id, user_id_account, account_number, account_type, balance, created_at, state) values(?,?,?,?,?,?,?)";
      PreparedStatement st = con.prepareStatement(sql);
      st.setInt(1, account.getAccount_id());
      st.setInt(2, account.getUser_id_account());
      st.setString(3, account.getAccount_number());
      st.setString(4, account.getAccount_type());
      st.setString(5, account.getBalance());
      st.setString(6, account.getCreated_at());
      st.setBoolean(7, account.isState());
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
  public int insertAll(ArrayList<account> t) {
    return 0;
  }

  @Override
  public int update(account account) {
    return 0;
  }

  @Override
  public int delete(account account) {
    return 0;
  }

  @Override
  public int deleteAll(ArrayList<account> t) {
    return 0;
  }

  public account getAccountByUserId(String userId) {
    account kq = null;
    try {
      Connection con = JDBCUtil.getConnection();
      String sql = "SELECT * FROM accounts WHERE user_id_account = ?";
      PreparedStatement st = con.prepareStatement(sql);
      st.setString(1, userId);
      System.out.println(sql);
      ResultSet rs = st.executeQuery();
      while (rs.next()) {
        Integer user_id_account = rs.getInt("user_id_account");
        Integer account_id = rs.getInt("account_id");
        String account_number = rs.getString("account_number");
        String account_type = rs.getString("account_type");
        String balance = rs.getString("balance");
        String created_at = rs.getString("created_at");
        boolean state = rs.getBoolean("state");
        kq = new account(account_id, user_id_account, account_number, account_type, balance, created_at, state);
      }
      JDBCUtil.closeConnection(con);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return kq;
  }

  public boolean checkBalance(int accountId, String amount) {
    boolean ketQua = false;
    try {
      Connection con = JDBCUtil.getConnection();
      String sql = "Select balance from accounts where account_id=?";
      PreparedStatement st = con.prepareStatement(sql);
      st.setInt(1, accountId);
      System.out.println(sql);
      ResultSet rs = st.executeQuery();
      if (rs.next()) {
        int balance = Integer.parseInt(rs.getString("balance"));
        if (balance > 0 && balance >= Integer.parseInt(amount)) {
          ketQua = true;
        }
      }
      JDBCUtil.closeConnection(con);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return ketQua;
  }

  public int updateBalanceMinius(String accountId, String amount) {
    int ketQua = 0;
    try {
      Connection con = JDBCUtil.getConnection();
      // Chuyển balance từ string sang số, thực hiện phép trừ, sau đó lại chuyển về string
      String sql = "Update accounts set balance = CAST(CAST(balance AS DECIMAL) - ? AS CHAR) where account_number = ?";
      PreparedStatement st = con.prepareStatement(sql);
      st.setInt(1, Integer.parseInt(amount)); // Chuyển đổi amount thành số
      st.setString(2, accountId);

      // In ra câu lệnh SQL đã bao gồm các giá trị thực tế
      System.out.println("Update accounts set balance = CAST(CAST(balance AS DECIMAL) - " + amount + " AS CHAR) where account_id = '" + accountId + "'");

      ketQua = st.executeUpdate();
      JDBCUtil.closeConnection(con);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return ketQua;
  }


  public int updateBalancePlus(String accountId, String amount) {
    int ketQua = 0;
    try {
      Connection con = JDBCUtil.getConnection();
      // Chuyển balance từ string sang số, thực hiện phép cộng, sau đó lại chuyển về string
      String sql = "Update accounts set balance = CAST(CAST(balance AS DECIMAL) + ? AS CHAR) where account_number = ?";
      PreparedStatement st = con.prepareStatement(sql);
      st.setInt(1, Integer.parseInt(amount)); // Chuyển đổi amount thành số
      st.setString(2, accountId);

      System.out.println("Update accounts set balance = CAST(CAST(balance AS DECIMAL) + " + amount + " AS CHAR) where account_id = '" + accountId + "'");

      ketQua = st.executeUpdate();
      JDBCUtil.closeConnection(con);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return ketQua;
  }


  public account getAccountByAccountNumber(String accountNumber) {
    account kq = null;
    try {
      Connection con = JDBCUtil.getConnection();
      String sql = "SELECT * FROM accounts WHERE account_number = ?";
      PreparedStatement st = con.prepareStatement(sql);
      st.setString(1, accountNumber);
      System.out.println(sql);
      ResultSet rs = st.executeQuery();
      while (rs.next()) {
        Integer user_id_account = rs.getInt("user_id_account");
        Integer account_id = rs.getInt("account_id");
        String account_number = rs.getString("account_number");
        String account_type = rs.getString("account_type");
        String balance = rs.getString("balance");
        String created_at = rs.getString("created_at");
        boolean state = rs.getBoolean("state");
        kq = new account(account_id, user_id_account, account_number, account_type, balance, created_at, state);
      }
      JDBCUtil.closeConnection(con);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return kq;
  }
}
