package model;

public class account {
  private int account_id;
  private int user_id_account;
  private String account_number;
  private String account_type;
  private String balance;
  private String created_at;

  public account(int account_id, int user_id_account, String account_number, String account_type,
      String balance, String created_at) {
    this.account_id = account_id;
    this.user_id_account = user_id_account;
    this.account_number = account_number;
    this.account_type = account_type;
    this.balance = balance;
    this.created_at = created_at;
  }

  public int getAccount_id() {
    return account_id;
  }

  public void setAccount_id(int account_id) {
    this.account_id = account_id;
  }

  public int getUser_id_account() {
    return user_id_account;
  }

  public void setUser_id_account(int user_id_account) {
    this.user_id_account = user_id_account;
  }

  public String getAccount_number() {
    return account_number;
  }

  public void setAccount_number(String account_number) {
    this.account_number = account_number;
  }

  public String getAccount_type() {
    return account_type;
  }

  public void setAccount_type(String account_type) {
    this.account_type = account_type;
  }

  public String getBalance() {
    return balance;
  }

  public void setBalance(String balance) {
    this.balance = balance;
  }

  public String getCreated_at() {
    return created_at;
  }

  public void setCreated_at(String created_at) {
    this.created_at = created_at;
  }
}

