<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 


<div class="ticket">
                <h3>Lịch chiếu</h3>
                <div class="ticket_select">
                    <form>
                        <div class="row">
                            <div class="col-sm-4 form-group">
                                <label>Ngày chiếu</label>
                                <input type="date" value="" class="date form-control" />
                            </div>
                            <div class="col-sm-4">
                                <label>Rạp chiếu phim</label>
                                <select id="chiNhanh" name="chiNhanh" class="filter form-control">
                                    <option value="all">Tất cả</option>
                                    <option value="1">Chi nhánh 1</option>
                                    <option value="2">Chi nhánh 2</option>
                                    <option value="3">Chi nhánh 3</option>
                                    <option value="4">Chi nhánh 4</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="ticket_show">
                <div class="row">

                    <div id="parent" class="col-xl-3 col-md-3">
                        <jsp:useBean id="processed" class="java.util.HashMap" />
                        <c:forEach var="lc" items="${lichChieu}">
                            <c:if test="${empty processed[lc.phongchieuphim.chinhanh.tenChiNhanh]}">
                                <c:set target="${processed}" property="${lc.phongchieuphim.chinhanh.tenChiNhanh}" value="true" />
                                <div class="filterDate ${lc.ngayChieu} card">
                                    <div class="filter ${lc.phongchieuphim.chinhanh.maChiNhanh}">
                                        <div class="card-header">
                                            <div>${lc.phongchieuphim.chinhanh.tenChiNhanh}</div>
                                        </div>                             
                                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                                            <div class="list-group">
                                                <div class="list-group-item">
                                                    <c:forEach items="${lichChieu}" var="other">
                                                        <c:if test="${lc.phongchieuphim.chinhanh.tenChiNhanh == other.phongchieuphim.chinhanh.tenChiNhanh}">
                                                            <a href="/DatVe/${other.maLichChieu}" class="btn btn-light">${fn:substring(other.suatchieu.gioBatDau,0,5) }</a>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>   
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                </div>
            </div>