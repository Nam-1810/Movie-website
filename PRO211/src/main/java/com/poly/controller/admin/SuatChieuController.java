package com.poly.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.LichChieuPhimDAO;
import com.poly.dao.SuatChieuDAO;
import com.poly.entity.LichChieuPhim;
import com.poly.entity.NhanVien;
import com.poly.entity.SuatChieu;

@Controller
public class SuatChieuController {
	@Autowired
	SuatChieuDAO dao;
	@Autowired
	LichChieuPhimDAO daoLC;
	@Autowired
	HttpSession session;

	String message = "Bạn không có quyền thực hiện thao tác này";
	NhanVien nv;

	@RequestMapping("/admin/SuatChieu/list")
	public String list(Model model) {
		List<SuatChieu> list = dao.findAll();
		model.addAttribute("form", new SuatChieu());
		model.addAttribute("list", list);
		return "/admin/SuatChieu/list";
	}

	@RequestMapping("/admin/SuatChieu/edit/{maSuatChieu}")
	public String edit(Model model, @PathVariable("maSuatChieu") Integer maSuatChieu) {
		SuatChieu entity = dao.findById(maSuatChieu);
		model.addAttribute("form", entity);
		model.addAttribute("list", dao.findAll());
		return "/admin/SuatChieu/list";
	}

	@PostMapping("/admin/SuatChieu/update")
	public String update(Model model, @ModelAttribute("form") SuatChieu entity) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				model.addAttribute("message", message);
				return "admin/SuatChieu/list";
			}
			SuatChieu sc = dao.findById(entity.getMaSuatChieu());

			if (sc == null) {
				dao.create(entity);
				model.addAttribute("list", dao.findAll());
				model.addAttribute("message", "Cập nhật thành công");
				return "admin/SuatChieu/list";
			} else {
				model.addAttribute("message", "Cập nhật thất bại");
				dao.update(entity);
			}
			model.addAttribute("list", dao.findAll());
			return "/admin/SuatChieu/list";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "Cập nhật thất bại");
			return "/admin/SuatChieu/list";
		}
	}

	@RequestMapping("/admin/SuatChieu/delete")
	public String delete(Model model, @ModelAttribute("form") SuatChieu entity) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				model.addAttribute("message", message);
				return "admin/SuatChieu/list";
			}
			List<LichChieuPhim> listLC = daoLC.findBySuatChieu(entity.getMaSuatChieu());
			if (listLC.isEmpty()) {
				dao.delete(entity.getMaSuatChieu());
				model.addAttribute("list", dao.findAll());
				model.addAttribute("message", "Xóa thành công");
				return "/admin/SuatChieu/list";
			} else {
				model.addAttribute("message", "Suất chiếu đang được sử dụng - Lịch chiếu, không thể xóa");
				model.addAttribute("list", dao.findAll());
				return "/admin/SuatChieu/list";
			}

		} catch (Exception e) {
			model.addAttribute("message", "Xóa thất bại");
			model.addAttribute("list", dao.findAll());
			return "/admin/SuatChieu/list";
		}
	}
}
