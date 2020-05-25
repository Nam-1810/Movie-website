package com.poly.controller.admin;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.dao.LichChieuPhimDAO;
import com.poly.dao.PhimDAO;
import com.poly.dao.TheLoaiPhimDAO;
import com.poly.entity.NhanVien;
import com.poly.entity.Phim;

@Transactional
@Controller

public class PhimController {
	@Autowired
	PhimDAO dao;

	@Autowired
	ServletContext app;

	@Autowired
	TheLoaiPhimDAO tlpDAO;

	@Autowired
	LichChieuPhimDAO daoLC;

	@Autowired
	HttpSession session;

	String message = "Bạn không có quyền thực hiện thao tác này";
	NhanVien nv;

	@RequestMapping("/admin/Phim/index")
	public String index(Model model) {
		model.addAttribute("form", new Phim());
		model.addAttribute("listtl", tlpDAO.findAll());
		model.addAttribute("listP", dao.findAll());
		return "admin/Phim/index";
	}

	@RequestMapping("/admin/Phim/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer maPhim) {
		Phim entity = dao.findById(maPhim);
		model.addAttribute("form", entity);
		model.addAttribute("listP", dao.findAll());
		model.addAttribute("listtl", tlpDAO.findAll());
		return "admin/Phim/index";
	}

	@RequestMapping("/admin/Phim/create")
	public String create(Model model, @ModelAttribute("form") Phim entity, RedirectAttributes rs,
			@RequestParam("up_photo") MultipartFile file) {
		{
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/Phim/index";
			}
			if (file.isEmpty()) {
				entity.setHinhPhim("p1.png");
			} else {
				entity.setHinhPhim(file.getOriginalFilename());
				try {
					String pathlink = app.getRealPath("/img/phim/" + entity.getHinhPhim());
					file.transferTo(new File(pathlink));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			try {
				dao.create(entity);
				rs.addFlashAttribute("message", "Thêm mới thành công");
			} catch (Exception e) {
				rs.addFlashAttribute("message", "Thêm mới thất bại");
			}

			model.addAttribute("listP", dao.findAll());
			return "redirect:/admin/Phim/index";
		}
	}

	@RequestMapping("/admin/Phim/update")
	public String update(Model model, @ModelAttribute("form") Phim entity, RedirectAttributes rs,
			@RequestParam(value = "up_photo", required = false) MultipartFile up_photo,
			@RequestParam("old_photo") String old_photo) {
		nv = (NhanVien) session.getAttribute("nhanvien");
		if (nv.getChucVu() == false) {
			rs.addFlashAttribute("message", message);
			return "redirect:/admin/Phim/index";
		}
		if (!up_photo.isEmpty()) {
			try {
				entity.setHinhPhim(up_photo.getOriginalFilename());
				up_photo.transferTo(new File(app.getRealPath("/img/phim/" + up_photo.getOriginalFilename())));
			} catch (Exception e) {
				model.addAttribute("message", "loi");
				e.getStackTrace();
			}
			dao.update(entity);
			model.addAttribute("listP", dao.findAll());
			model.addAttribute("listtl", tlpDAO.findAll());
		} else if (up_photo.isEmpty()) {
			try {
				entity.setHinhPhim(old_photo);
				dao.update(entity);
				rs.addFlashAttribute("message", "Cập nhật thành công");
				model.addAttribute("listP", dao.findAll());
				model.addAttribute("listtl", tlpDAO.findAll());
			} catch (Exception e) {
				rs.addFlashAttribute("message", "Cập nhật thất bại");
				e.getStackTrace();
			}
		}

		return "redirect:/admin/Phim/edit/" + entity.getMaPhim();
	}

	@RequestMapping("/admin/Phim/delete")
	public String delete(Model model, @ModelAttribute("form") Phim entity, RedirectAttributes rs) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/Phim/index";
			}
			if (daoLC.findByMaPhim(entity.getMaPhim()).isEmpty() == false) {
				// Phim đang được sử dụng - bảng liên kết, không thể xóa
				rs.addFlashAttribute("message", "Phim đang được sử dụng - Lịch chiếu, không thể xóa");
				model.addAttribute("listP", dao.findAll());
				model.addAttribute("listtl", tlpDAO.findAll());
				return "redirect:/admin/Phim/index";
			} else {
				dao.delete(entity.getMaPhim());
				rs.addFlashAttribute("message", "Xóa thành công");
				model.addAttribute("listP", dao.findAll());
				model.addAttribute("listtl", tlpDAO.findAll());
				return "redirect:/admin/Phim/index";
			}

		} catch (Exception e) {
			rs.addFlashAttribute("message", "Xóa thất bại");
			return "redirect:/admin/Phim/index";
		}
	}
}
