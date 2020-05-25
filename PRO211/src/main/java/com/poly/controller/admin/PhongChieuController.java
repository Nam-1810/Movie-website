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
import com.poly.dao.GheNgoiDAO;
import com.poly.dao.LichChieuPhimDAO;
import com.poly.dao.PhongChieuPhimDAO;
import com.poly.entity.NhanVien;
import com.poly.entity.PhongChieuPhim;

@Transactional
@Controller

public class PhongChieuController {
	@Autowired
	PhongChieuPhimDAO dao;
	
	@Autowired
	ChiNhanhDAO daoCN;
	
	@Autowired
	LichChieuPhimDAO daoLC;
	
	@Autowired
	GheNgoiDAO daoGhe;
	
	@Autowired
	HttpSession session;

	String message = "Bạn không có quyền thực hiện thao tác này";
	NhanVien nv;

	@RequestMapping("/admin/PhongChieuPhim/index")
	public String index(Model model) {
		model.addAttribute("form", new PhongChieuPhim());
		model.addAttribute("listPC", dao.findAll());
		model.addAttribute("listCN", daoCN.findAll());
		return "admin/PhongChieuPhim/index";
	}

	@RequestMapping("/admin/PhongChieuPhim/edit/{id}")
	public String edit(Model model, @PathVariable("id") String MaPhong) {
		PhongChieuPhim entity = dao.findById(MaPhong);
		model.addAttribute("form", entity);
		model.addAttribute("listPC", dao.findAll());
		model.addAttribute("listCN", daoCN.findAll());
		return "admin/PhongChieuPhim/index";
	}

	@RequestMapping("/admin/PhongChieuPhim/create")
	public String create(Model model, @ModelAttribute("form") PhongChieuPhim entity, RedirectAttributes rs) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/PhongChieuPhim/index";
			}
			try {
				dao.create(entity);
				model.addAttribute("message", "Thêm mới thành công");
			} catch (Exception e) {
				model.addAttribute("message", "Thêm mới thất bại");
			}

			model.addAttribute("listPC", dao.findAll());
			return "redirect:/admin/PhongChieuPhim/index";
		} catch (Exception e) {
			model.addAttribute("message", "Thêm mới thất bại");
			return "redirect:/admin/PhongChieuPhim/index";
		}
	}

	@RequestMapping("/admin/PhongChieuPhim/update")
	public String update(Model model, @ModelAttribute("form") PhongChieuPhim entity, RedirectAttributes rs) {
		nv = (NhanVien) session.getAttribute("nhanvien");
		if (nv.getChucVu() == false) {
			rs.addFlashAttribute("message", message);
			return "redirect:/admin/PhongChieuPhim/index";
		}
		nv = (NhanVien) session.getAttribute("nhanvien");
		dao.update(entity);
		model.addAttribute("listPC", dao.findAll());
		return "redirect:/admin/PhongChieuPhim/edit/" + entity.getMaPhong();
	}

	@RequestMapping("/admin/PhongChieuPhim/delete")
	public String delete(Model model, @ModelAttribute("form") PhongChieuPhim entity, RedirectAttributes rs) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/PhongChieuPhim/list";
			}

			if (daoLC.findByPhongChieu(entity.getMaPhong()).isEmpty() == false) {
				rs.addFlashAttribute("message", "Phòng đang được sử dụng - Lịch chiếu, không thể xóa");
				model.addAttribute("listPC", dao.findAll());
				return "redirect:/admin/PhongChieuPhim/index";
			} else if (daoGhe.findByPhongChieu(entity.getMaPhong()).isEmpty() == false) {
				rs.addFlashAttribute("message", "Phòng đang được sử dụng - Ghế ngồi, không thể xóa");
				model.addAttribute("listPC", dao.findAll());
				return "redirect:/admin/PhongChieuPhim/index";
			} else {
				dao.delete(entity.getMaPhong());
				rs.addFlashAttribute("message", "Xóa thành công");
				model.addAttribute("listPC", dao.findAll());
				return "redirect:/admin/PhongChieuPhim/index";
			}
		} catch (Exception e) {
			rs.addFlashAttribute("message", "Xóa thất bại");
			model.addAttribute("listPC", dao.findAll());
			return "redirect:/admin/PhongChieuPhim/index";
		}
	}
	
	@RequestMapping("/admin/PhongChieuPhim/delete/{maPhong}")
	public String delete(Model model, @PathVariable("maPhong") String maPhong, RedirectAttributes rs) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/PhongChieuPhim/list";
			}

			if (daoLC.findByPhongChieu(maPhong).isEmpty() == false) {
				rs.addFlashAttribute("message", "Phòng đang được sử dụng - Lịch chiếu, không thể xóa");
				model.addAttribute("listPC", dao.findAll());
				return "redirect:/admin/PhongChieuPhim/index";
			} else if (daoGhe.findByPhongChieu(maPhong).isEmpty() == false) {
				rs.addFlashAttribute("message", "Phòng đang được sử dụng - Ghế ngồi, không thể xóa");
				model.addAttribute("listPC", dao.findAll());
				return "redirect:/admin/PhongChieuPhim/index";
			} else {
				dao.delete(maPhong);
				rs.addFlashAttribute("message", "Xóa thành công");
				model.addAttribute("listPC", dao.findAll());
				return "redirect:/admin/PhongChieuPhim/index";
			}
		} catch (Exception e) {
			rs.addFlashAttribute("message", "Xóa thất bại");
			model.addAttribute("listPC", dao.findAll());
			e.printStackTrace();
			return "redirect:/admin/PhongChieuPhim/index";
		}
	}
}
