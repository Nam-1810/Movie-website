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

import com.poly.dao.PhimDAO;
import com.poly.dao.TheLoaiPhimDAO;
import com.poly.entity.NhanVien;
import com.poly.entity.TheLoaiPhim;

@Transactional
@Controller

public class TheLoaiPhimController {
	@Autowired
	TheLoaiPhimDAO dao;
	@Autowired
	PhimDAO daoP;
	@Autowired
	HttpSession session;

	String message = "Bạn không có quyền thực hiện thao tác này";
	NhanVien nv;


	@RequestMapping("/admin/TheLoaiPhim/index")
	public String index(Model model) {
		model.addAttribute("form", new TheLoaiPhim());

		model.addAttribute("listTL", dao.findAll());
		return "admin/TheLoaiPhim/index";
	}

	@RequestMapping("/admin/TheLoaiPhim/edit/{id}")
	public String edit(Model model, @PathVariable("id") String maTheLoai) {
		TheLoaiPhim entity = dao.findById(maTheLoai);
		model.addAttribute("form", entity);
		model.addAttribute("listTL", dao.findAll());
		return "admin/TheLoaiPhim/index";
	}

	@RequestMapping("/admin/TheLoaiPhim/create")
	public String create(Model model, @ModelAttribute("form") TheLoaiPhim entity, RedirectAttributes rs) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/TheLoaiPhim/index";
			}
			try {
				dao.create(entity);
				rs.addFlashAttribute("message", "Thêm mới thành công");
			} catch (Exception e) {
				rs.addFlashAttribute("message", "Thêm mới thất bại");
			}

			model.addAttribute("listTL", dao.findAll());
			return "redirect:/admin/TheLoaiPhim/index";
		} catch (Exception e) {
			rs.addFlashAttribute("message", "Thêm mới thất bại");
			return "redirect:/admin/TheLoaiPhim/index";
		}
	}

	@RequestMapping("/admin/TheLoaiPhim/update")
	public String update(Model model, @ModelAttribute("form") TheLoaiPhim entity, RedirectAttributes rs) {
		try {

			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/TheLoaiPhim/index";
			}
			dao.update(entity);
			rs.addFlashAttribute("message", "Cập nhật thành công");
			model.addAttribute("listTL", dao.findAll());
			return "redirect:/admin/TheLoaiPhim/edit/" + entity.getMaTheLoai();
		} catch (Exception e) {
			rs.addFlashAttribute("message", "Cập nhật thất bại");
			return "redirect:/admin/TheLoaiPhim/edit/" + entity.getMaTheLoai();
		}
	}

	@RequestMapping("/admin/TheLoaiPhim/delete")
	public String delete(Model model, @ModelAttribute("form") TheLoaiPhim entity, RedirectAttributes rs) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/TheLoaiPhim/index";
			}
			if (daoP.findByMaTL(entity.getMaTheLoai()).isEmpty()) {
				dao.delete(entity.getMaTheLoai());
				rs.addFlashAttribute("message", "Xóa thành công");
				model.addAttribute("listTL", dao.findAll());
				return "redirect:/admin/TheLoaiPhim/index";
			} else {
				{
					rs.addFlashAttribute("message", "Thể loại phim đang được sử dụng - Phim, không thể xóa");
					model.addAttribute("listTL", dao.findAll());
					return "redirect:/admin/TheLoaiPhim/index";
				}
			}
		} catch (Exception e) {
			rs.addFlashAttribute("message", "Xóa thất bại");
			return "redirect:/admin/TheLoaiPhim/index";
		}
	}
}
