
function submitVerificationCode() {
    const code = document.getElementById("verification-code").value;
    if (code.length === 6) {
        alert("Mã xác thực hợp lệ!");
        document.getElementById("passwordForm").submit(); // Tiếp tục submit form
    } else {
        alert("Vui lòng nhập mã xác thực 6 ký tự.");
    }
}

function kiemTraMatKhau() {
    const matKhau = document.getElementById("current-password").value;
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

function kiemTraMatKhau2() {
    const matKhau = document.getElementById("new-password").value;
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
    const matKhau = document.getElementById("new-password").value;
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
