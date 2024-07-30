package model;

public class beneficiaries {
  private int beneficiary_id;
  private int user_id_beneficiari;
  private String name;
  private String account_number;
  private String bank_name;

  public beneficiaries(int beneficiary_id, int user_id_beneficiari, String name,
      String account_number, String bank_name) {
    this.beneficiary_id = beneficiary_id;
    this.user_id_beneficiari = user_id_beneficiari;
    this.name = name;
    this.account_number = account_number;
    this.bank_name = bank_name;
  }

  public int getBeneficiary_id() {
    return beneficiary_id;
  }

  public void setBeneficiary_id(int beneficiary_id) {
    this.beneficiary_id = beneficiary_id;
  }

  public int getUser_id_beneficiari() {
    return user_id_beneficiari;
  }

  public void setUser_id_beneficiari(int user_id_beneficiari) {
    this.user_id_beneficiari = user_id_beneficiari;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getAccount_number() {
    return account_number;
  }

  public void setAccount_number(String account_number) {
    this.account_number = account_number;
  }

  public String getBank_name() {
    return bank_name;
  }

  public void setBank_name(String bank_name) {
    this.bank_name = bank_name;
  }
}
