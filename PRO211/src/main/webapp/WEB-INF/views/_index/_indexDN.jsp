<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div id="login-modal" tabindex="-1" role="dialog" aria-labelledby="login-modalLabel"
                                aria-hidden="true" class="modal fade">
                                <div role="document" class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 id="login-modalLabel" class="modal-title">Đăng nhập</h4>
                                            <button type="button" data-dismiss="modal" aria-label="Close"
                                                class="close"><span aria-hidden="true">×</span></button>
                                        </div>
                                        <div class="modal-body">
                                            <form method="post" action="/DangNhap">
                                            <h5>${messageDN}</h5>
                                                <div class="form-group">
                                                    <label for="recipient-name1" class="col-form-label">Email</label>
                                                    <input type="email" class="form-control" id="taikhoan" name="email" value="${email}" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="password1" class="col-form-label">Mật khẩu</label>
                                                    <input type="password" class="form-control" name="matKhau" class="form-control" id="password" required>
                                                </div>
                                                <p class="text-center">
                                                    <button class="btn btn-template-outlined" type="submit">
                                                    <i class="fas fa-sign-in-alt"></i> Đăng nhập</button>
                                                </p>
                                            </form>                                          
                                        </div>
                                    </div>
                                </div>
                            </div>