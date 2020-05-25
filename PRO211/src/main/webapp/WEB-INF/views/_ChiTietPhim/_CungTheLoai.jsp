<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

    
   <div class="movie_related">
                <h3 class="title">Phim cùng thể loại</h3>
                <div class="buy_ticket ">
                    <div class="row">
                        <c:forEach var="phim" items="${same}">
                            <div class="col-xl-3 col-md-6 col-lg-3">
                                <div class="single_expert mb-40">
                                    <div class="expert_thumb">
                                        <ul class="caption-style-4">
                                            <li>
                                                <a href="/ChiTietPhim/${phim.maPhim}">
                                                    <img src="/img/phim/${phim.hinhPhim}" alt="">
                                                    <div class="caption">
                                                        <div class="blur"></div>
                                                        <div class="caption-text">
                                                            <div class="button-buy">MUA VÉ</div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="experts_name text-center">
                                        <a href="/detail/${phim.maPhim}">
                                            <h3>${phim.tenPhim}</h3>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>