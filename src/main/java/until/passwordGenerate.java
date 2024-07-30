package until;

import java.security.SecureRandom;

public class passwordGenerate {
  private static final String LOWER = "abcdefghijklmnopqrstuvwxyz";
  private static final String UPPER = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  private static final String DIGITS = "0123456789";
  private static final String SPECIAL = "!@#$%^&*()-_=+[]{}|;:,.<>?/";

  private static final String ALL_CHARS = LOWER + UPPER + DIGITS + SPECIAL;
  private static final SecureRandom random = new SecureRandom();

  public static String generatePassword(int length) {
    if (length < 4) {
      throw new IllegalArgumentException("Password length must be at least 4");
    }

    StringBuilder password = new StringBuilder(length);

    // Đảm bảo mật khẩu có ít nhất 1 kí tự từ mỗi nhóm
    password.append(LOWER.charAt(random.nextInt(LOWER.length())));
    password.append(UPPER.charAt(random.nextInt(UPPER.length())));
    password.append(DIGITS.charAt(random.nextInt(DIGITS.length())));
    password.append(SPECIAL.charAt(random.nextInt(SPECIAL.length())));

    // Điền phần còn lại của mật khẩu với các kí tự ngẫu nhiên từ tất cả các nhóm
    for (int i = 4; i < length; i++) {
      password.append(ALL_CHARS.charAt(random.nextInt(ALL_CHARS.length())));
    }

    // Trộn các kí tự trong mật khẩu để đảm bảo chúng được phân bố ngẫu nhiên
    char[] passwordArray = password.toString().toCharArray();
    for (int i = 0; i < passwordArray.length; i++) {
      int randomIndex = random.nextInt(passwordArray.length);
      char temp = passwordArray[i];
      passwordArray[i] = passwordArray[randomIndex];
      passwordArray[randomIndex] = temp;
    }

    return new String(passwordArray);
  }

}
