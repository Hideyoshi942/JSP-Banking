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
    return null;
  }

  @Override
  public transactions selectById(transactions transactions) {
    return null;
  }

  @Override
  public int insert(transactions transactions) {
    return 0;
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

  public transactions getAccountByUserId(String userId) {
    transactions kq = null;
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
        kq = new transactions(transaction_id, account_id, transaction_type, amount, transaction_date, beneficiary_id, state);
      }
      JDBCUtil.closeConnection(con);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return kq;
  }


}
