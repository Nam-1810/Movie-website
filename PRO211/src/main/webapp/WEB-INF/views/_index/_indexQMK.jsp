<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div id="forgot-password" tabindex="-1" role="dialog" aria-labelledby="login-modalLabel" aria-hidden="true" class="modal fade">
                                <div role="document" class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 id="login-modalLabel" class="modal-title">Quên mật khẩu</h4>
                                            <button type="button" data-dismiss="modal" aria-label="Close"
                                                class="close"><span aria-hidden="true">×</span></button>
                                        </div>
                                        <div class="modal-body">
											 <h4>${message}</h4>
											 <form method="post" action="/QuenMatKhau">	  	
													<div class="form-group col">
														<label>Email :</label>
														<input type="text" name="email" value="${email}" class="form-control"/>
													</div>
													
												<div class="form-group col">
													<button class='btn btn-default' type="submit">Xác nhận</button>
													<button formaction="/index" class="btn btn-default">Hủy</button>
												</div>
											</form>                                        
                                        </div>
                                    </div>
                                </div>
                            </div>