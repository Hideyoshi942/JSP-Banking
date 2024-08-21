package model;

public class user {
  private int user_id;
  private String username;
  private String password;
  private String email;
  private String phone_number;
  private String created_at;
  private String type_user;
  private String verification_code;
  private String code_validity_period;
  private boolean authentication_status;
  private String comfirm_password;
  private boolean agree_term;

  public user() {
  }

  public user(int user_id, String username, String password, String email, String phone_number,
      String created_at, String type_user, String verification_code, String code_validity_period,
      boolean authentication_status, String comfirm_password, boolean agree_term) {
    this.user_id = user_id;
    this.username = username;
    this.password = password;
    this.email = email;
    this.phone_number = phone_number;
    this.created_at = created_at;
    this.type_user = type_user;
    this.verification_code = verification_code;
    this.code_validity_period = code_validity_period;
    this.authentication_status = authentication_status;
    this.comfirm_password = comfirm_password;
    this.agree_term = agree_term;
  }

  public user(int userId, String tenDangNhap, String matKhau, String email, String phoneNumber, String createdAt, String typeUser, String comfirmPassword, boolean agreeTerm) {
    this.user_id = userId;
    this.username = tenDangNhap;
    this.password = matKhau;
    this.email = email;
    this.phone_number = phoneNumber;
    this.created_at = createdAt;
    this.type_user = typeUser;
    this.comfirm_password = comfirmPassword;
    this.agree_term = agreeTerm;
  }

  public user(int userId) {
    this.user_id = userId;
  }

  public int getUser_id() {
    return user_id;
  }

  public void setUser_id(int user_id) {
    this.user_id = user_id;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPhone_number() {
    return phone_number;
  }

  public void setPhone_number(String phone_number) {
    this.phone_number = phone_number;
  }

  public String getCreated_at() {
    return created_at;
  }

  public void setCreated_at(String created_at) {
    this.created_at = created_at;
  }

  public String getType_user() {
    return type_user;
  }

  public void setType_user(String type_user) {
    this.type_user = type_user;
  }

  public String getVerification_code() {
    return verification_code;
  }

  public void setVerification_code(String verification_code) {
    this.verification_code = verification_code;
  }

  public String getCode_validity_period() {
    return code_validity_period;
  }

  public void setCode_validity_period(String code_validity_period) {
    this.code_validity_period = code_validity_period;
  }

  public boolean isAuthentication_status() {
    return authentication_status;
  }

  public void setAuthentication_status(boolean authentication_status) {
    this.authentication_status = authentication_status;
  }

  public String getComfirm_password() {
    return comfirm_password;
  }

  public void setComfirm_password(String comfirm_password) {
    this.comfirm_password = comfirm_password;
  }

  public boolean isAgree_term() {
    return agree_term;
  }

  public void setAgree_term(boolean agree_term) {
    this.agree_term = agree_term;
  }
}
