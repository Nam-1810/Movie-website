package com.poly.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.dao.LichChieuPhimDAO;
import com.poly.dao.PhimDAO;
import com.poly.dao.PhongChieuPhimDAO;
import com.poly.dao.SuatChieuDAO;
import com.poly.dao.VeDAO;
import com.poly.entity.LichChieuPhim;
import com.poly.entity.NhanVien;

@Controller
public class LichChieuController {
	@Autowired
	LichChieuPhimDAO dao;
	
	@Autowired
	PhimDAO daoP;
	
	@Autowired
	PhongChieuPhimDAO daoPC;
	
	@Autowired
	SuatChieuDAO daoSC;
	
	@Autowired
	VeDAO daoVe;
	
	@Autowired
	HttpSession session;

	String message = "Bạn không có quyền thực hiện thao tác này";
	NhanVien nv;
	
	public void model(Model model) {
		model.addAttribute("list", dao.findAll());
		model.addAttribute("listP",daoP.DangChieuVaSapChieu());
		model.addAttribute("listPCP",daoPC.findAll());
		model.addAttribute("listSC",daoSC.findAll());
	}

	@RequestMapping("/admin/LichChieu/list")
	public String listLCP(Model model) {
		model.addAttribute("form", new LichChieuPhim());
		model(model);
		return "/admin/LichChieu/list";
	}

	@RequestMapping("/admin/LichChieu/PhimDaChieu")
	public String PhimDaChieu(Model model) {
		model.addAttribute("form", new LichChieuPhim());
		model(model);
		return "/admin/LichChieu/list";
	}

	@RequestMapping("/admin/LichChieu/PhimDangChieu")
	public String PhimDangChieu(Model model) {
		model.addAttribute("form", new LichChieuPhim());
		model(model);
		return "/admin/LichChieu/list";
	}

	@RequestMapping("/admin/LichChieu/PhimSapChieu")
	public String PhimSapChieu(Model model) {
		model.addAttribute("form", new LichChieuPhim());
		model(model);
		return "/admin/LichChieu/list";
	}

	@RequestMapping("/admin/LichChieu/edit/{maLichChieu}")
	public String edit(Model model, @PathVariable("maLichChieu") Integer maLichChieu) {
		model.addAttribute("form", new LichChieuPhim());
		model(model);
		return "/admin/LichChieu/list";
	}

	@RequestMapping("/admin/LichChieu/create")
	public String create(Model model, @ModelAttribute("form") LichChieuPhim entity, RedirectAttributes rs) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/LichChieu/list";
			}
			dao.create(entity);
			rs.addFlashAttribute("message", "Thêm mới thành công");
			model(model);
			return "redirect:/admin/LichChieu/list";
		} catch (Exception e) {
			rs.addFlashAttribute("message", "Thêm mới thất bại");
			return "redirect:/admin/LichChieu/list";
		}
	}

	@RequestMapping("/admin/LichChieu/update")
	public String update(Model model, @ModelAttribute("form") LichChieuPhim entity, RedirectAttributes rs) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/LichChieu/list";
			}
			dao.update(entity);
			rs.addFlashAttribute("message", "Cập nhật thành công");
			model(model);
			return "/admin/LichChieu/list";
		} catch (Exception e) {
			rs.addFlashAttribute("message", "Cập nhật thất bại");
			return "/admin/LichChieu/list";
		}
	}

	@RequestMapping("/admin/LichChieu/delete")
	public String delete(Model model, @ModelAttribute("form") LichChieuPhim entity, RedirectAttributes rs) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/LichChieu/list";
			}
			if (daoVe.findByMaLichChieu(entity.getMaLichChieu()).isEmpty()) {
				dao.delete(entity.getMaLichChieu());
				rs.addFlashAttribute("message", "Xóa thành công");
				model(model);
				return "redirect:/admin/LichChieu/list";
			} else {
				rs.addFlashAttribute("message", "Lịch chiếu đang được sử dụng - Vé, Không thể xóa");
				model(model);
				return "redirect:/admin/LichChieu/list";
			}

		} catch (Exception e) {
			rs.addFlashAttribute("message", "Xóa thất bại");
			return "redirect:/admin/LichChieu/list";
		}
	}
	
	@RequestMapping("/admin/LichChieu/delete/{maLichChieu}")
	public String delete(Model model, @PathVariable("maLichChieu") Integer maLichChieu, RedirectAttributes rs) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				rs.addFlashAttribute("message", message);
				return "redirect:/admin/LichChieu/list";
			}
			if (daoVe.findByMaLichChieu(maLichChieu).isEmpty()) {
				dao.delete(maLichChieu);
				rs.addFlashAttribute("message", "Xóa thành công");
				model(model);
				return "redirect:/admin/LichChieu/list";
			} else {
				rs.addFlashAttribute("message", "Lịch chiếu đang được sử dụng - Vé, Không thể xóa");
				model(model);
				return "redirect:/admin/LichChieu/list";
			}

		} catch (Exception e) {
			rs.addFlashAttribute("message", "Xóa thất bại");
			return "redirect:/admin/LichChieu/list";
		}
	}
}
