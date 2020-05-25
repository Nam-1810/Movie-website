package com.poly.controller.admin;

import java.util.List;

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
import com.poly.dao.DatVeDAO;
import com.poly.dao.KhachHangDAO;
import com.poly.entity.KhachHang;

@Controller
public class KhachHangAdminController {
	@Autowired
	KhachHangDAO dao;
	@Autowired
	DanhGiaDAO daoDG;
	@Autowired
	DatVeDAO daoDV;
	SessionFactory factory;

	@RequestMapping("/admin/khachhang")
	public String index(Model model) {
		List<KhachHang> list = dao.findAll();
		model.addAttribute("khachhang", list);
		model.addAttribute("_new", "disabled");
		model.addAttribute("form", new KhachHang());
		return "admin/khachhang";
	}

	@PostMapping("/admin/khachhang/create")
	public String create(Model model, @Validated @ModelAttribute("form") KhachHang khachHang, BindingResult errors,
			RedirectAttributes re) {
		if (errors.hasErrors()) {
			List<KhachHang> list = dao.findAll();
			model.addAttribute("khachhang", list);
			return "admin/khachhang";
		}
		try {
			List<KhachHang> list = dao.findAll();
			if (khachHang.getMaKhachHang() == null) {
				if (dao.findByEmail(khachHang.getEmail()) != null) {
					model.addAttribute("message", "Email đã tồn tại");
					model.addAttribute("khachhang", list);
					model.addAttribute("form", khachHang);
					return "admin/khachhang";
				} else {
					dao.create(khachHang);
					re.addFlashAttribute("message", "Thêm thành công");
					return "redirect:/admin/khachhang";
				}
			} else {
				try {
					dao.update(khachHang);
					re.addFlashAttribute("message", "Sửa thành công");
					return "redirect:/admin/khachhang";
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("khachhang", list);
					model.addAttribute("form", khachHang);
					model.addAttribute("message", "Sửa mới thất bại");
					return "admin/khachhang";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "Thêm mới thất bại");
			List<KhachHang> list = dao.findAll();
			model.addAttribute("khachhang", list);
			model.addAttribute("form", khachHang);
		}
		return "admin/khachhang";
	}


	// Lấy thông tin khách hàng điền vào form để chỉnh sửa
	@RequestMapping("/admin/khachhang/edit/{maKhachHang}")
	public String edit(Model model, @PathVariable("maKhachHang") Integer maKhachHang) {
		List<KhachHang> list = dao.findAll();
		KhachHang khachHang = dao.findById(maKhachHang);
		model.addAttribute("khachhang", list);
		model.addAttribute("form", khachHang);
		model.addAttribute("button", "disabled");
		model.addAttribute("readonly", "true");
		return "admin/khachhang";
	}

	// Xóa thông tin khách hàng trên danh sách
	@RequestMapping("/admin/khachhang/delete/{maKhachHang}")
	public String delete(Model model, @PathVariable("maKhachHang") Integer maKhachHang, RedirectAttributes rs) {
		try {
			if (daoDG.findByKhachHang(maKhachHang).isEmpty() == false) {
				rs.addFlashAttribute("message", "Khách hàng đang được sử dụng - đánh giá, không thể xóa");
				return "redirect:/admin/khachhang";
			} else if (daoDV.findByKhachHang(maKhachHang).isEmpty() == false) {
				rs.addFlashAttribute("message", "Khách hàng đang được sử dụng - đặt vé, không thể xóa");
				return "redirect:/admin/khachhang";
			} else {
				rs.addFlashAttribute("message", "Xóa thành công");
				dao.delete(maKhachHang);
				return "redirect:/admin/khachhang";
			}
		} catch (Exception e) {
			rs.addFlashAttribute("message", "Xóa thất bại");
			return "redirect:/admin/khachhang";
		}
	}

	@RequestMapping("/admin/khachhang/clear")
	public String clear(Model model) {
		return "redirect:/admin/khachhang";
	}
}
