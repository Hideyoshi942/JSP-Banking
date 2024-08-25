package dao;

import java.util.ArrayList;
import model.transactions;

public class transactionsDAO implements DAOInterface<transactions> {

  @Override
  public ArrayList<transactions> selectAll() {
    return null;
  }

  @Override
  public transactions selectById(transactions transactions) {
    return null;
  }

  @Override
  public int insert(transactions transactions) {
    return 0;
  }

  @Override
  public int insertAll(ArrayList<transactions> t) {
    return 0;
  }

  @Override
  public int update(transactions transactions) {
    return 0;
  }

  @Override
  public int delete(transactions transactions) {
    return 0;
  }

  @Override
  public int deleteAll(ArrayList<transactions> t) {
    return 0;
  }
}
