package com.poly.controller.client;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.poly.dao.KhachHangDAO;
import com.poly.entity.KhachHang;
import javax.servlet.http.HttpSession;


@Controller
public class KhachHangClientController {
	@Autowired
	KhachHangDAO dao;
	
	@Autowired
	HttpSession session;
	
	SessionFactory factory;
	
	@RequestMapping("/khachhangInfo")
	public String khachHangInfo(Model model) {

		return "khachhangInfo";
	}
	
	//Sửa thông tin khách hàng
	 @PostMapping("/khachhangInfo/update") 
	 public String update(Model model,@ModelAttribute("form") KhachHang khachHang) { 
		 try {
			 dao.update(khachHang);
			 model.addAttribute("khachHangInfo","khachHang");
			 model.addAttribute("message","Cập nhật thành công !");
			 return "khachhangInfo";
		 }
		 catch (Exception e) {
			 model.addAttribute("khachHangInfo","khachHang");
			 model.addAttribute("message","Cập nhật thất bại !");
			 return "khachhangInfo";
		}
	  }
	
}
