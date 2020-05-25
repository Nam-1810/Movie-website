package com.poly;
  
  import org.springframework.beans.factory.annotation.Autowired; 
  import org.springframework.context.annotation.Configuration; 
  import org.springframework.web.servlet.config.annotation.InterceptorRegistry; 
  import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.poly.interceptor.AuthorizeInterceptorKH;
import com.poly.interceptor.AuthorizeInterceptorNV;
  
  @Configuration 
  public class InterConfig implements WebMvcConfigurer {
  
  @Autowired 
  AuthorizeInterceptorKH authKH;
  
  @Autowired
  AuthorizeInterceptorNV authNV;
  
  //Chặn kiểm tra đăng nhập KH
  @Override 
  public void addInterceptors(InterceptorRegistry registry) {
	  registry.addInterceptor(authKH).addPathPatterns(
			  "/ThongTinKH",
			  "/DatVe/**",
			  "/ThanhToan/**",
			  "/DanhGia/**",
			  "/success/**"
	); 
	  registry.addInterceptor(authNV).addPathPatterns(
			  "/admin/ChiNhanh/**",
			  "/admin/GheNgoi/**",
			  "/admin/LichChieu/**",
			  "/admin/Phim/**",
			  "/admin/PhongChieuPhim/**",
			  "/admin/report/**",
			  "/admin/TheLoaiPhim/**",
			  "/admin/VePhim/**",
			  "/admin/nhanvien/**",
			  "/admin/danhgia/**",
			  "/admin/khachhang/**",
			  "/admin/thongke/**",
			  "/admin/ThongTinNV/**",
			  "/admin/ve/**",
			  "/successs"
			  
	); 
  }
}
 