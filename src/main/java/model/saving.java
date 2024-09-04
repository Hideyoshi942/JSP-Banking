package model;

public class saving extends account{
  private int saving_id;
  private double interest_rate;
  private String time_saving;

  public saving() {

  }

  public saving(int saving_id, double interest_rate, String time_saving) {
    this.saving_id = saving_id;
    this.interest_rate = interest_rate;
    this.time_saving = time_saving;
  }

  public saving(int saving_id, int user_id_account, int account_id, String account_number, String account_type,
      String balance, String created_at,  double interest_rate,
      String time_saving, boolean state) {
    super(account_id, user_id_account, account_number, account_type, balance, created_at, state);
    this.saving_id = saving_id;
    this.interest_rate = interest_rate;
    this.time_saving = time_saving;
  }

  public int getSaving_id() {
    return saving_id;
  }

  public void setSaving_id(int saving_id) {
    this.saving_id = saving_id;
  }

  public double getInterest_rate() {
    return interest_rate;
  }

  public void setInterest_rate(double interest_rate) {
    this.interest_rate = interest_rate;
  }

  public String getTime_saving() {
    return time_saving;
  }

  public void setTime_saving(String time_saving) {
    this.time_saving = time_saving;
  }
}
