package com.poly.controller.admin;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.dao.ChiNhanhDAO;
import com.poly.dao.PhongChieuPhimDAO;
import com.poly.entity.ChiNhanh;
import com.poly.entity.NhanVien;

@Transactional
@Controller

public class ChiNhanhController {
	@Autowired
	ChiNhanhDAO dao;
	@Autowired
	PhongChieuPhimDAO daoPC;

	@Autowired
	HttpSession session;

	String message = "Bạn không có quyền thực hiện thao tác này";
	NhanVien nv;

	@RequestMapping("/admin/ChiNhanh/index")
	public String index(Model model) {
		model.addAttribute("form", new ChiNhanh());
		model.addAttribute("listCN", dao.findAll());
		return "admin/ChiNhanh/index";
	}

	@RequestMapping("/admin/ChiNhanh/edit/{id}")
	public String edit(Model model, @PathVariable("id") String maRap) {
		ChiNhanh entity = dao.findById(maRap);
		model.addAttribute("form", entity);
		model.addAttribute("listCN", dao.findAll());
		return "admin/ChiNhanh/index";
	}

	@RequestMapping("/admin/ChiNhanh/create")
	public String create(Model model, @ModelAttribute("form") ChiNhanh entity, RedirectAttributes rs) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/ChiNhanh/index";
			}
			dao.create(entity);
			model.addAttribute("message", "Thêm mới thành công");
		} catch (Exception e) {
			model.addAttribute("message", "Thêm mới thất bại");
		}
		model.addAttribute("listCN", dao.findAll());
		return "redirect:/admin/ChiNhanh/index";
	}

	@RequestMapping("/admin/ChiNhanh/update")
	public String update(Model model, @ModelAttribute("form") ChiNhanh entity, RedirectAttributes rs) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/ChiNhanh/edit/" + entity.getmaChiNhanh();
			}
			dao.update(entity);
			rs.addFlashAttribute("message", "Cập nhật thành công");
			model.addAttribute("listCN", dao.findAll());
			return "redirect:/admin/ChiNhanh/edit/" + entity.getmaChiNhanh();
		} catch (Exception e) {
			rs.addFlashAttribute("message", "Đã xảy ra lỗi, cập nhật thất bại");
			return "redirect:/admin/ChiNhanh/edit/" + entity.getmaChiNhanh();
		}
	}

	@RequestMapping("/admin/ChiNhanh/delete")
	public String delete(Model model, @ModelAttribute("form") ChiNhanh entity, RedirectAttributes rs) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/ChiNhanh/index";
			}
			if (daoPC.findByChiNhanh(entity.getmaChiNhanh()).isEmpty()) {
				dao.delete(entity.getmaChiNhanh());
				model.addAttribute("listCN", dao.findAll());
				rs.addFlashAttribute("message", "Xóa thành công");
				return "redirect:/admin/ChiNhanh/index";
			} else {
				model.addAttribute("listCN", dao.findAll());
				rs.addFlashAttribute("message", "Mã chi nhánh đang được sử dụng, không thể xóa");
				return "redirect:/admin/ChiNhanh/index";
			}
		} catch (Exception e) {
			rs.addFlashAttribute("message", "Đã xảy ra lỗi, xóa thất bại");
			return "redirect:/admin/ChiNhanh/index";
		}

	}
}
