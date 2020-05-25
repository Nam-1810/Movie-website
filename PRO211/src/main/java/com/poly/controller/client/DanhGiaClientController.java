package com.poly.controller.client;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.dao.DanhGiaDAO;
import com.poly.dao.PhimDAO;
import com.poly.entity.DanhGia;
import com.poly.entity.KhachHang;

@Controller
public class DanhGiaClientController {
	SessionFactory factory;
	
	@Autowired
	DanhGiaDAO daoDG;
	
	@Autowired
	PhimDAO daoP;
		
	@Autowired
	HttpSession session;
	
	//View form đánh giá của client
	@RequestMapping("/DanhGia/{maPhim}")
	public String indexClient(Model model,@PathVariable("maPhim") Integer maPhim) {
		KhachHang khachHang = (KhachHang) session.getAttribute("khachhang");
		DanhGia dg = new DanhGia();
		model.addAttribute("form",new KhachHang());
		dg.setKhachhang(khachHang);
		dg.setPhim(daoP.findById(maPhim));
		model.addAttribute("formDanhGia",dg);
		session.setAttribute("maPhim",maPhim);
		
		return "DanhGia";
	}
	
	//Client tạo đánh giá trên trang phim
	@PostMapping("DanhGia/create")
	public String create(Model model, @Validated @ModelAttribute("formDanhGia") DanhGia danhGia, BindingResult errors,RedirectAttributes re) {
		if(errors.hasErrors()) {
			model.addAttribute("form",new KhachHang());
			model.addAttribute("message","Thêm đánh giá thất bại !");
			return "DanhGia";
		}
		try {
			Integer maPhim = (Integer) session.getAttribute("maPhim");
			daoDG.create(danhGia);
			re.addFlashAttribute("message","Thêm thành công");
			return "redirect:/ChiTietPhim/" + maPhim;
		}
		catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("form",new KhachHang());
			model.addAttribute("message","Thêm đánh giá thất bại");
			return "DanhGia";
		}
	}
}
