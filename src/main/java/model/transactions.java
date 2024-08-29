package model;

public class transactions {
  private int transaction_id;
  private int account_id;
  private String transaction_type;
  private String amount;
  private String transaction_date;
  private int beneficiary_id;
  private boolean state;

  public transactions() {
  }

  public transactions(int transaction_id, int account_id, String transaction_type, String amount,
      String transaction_date, int beneficiary_id, boolean state) {
    this.transaction_id = transaction_id;
    this.account_id = account_id;
    this.transaction_type = transaction_type;
    this.amount = amount;
    this.transaction_date = transaction_date;
    this.beneficiary_id = beneficiary_id;
    this.state = state;
  }

  public boolean isState() {
    return state;
  }

  public void setState(boolean state) {
    this.state = state;
  }

  public int getTransaction_id() {
    return transaction_id;
  }

  public void setTransaction_id(int transaction_id) {
    this.transaction_id = transaction_id;
  }

  public int getAccount_id() {
    return account_id;
  }

  public void setAccount_id(int account_id) {
    this.account_id = account_id;
  }

  public String getTransaction_type() {
    return transaction_type;
  }

  public void setTransaction_type(String transaction_type) {
    this.transaction_type = transaction_type;
  }

  public String getAmount() {
    return amount;
  }

  public void setAmount(String amount) {
    this.amount = amount;
  }

  public String getTransaction_date() {
    return transaction_date;
  }

  public void setTransaction_date(String transaction_date) {
    this.transaction_date = transaction_date;
  }

  public int getBeneficiary_id() {
    return beneficiary_id;
  }

  public void setBeneficiary_id(int beneficiary_id) {
    this.beneficiary_id = beneficiary_id;
  }
}
