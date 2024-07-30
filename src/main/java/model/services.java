package model;

public class services {
  private int service_id;
  private String service_name;
  private String description;
  private String fee;

  public services(int service_id, String service_name, String description, String fee) {
    this.service_id = service_id;
    this.service_name = service_name;
    this.description = description;
    this.fee = fee;
  }

  public int getService_id() {
    return service_id;
  }

  public void setService_id(int service_id) {
    this.service_id = service_id;
  }

  public String getService_name() {
    return service_name;
  }

  public void setService_name(String service_name) {
    this.service_name = service_name;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getFee() {
    return fee;
  }

  public void setFee(String fee) {
    this.fee = fee;
  }
}
