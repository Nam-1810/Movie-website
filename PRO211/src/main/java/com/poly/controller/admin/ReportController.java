package com.poly.controller.admin;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.dao.ReportDAO;
import com.poly.entity.NhanVien;

@Transactional
@Controller
public class ReportController {
	@Autowired
	ReportDAO dao;
	@Autowired
	HttpSession session;

	String message = "Bạn không có quyền thực hiện thao tác này";
	NhanVien nv;

	@RequestMapping("admin/reportDTTL")
	String reportDT(Model model, RedirectAttributes re) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				re.addFlashAttribute("message", "Bạn không có quyền để sử dụng chức năng này, vui lòng đăng nhập lại :)");
				return  "redirect:/admin/ThongTinNV";
			}
			model.addAttribute("data1", dao.doanhThuTheLoai());
			return "admin/report/reportDTP";
		}
		catch(NullPointerException e) {
			re.addFlashAttribute("message", "Không có dữ liệu thống kê :)");
			return  "redirect:/admin/ThongTinNV";
		}	
	}

	@RequestMapping("admin/reportP")
	String reportP(Model model , RedirectAttributes re) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				re.addFlashAttribute("message", "Bạn không có quyền để sử dụng chức năng này, vui lòng đăng nhập lại :)");
				return  "redirect:/admin/ThongTinNV";
			}
			model.addAttribute("data", dao.doanhThuPhim());
			model.addAttribute("data5", dao.doanhThuNgay());
			return "admin/report/reportP";
		}
		catch(NullPointerException e) {
			re.addFlashAttribute("message", "Không có dữ liệu thống kê :)");
			return  "redirect:/admin/ThongTinNV";
		}
	}

	@RequestMapping("admin/reportCN")
	String reportCN(Model model , RedirectAttributes re) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				re.addFlashAttribute("message", "Bạn không có quyền để sử dụng chức năng này, vui lòng đăng nhập lại :)");
				return  "redirect:/admin/ThongTinNV";
			}
			model.addAttribute("data2", dao.doanhThuChiNhanh());
			return "admin/report/reportCN";
		}
		
		catch(NullPointerException e) {
			re.addFlashAttribute("message", "Không có dữ liệu thống kê :)");
			return  "redirect:/admin/ThongTinNV";
		}
	}

	@RequestMapping("admin/reportKH")
	String reportKH(Model model , RedirectAttributes re) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				re.addFlashAttribute("message", "Bạn không có quyền để sử dụng chức năng này, vui lòng đăng nhập lại :)");		
				return  "redirect:/admin/ThongTinNV";
			}
			model.addAttribute("data3", dao.doanhThuKhacHang());
			return "admin/report/reportKH";
		}
		catch(NullPointerException e) {
			re.addFlashAttribute("message", "Không có dữ liệu thống kê :)");
			return  "redirect:/admin/ThongTinNV";
		}
	}

	@RequestMapping("admin/reportDG")
	String reportDG(Model model , RedirectAttributes re) {
		try {
			nv = (NhanVien) session.getAttribute("nhanvien");
			if (nv.getChucVu() == false) {
				re.addFlashAttribute("message", "Bạn không có quyền để sử dụng chức năng này, vui lòng đăng nhập lại :)");
				return  "redirect:/admin/ThongTinNV";
			}
			model.addAttribute("data4", dao.diemDanhGia());
			return "admin/report/reportDG";
		}
		catch(NullPointerException e) {
			re.addFlashAttribute("message", "Không có dữ liệu thống kê :)");
			return  "redirect:/admin/ThongTinNV";
		}
	}
	/*
	 * @RequestMapping("admin/reportDTNgay") String reportNgay(Model model) {
	 * model.addAttribute("data5",dao.doanhThuNgay()); return
	 * "admin/report/reportP"; }
	 */
}
