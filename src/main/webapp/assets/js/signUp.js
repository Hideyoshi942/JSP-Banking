function kiemTraEmail () {
  const email = document.getElementById("email").value;
  const emailError = document.getElementById("baoLoi");
  const emailRegex = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;

  if (!emailRegex.test(email)) {
    emailError.textContent = "Email không hợp lệ!. Vui lòng nhập đúng email.";
    return false;
  } else {
    emailError.textContent = "";
    return true;
  }
}

function kiemTraSoDienThoai() {
  const phoneNumber = document.getElementById("phone_number").value;
  const phoneError = document.getElementById("baoLoi");
  const phoneRegex = /^0[0-9]{9}$/;

  if (!phoneRegex.test(phoneNumber)) {
    phoneError.textContent = "Số điện thoại không hợp lệ. Vui lòng nhập lại!";
    return false;
  } else {
    phoneError.textContent = "";
    return true;
  }
}

function kiemTraMatKhau() {
  const matKhau = document.getElementById("password").value;
  const passwordError = document.getElementById("baoLoi");
  const passwordRegex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

  if (!passwordRegex.test(matKhau)) {
    passwordError.textContent = "Mật khẩu phải có ít nhất 8 ký tự, bao gồm ít nhất 1 chữ cái in hoa, 1 chữ cái thường, 1 chữ số và 1 ký tự đặc biệt.";
    return false;
  } else {
    passwordError.textContent = "";
    return true;
  }
}

function kiemTraMatKhauXacNhan() {
  const matKhau = document.getElementById("password").value;
  const matKhauNhapLai = document.getElementById("comfirm_password").value;
  const confirmError = document.getElementById("msg");

  if (matKhau !== matKhauNhapLai) {
    confirmError.textContent = "Mật khẩu không khớp";
    return false;
  } else {
    confirmError.textContent = "";
    return true;
  }
}

function xuLyChon() {
  const dongYDieuKhoan = document.getElementById("agree_term");
  dongYDieuKhoan.value = dongYDieuKhoan.checked ? "true" : "false";
}