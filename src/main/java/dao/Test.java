package dao;

import java.time.LocalDate;
import model.user;

public class Test {
  public static void main(String[] args) {
    userDAO uDAO = new userDAO();
    user u = new user();
    u.setUser_id(865455641);
    u.setUsername("hideyoshi");
    u.setPassword("123456");
    u.setEmail("unclekiet2424@gmail.com");
    u.setPhone_number("0969765106");
    u.setCreated_at(LocalDate.now().toString());
    u.setType_user("user");
    u.setComfirm_password("123456");
    u.setAgree_term(true);
    uDAO.insert(u);
    System.out.println(uDAO.toString());
  }

}
