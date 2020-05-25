package com.poly.controller.admin;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.poly.dao.DanhGiaDAO;
import com.poly.entity.DanhGia;

@Controller
public class DanhGiaAdminController {
	@Autowired
	DanhGiaDAO dao;
	SessionFactory factory;
	
	//View danh sách đánh giá trang của admin
	@RequestMapping("/admin/danhgia")
	public String indexAdmin(Model model) {
		model.addAttribute("danhgia", dao.findAll());
		model.addAttribute("form", new DanhGia());
		return "admin/danhgia";
	}
	
	//Chi tiết đánh giá
	@RequestMapping("/admin/danhgia/chitiet/{id}")
	public String edit(Model model, @PathVariable("id") Integer maDanhGia) {
		DanhGia entity = dao.findById(maDanhGia);
		model.addAttribute("form", entity);
		model.addAttribute("danhgia", dao.findAll());
		return "admin/danhgia";
	}
	
	//Xóa thông tin đánh giá trên danh sách
	@RequestMapping("/admin/danhgia/delete/{maDanhGia}")
	public String delete(Model model, @PathVariable("maDanhGia") Integer maDanhGia) {
		dao.delete(maDanhGia);
		return "redirect:/admin/danhgia";
	}
}
