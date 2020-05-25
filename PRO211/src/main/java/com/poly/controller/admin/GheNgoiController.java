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

import com.poly.dao.GheNgoiDAO;
import com.poly.dao.PhongChieuPhimDAO;
import com.poly.dao.VeDAO;
import com.poly.entity.GheNgoi;
import com.poly.entity.NhanVien;

@Transactional
@Controller

public class GheNgoiController {
	@Autowired
	GheNgoiDAO dao;
	@Autowired
	PhongChieuPhimDAO daoPC;
	@Autowired
	VeDAO daoVe;

	@Autowired
	HttpSession session;

	String message = "Bạn không có quyền thực hiện thao tác này";
	NhanVien nv;

	@RequestMapping("/admin/GheNgoi/index")
	public String index(Model model) {
		model.addAttribute("form", new GheNgoi());
		model.addAttribute("listGN", dao.findAll());
		model.addAttribute("listPC", daoPC.findAll());
		return "admin/GheNgoi/index";
	}

	@RequestMapping("/admin/GheNgoi/edit/{id}")
	public String edit(Model model, @PathVariable("id") String maGhe) {
		GheNgoi entity = dao.findById(maGhe);
		model.addAttribute("form", entity);
		model.addAttribute("listGN", dao.findAll());
		model.addAttribute("listPC", daoPC.findAll());
		return "admin/GheNgoi/index";
	}

	@RequestMapping("/admin/GheNgoi/create")
	public String create(Model model, @ModelAttribute("form") GheNgoi entity, RedirectAttributes rs) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/GheNgoi/index";
			}
			dao.create(entity);
			rs.addFlashAttribute("message", "Thêm mới thành công");
		} catch (Exception e) {
			rs.addFlashAttribute("message", "Thêm mới thất bại");
		}

		model.addAttribute("listGN", dao.findAll());
		return "redirect:/admin/GheNgoi/index";
	}

	@RequestMapping("/admin/GheNgoi/update")
	public String update(Model model, @ModelAttribute("form") GheNgoi entity, RedirectAttributes rs) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/GheNgoi/index";
			}
			dao.update(entity);
			rs.addFlashAttribute("message", "Cập nhật thành công");
			model.addAttribute("listGN", dao.findAll());
			return "redirect:/admin/GheNgoi/edit/" + entity.getMaGhe();
		} catch (Exception e) {
			rs.addFlashAttribute("message", "Cập nhật thất bại");
			return "redirect:/admin/GheNgoi/edit/" + entity.getMaGhe();
		}
	}

	@RequestMapping("/admin/GheNgoi/delete")
	public String delete(Model model, @ModelAttribute("form") GheNgoi entity, RedirectAttributes rs) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/GheNgoi/index";
			}
			if (daoVe.findByGheNgoi(entity.getMaGhe()).isEmpty()) {
				dao.delete(entity.getMaGhe());
				rs.addFlashAttribute("message", "Xóa thành công");
				model.addAttribute("listGN", dao.findAll());
				return "redirect:/admin/GheNgoi/index";
			} else {
				rs.addFlashAttribute("message", "Ghế đang được sử dụng - Vé, không thể xóa");
				model.addAttribute("listGN", dao.findAll());
				return "redirect:/admin/GheNgoi/index";
			}
		} catch (Exception e) {
			rs.addFlashAttribute("message", "Đã xảy ra lỗi, xóa thất bại");
			return "redirect:/admin/GheNgoi/index";
		}

	}
}
