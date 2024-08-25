package dao;

import java.sql.Connection;
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
    return 0;
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
        kq = new account(user_id_account, account_id, account_number, account_type, balance, created_at, state);
      }
      JDBCUtil.closeConnection(con);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return kq;
  }
}
