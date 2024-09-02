package model;

public class loans {
  private int loan_id;
  private int user_id_loan;
  private String loan_amount;
  private double interest_rate;
  private String start_date;
  private String end_date;

  public loans() {

  }

  public loans(int loan_id, int user_id_loan, String loan_amount, double interest_rate,
      String start_date, String end_date) {
    this.loan_id = loan_id;
    this.user_id_loan = user_id_loan;
    this.loan_amount = loan_amount;
    this.interest_rate = interest_rate;
    this.start_date = start_date;
    this.end_date = end_date;
  }

  public int getLoan_id() {
    return loan_id;
  }

  public void setLoan_id(int loan_id) {
    this.loan_id = loan_id;
  }

  public int getUser_id_loan() {
    return user_id_loan;
  }

  public void setUser_id_loan(int user_id_loan) {
    this.user_id_loan = user_id_loan;
  }

  public String getLoan_amount() {
    return loan_amount;
  }

  public void setLoan_amount(String loan_amount) {
    this.loan_amount = loan_amount;
  }

  public double getInterest_rate() {
    return interest_rate;
  }

  public void setInterest_rate(double interest_rate) {
    this.interest_rate = interest_rate;
  }

  public String getStart_date() {
    return start_date;
  }

  public void setStart_date(String start_date) {
    this.start_date = start_date;
  }

  public String getEnd_date() {
    return end_date;
  }

  public void setEnd_date(String end_date) {
    this.end_date = end_date;
  }
}
