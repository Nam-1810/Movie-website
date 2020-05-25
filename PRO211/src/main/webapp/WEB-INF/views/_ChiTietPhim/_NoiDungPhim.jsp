<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<div class="row">
                <div class="col-xl-3 col-md-3">
                    <div class="business_thumb">
                        <img class="img-fluid" src="/img/phim/${item.hinhPhim}" alt=""/>
                    </div>
                </div>
                <div class="col-6">
                    <div class="business_info">
                        <h2>${item.tenPhim}</h2>
                        <div class="rating">
                            <img src="/img/rating.png">
                            <p><fmt:formatNumber type="number" pattern="#" value="${diem}"/>/10 
                            <a href="/DanhGia/${item.maPhim}" style="color:blue" class="button">Đánh giá</a></p>

                        </div>
                        <div>
                            <ul>
                                <li>Thể loại: ${item.theloaiphim.tenTheLoai}</li>
                                <li>Nhà sản xuất: ${item.nhaSanXuat}</li>
                                <li>Đạo diễn: ${item.daoDien}</li>
                                <li>Quốc gia: ${item.quocGia}</li>
                                <li>Khởi chiếu: ${item.ngayPhatHanh}</li>
                                <li>Diễn viên: ${item.dienVien}</li>
                                <li>Thời lượng: ${item.thoiLuong}</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content">
                <h3>Nội dung phim</h3>
                <p>${item.noiDung}</p>
            </div>