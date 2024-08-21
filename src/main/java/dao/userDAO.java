package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.user;

public class userDAO implements DAOInterface<user> {

  @Override
  public ArrayList<user> selectAll() {
    ArrayList<user> ketQua = new ArrayList<user>();
    Connection con = JDBCUtil.getConnection();
    String sql = "Select * From users";
    try {
      PreparedStatement st = con.prepareStatement(sql);
      ResultSet rs = st.executeQuery();
      while (rs.next()) {
        int user_id = rs.getInt(1);
        String username = rs.getString(2);
        String password = rs.getString(3);
        String email = rs.getString(4);
        String phone_number = rs.getString(5);
        String created_at = rs.getString(6);
        String type_user = rs.getString(7);
        String verification_code = rs.getString(8);
        String code_validity_period = rs.getString(9);
        boolean authentication_status = rs.getBoolean(10);
        String comfirm_password = rs.getString(11);
        boolean agree_tern = rs.getBoolean(12);
        user user = new user(user_id, username, password, email, phone_number, created_at,
            type_user,
            verification_code, code_validity_period, authentication_status, comfirm_password,
            agree_tern);
        ketQua.add(user);
      }
      con.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
    return ketQua;
  }

  @Override
  public user selectById(user user) {
    user kq = null;
    try {
      Connection con = JDBCUtil.getConnection();
      String sql = "Select * From users Where user_id = ?";
      PreparedStatement st = con.prepareStatement(sql);
      st.setInt(1, user.getUser_id());
      System.out.println(sql);
      ResultSet rs = st.executeQuery();
      while (rs.next()) {
        int user_id = rs.getInt(1);
        String username = rs.getString(2);
        String password = rs.getString(3);
        String email = rs.getString(4);
        String phone_number = rs.getString(5);
        String created_at = rs.getString(6);
        String type_user = rs.getString(7);
        String verification_code = rs.getString(8);
        String code_validity_period = rs.getString(9);
        boolean authentication_status = rs.getBoolean(10);
        String comfirm_password = rs.getString(11);
        boolean agree_term = rs.getBoolean(12);
        kq = new user(user_id, username, password, email, phone_number, created_at, type_user,
            verification_code, code_validity_period, authentication_status, comfirm_password,
            agree_term);
      }
      System.out.println(kq);
      JDBCUtil.closeConnection(con);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return kq;
  }

  public user selectByPhoneNumber(user user) {
    user kq = null;
    try {
      Connection con = JDBCUtil.getConnection();
      String sql = "Select * From users Where phone_number = ?";
      PreparedStatement st = con.prepareStatement(sql);
      st.setString(1, user.getPhone_number());
      System.out.println(sql);
      ResultSet rs = st.executeQuery();
      while (rs.next()) {
        int user_id = rs.getInt(1);
        String username = rs.getString(2);
        String password = rs.getString(3);
        String email = rs.getString(4);
        String phone_number = rs.getString(5);
        String created_at = rs.getString(6);
        String type_user = rs.getString(7);
        String verification_code = rs.getString(8);
        String code_validity_period = rs.getString(9);
        boolean authentication_status = rs.getBoolean(10);
        String comfirm_password = rs.getString(11);
        boolean agree_term = rs.getBoolean(12);
        kq = new user(user_id, username, password, email, phone_number, created_at, type_user,
            verification_code, code_validity_period, authentication_status, comfirm_password,
            agree_term);
      }
      System.out.println(kq);
      JDBCUtil.closeConnection(con);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return kq;
  }

  @Override
  public int insert(user user) {
    int kq = 0;
    try {
      Connection con = JDBCUtil.getConnection();
      String sql = "Insert into users(user_id, username, password, email, phone_number, created_at, type_user, comfirm_password, agree_term) values(?,?,?,?,?,?,?,?,?)";
      PreparedStatement st = con.prepareStatement(sql);
      st.setInt(1, user.getUser_id());
      st.setString(2, user.getUsername());
      st.setString(3, user.getPassword());
      st.setString(4, user.getEmail());
      st.setString(5, user.getPhone_number());
      st.setString(6, user.getCreated_at());
      st.setString(7, user.getType_user());
      st.setString(8, user.getComfirm_password());
      st.setBoolean(9, user.isAgree_term());
      kq = st.executeUpdate();
      System.out.println("Bạn đã thực thi: " + sql);
      System.out.println("Có " + kq + " dòng bị thay đổi!");
      con.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
    return kq;
  }

  public user selectByPhonenumberAndPassword(user u) {
    user kq = null;
    try {
      Connection con = JDBCUtil.getConnection();

      String sql = "Select * from users where phone_number=? and password=?";
      PreparedStatement st = con.prepareStatement(sql);
      st.setString(1, u.getPhone_number());
      st.setString(2, u.getPassword());
      System.out.println(sql);
      ResultSet rs = st.executeQuery();
      while (rs.next()) {
        String user_id = rs.getString("user_id");
        String username = rs.getString("username");
        String password = rs.getString("password");
        String email = rs.getString("email");
        String phone_number = rs.getString("phone_number");
        String created_at = rs.getString("created_at");
        String type_user = rs.getString("type_user");
        String verification_code = rs.getString("verification_code");
        String code_validity_period = rs.getString("code_validity_period");
        boolean authentication_status = rs.getBoolean("authentication_status");
        String comfirm_password = rs.getString("comfirm_password");
        boolean agree_term = rs.getBoolean("agree_term");
        kq = new user(Integer.parseInt(user_id), username, password, email, phone_number, created_at,
            type_user, verification_code, code_validity_period, authentication_status,
            comfirm_password, agree_term);
      }
      JDBCUtil.closeConnection(con);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return kq;

  }

  @Override
  public int insertAll(ArrayList<user> t) {
    return 0;
  }

  @Override
  public int update(user user) {
    return 0;
  }

  @Override
  public int delete(user user) {
    return 0;
  }

  @Override
  public int deleteAll(ArrayList<user> t) {
    return 0;
  }

  public boolean kiemTraSoDienThoai(String soDienThoai) {
    boolean ketQua = false;
    try {
      Connection con = JDBCUtil.getConnection();
      String sql = "Select * from users where phone_number=?";
      PreparedStatement st = con.prepareStatement(sql);
      st.setString(1, soDienThoai);
      System.out.println(sql);
      ResultSet rs = st.executeQuery();
      while (rs.next()) {
        ketQua = true;
      }
      JDBCUtil.closeConnection(con);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return ketQua;
  }

  public int updateverifyInformation(user u) {
    int kq = 0;
    try {
      Connection con = JDBCUtil.getConnection();

      String sql = "Update users " + "set " + " verification_code=?" + ", code_validity_period=?" + ", authentication_status=?" + " where user_id=?";

      PreparedStatement st = con.prepareStatement(sql);
      st.setString(1, u.getVerification_code());
      st.setString(2, u.getCode_validity_period());
      st.setBoolean(3, u.isAuthentication_status());
      st.setInt(4, u.getUser_id());

      System.out.println(sql);
      kq = st.executeUpdate();

      System.out.println("Bạn đã thực thi: " + sql);
      System.out.println("Có " + kq + " dòng bị thay đổi!");

      JDBCUtil.closeConnection(con);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return kq;
  }

  public int updateverifyInformation2(user u) {
    int kq = 0;
    try {
      Connection con = JDBCUtil.getConnection();

      String sql = "Update users " + "set " + " verification_code=?" + ", code_validity_period=?" + " where user_id=?";

      PreparedStatement st = con.prepareStatement(sql);
      st.setString(1, u.getVerification_code());
      st.setString(2, u.getCode_validity_period());
      st.setInt(3, u.getUser_id());

      System.out.println(sql);
      kq = st.executeUpdate();

      System.out.println("Bạn đã thực thi: " + sql);
      System.out.println("Có " + kq + " dòng bị thay đổi!");

      JDBCUtil.closeConnection(con);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return kq;
  }

  public boolean updatePassword(user u) {
    int kq = 0;
    try {
      Connection con = JDBCUtil.getConnection();

      String sql = "Update users " + "set " + " password=?" + ", comfirm_password=?" + " where user_id=?";

      PreparedStatement st = con.prepareStatement(sql);
      st.setString(1, u.getPassword());
      st.setString(2, u.getComfirm_password());
      st.setInt(3, u.getUser_id());

      System.out.println(sql);
      kq = st.executeUpdate();

      System.out.println("Bạn đã thực thi: " + sql);
      System.out.println("Có " + kq + " dòng bị thay đổi!");

      JDBCUtil.closeConnection(con);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return kq>0;
  }

}
