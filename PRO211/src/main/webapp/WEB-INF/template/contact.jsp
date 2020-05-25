<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-xl-9 col-md-9">
      <div class="short_contact_list">
          <ul>
              <li style=${DangNhapHidden }> <a class="a-top" href="#" data-toggle="modal" data-target="#login-modal" class="login-btn"><i class="fa fa-sign-in" aria-hidden="true"></i>Đăng nhập</a></li>
              <li><a class="a-top" data-toggle="modal" data-target="#register-modal" class="register-btn"><i class="fa fa-registered" aria-hidden="true"></i>Đăng kí</a></li>
              <li><a class="a-top" data-toggle="modal" data-target="#forgot-password" class="register-btn"><i class="fa fa-mark" aria-hidden="true"></i>Quên mật khẩu ?</a></li>
          	  <li><a href="/DoiMatKhau" ><i class="fa fa-book" aria-hidden="true"></i>Đổi mật khẩu</a></li>
          	  <li><a href="/ThongTinKH" style="color: red" >${khachhang.tenKhachHang}</a></li>
          	  <li style=${DangXuatHidden }><a href="/DangXuat">Đăng xuất</a></li>
          </ul>
      </div>
      
      <jsp:include page="../views/_index/_indexDN.jsp"/>
      <jsp:include page="../views/_index/_indexDK.jsp"/>
      <jsp:include page="../views/_index/_indexQMK.jsp"/>
  </div>