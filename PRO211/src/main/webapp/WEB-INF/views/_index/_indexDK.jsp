<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<div id="register-modal" tabindex="-1" role="dialog" aria-labelledby="login-modalLabel"
                                aria-hidden="true" class="modal fade">
                                <div role="document" class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 id="login-modalLabel" class="modal-title">Đăng kí</h4>
                                            <button type="button" data-dismiss="modal" aria-label="Close"
                                                class="close"><span aria-hidden="true">×</span></button>
                                        </div>       
                                        <div class="modal-body">
                                        	<h5>${messageDK}</h5>
											<form:form  method="post" action="/DangKy" modelAttribute="form">
												<form:input path="maKhachHang" readonly="true" type="hidden" class="form-control"/>
												<div class="form-group">
													<label class="col-form-label">Tên khách hàng</label>
													<form:input path="tenKhachHang" class="form-control" required="required"/>
													<form:errors path="tenKhachHang" style="color:red"></form:errors>
												</div>
                                                <div class="form-group">
                                                    <label for="recipient-name1" class="col-form-label">Email</label>
                                                    <form:input path="email" class="form-control" name="Name" required="required"/>
                                                    <form:errors path="email" style="color:red"></form:errors>
                                                </div>
                                                <div class="form-group">
                                                    <label for="password1" class="col-form-label">Mật khẩu</label>
                                                    <form:password path="matKhau" showPassword="true" class="form-control" name="Password" required="required"/>
													<form:errors path="matKhau" style="color:red"></form:errors>
                                                </div>
                                                <div class="form-group">
                                                    <label for="password2" class="col-form-label">Nhập lại mật khẩu</label>
                                                    <input type="password" class="form-control" name="nhapLaiMK" required>
                                                </div>
                                                <div class="form-group">
														<label class="col-form-label">Ngày sinh</label>
														<input type="date" class="form-control" data-date-format="dd-MM-yyyy" value="${form.ngaySinh}"  id="ngaySinh1" onchange="myfunction()" required="required"/>
														<form:input path="ngaySinh" id="ngaySinh2" class="form-control" type="hidden"/>
														<form:errors path="ngaySinh" style="color:red"></form:errors>
                                                </div>
                                                <div class="form-group">
													<label class="col-form-label">Giới tính</label>
													<div class="form-check">
														<form:radiobutton path="gioiTinh" value="False" class="form-check-input"/>
														<Label class="form-check-label">Nữ</Label> 
													</div>
													<div class="form-check"> 
														<form:radiobutton path="gioiTinh" value="True" class="form-check-input" checked="true"/>
														<label class="form-check-label">Nam</label>
													</div>
												</div>
												<div class="form-group">
													<label class="col-form-label">Số điện thoại</label>
													<form:input path="soDT" class="form-control" required="required"/>
													<form:errors path="soDT" style="color:red"></form:errors>
												</div>
												<div class="form-group">
													<label class="col-form-label">Địa chỉ</label>
													<form:input path="diaChi" class="form-control" required="required"/>
													<form:errors path="diaChi" style="color:red"></form:errors>
												</div>
                                                <div class="sub-w3l">
                                                    <div class="sub-agile">
                                                        <input type="checkbox" id="brand2" value="">
                                                        <label for="brand2" class="mb-3">
                                                            <span></span>Tôi đồng ý với mọi điều khoản</label>
                                                    </div>
                                                </div>
                                                <div class="right-w3l">
                                                    <button class='btn btn-default' type="submit">Đăng kí</button>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>