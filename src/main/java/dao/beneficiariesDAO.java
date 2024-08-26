package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.account;
import model.beneficiaries;

public class beneficiariesDAO implements DAOInterface<beneficiaries> {

  @Override
  public ArrayList<beneficiaries> selectAll() {
    return null;
  }

  @Override
  public beneficiaries selectById(beneficiaries beneficiaries) {
    return null;
  }

  @Override
  public int insert(beneficiaries beneficiaries) {
    int kq = 0;
    try {
      Connection con = JDBCUtil.getConnection();
      String sql = "Insert into beneficiaries(beneficiary_id, user_id_beneficiari, name, account_number, bank_name) values(?,?,?,?,?)";
      PreparedStatement st = con.prepareStatement(sql);
      st.setInt(1, beneficiaries.getBeneficiary_id());
      st.setInt(2, beneficiaries.getUser_id_beneficiari());
      st.setString(3, beneficiaries.getName());
      st.setString(4, beneficiaries.getAccount_number());
      st.setString(5, beneficiaries.getBank_name());
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
  public int insertAll(ArrayList<beneficiaries> t) {
    return 0;
  }

  @Override
  public int update(beneficiaries beneficiaries) {
    return 0;
  }

  @Override
  public int delete(beneficiaries beneficiaries) {
    return 0;
  }

  @Override
  public int deleteAll(ArrayList<beneficiaries> t) {
    return 0;
  }

  public beneficiaries getAccountByUserId(String userId) {
    beneficiaries kq = null;
    try {
      Connection con = JDBCUtil.getConnection();
      String sql = "SELECT * FROM beneficiaries WHERE user_id_beneficiari = ?";
      PreparedStatement st = con.prepareStatement(sql);
      st.setString(1, userId);
      System.out.println(sql);
      ResultSet rs = st.executeQuery();
      while (rs.next()) {
        Integer user_id_beneficiari = rs.getInt("user_id_beneficiari");
        Integer beneficiary_id = rs.getInt("beneficiary_id");
        String name = rs.getString("name");
        String account_number = rs.getString("account_number");
        String bank_name = rs.getString("bank_name");
        kq = new beneficiaries(user_id_beneficiari, beneficiary_id, name, account_number, bank_name);
      }
      JDBCUtil.closeConnection(con);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return kq;
  }

  public beneficiaries selectionByNumberAccountAndName(String numberAccount, String nameAccount) {
    beneficiaries kq = null;
    try {
      Connection con = JDBCUtil.getConnection();
      String sql = "select * from beneficiaries where account_number = ? and name = ?";
      PreparedStatement st = con.prepareStatement(sql);
      st.setString(1, numberAccount);
      st.setString(2, nameAccount);
      System.out.println(sql);
      ResultSet rs = st.executeQuery();
      while (rs.next()) {
        Integer beneficiary_id = rs.getInt("beneficiary_id");
        Integer user_id_beneficiari = rs.getInt("user_id_beneficiari");
        String name = rs.getString("name");
        String account_number = rs.getString("account_number");
        String bank_name = rs.getString("bank_name");
        kq = new beneficiaries(user_id_beneficiari, beneficiary_id, name, account_number, bank_name);
      }
      JDBCUtil.closeConnection(con);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return kq;
  }
}
