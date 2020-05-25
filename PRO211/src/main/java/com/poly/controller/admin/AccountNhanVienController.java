package com.poly.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

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

import com.poly.dao.NhanVienDAO;
import com.poly.entity.NhanVien;
import com.poly.services.EmailServices;

@Controller
public class AccountNhanVienController {
	@Autowired
	NhanVienDAO dao;
	
	@Autowired
	EmailServices send;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/admin/ThongTinNV")
	public String ThongTinNV(Model model) {
		NhanVien nv = (NhanVien) session.getAttribute("nhanvien");
		model.addAttribute("formCTNV",nv);
		return "admin/ThongTinNV";
	}
	
	@RequestMapping("/admin/dangnhap")
	public String dangNhapAdmin(Model model) {
		return "admin/dangnhap";
	}
	
	@PostMapping("/admin/dangnhap/kiemtra")
	public String checkDangNhapNV(Model model,@ModelAttribute("email") String email, @ModelAttribute("matKhau") String matKhau) {	
		NhanVien nhanVien = dao.findByEmail(email);
		if(nhanVien == null) {
			model.addAttribute("message","Email không tồn tại");
			return "admin/dangnhap";
		} if(!nhanVien.getMatKhau().equals(matKhau)) {
			model.addAttribute("message","Mật khẩu không đúng");
			model.addAttribute("email",email);
			return "admin/dangnhap";
		} else {
			session.setAttribute("maNV", nhanVien.getMaNhanVien());
			session.setAttribute("tenNV", nhanVien.getEmail());
			session.setAttribute("nhanvien",nhanVien);
			String urlnv = (String) session.getAttribute("back-urlnv");
			if(urlnv != null) {
				session.setAttribute("message",null);
				return "redirect:" + urlnv;
			}
			return "redirect:/admin/ThongTinNV";
		}
	}
	
	@RequestMapping("/admin/CTNV/update")
	public String updateNV(Model model,@Validated @ModelAttribute("formCTNV") NhanVien entity,
			BindingResult errors, RedirectAttributes re) {
		if(errors.hasErrors()) {
			List<NhanVien> list = dao.findAll();
			model.addAttribute("nhanvien", list);
			model.addAttribute("message","loi");
			
			return "admin/ThongTinNV";
		}try {
		dao.update(entity);
		model.addAttribute("list", dao.findAll());
		re.addFlashAttribute("message","ThanhCong");
		} catch (Exception e) {
		System.out.println(e);}
		return "redirect:/detailNV/" + entity.getEmail();
	}
	
	@RequestMapping("/ThongTinNV/{tenNV}")
	public String detailNV(Model model, @PathVariable("tenNV") String email) {
		NhanVien item = dao.findByEmail(email);
		model.addAttribute("item", item);
		model.addAttribute("formCTNV", item);
		return "admin/ThongTinNV";
	}
	
	//Quên mật khẩu
	@RequestMapping("/admin/quenmatkhau")
	public String quenMatKhau(Model model) {
		return "admin/quenmatkhau";
	}
	
	@PostMapping("/admin/quenmatkhau/kiemtra")
	public String quenMatKhauCheck(Model model, @ModelAttribute("email") String email) {
		try {
			NhanVien nhanVien = dao.findByEmail(email);
			if(nhanVien == null) {
				model.addAttribute("message","Email không tồn tại");
				return "admin/quenmatkhau";
			}
			else{
				send.EmailDoiMatKhau(email, nhanVien.getMatKhau());
				model.addAttribute("message","Đổi mật khẩu thành công, vui lòng đăng nhập lại");
				session.setAttribute("nhanvien",null);
				return "admin/dangnhap";
			}
		}catch (Exception e) {
			model.addAttribute("message","Thao tác thất bại!");
			return "admin/quenmatkhau";
		}
	}
	
	@RequestMapping("/admin/doimatkhau")
	public String doiMatKhau(Model model) {
		return "admin/doimatkhau";
	}
	
	@PostMapping("/admin/doimatkhau/kiemtra")
	public String doiMatKhauCheck(Model model, @ModelAttribute("email") String email, @ModelAttribute("matKhau") String matKhau, 
			@ModelAttribute("newMatKhau") String newMatKhau, @ModelAttribute("renewMatKhau") String renewMatKhau, RedirectAttributes ra) {
		NhanVien nhanVien = dao.findByEmail(email);
		try{
			if(nhanVien == null) {
				model.addAttribute("message","Email không tồn tại");
				return "admin/doimatkhau";
				}else if(!nhanVien.getMatKhau().equals(matKhau)) {
					model.addAttribute("message","Mật khẫu không đúng");
					model.addAttribute("email",email);
					return "admin/doimatkhau";
					}else if(!renewMatKhau.equals(newMatKhau)){
						model.addAttribute("message","Mật khẫu không trùng khớp");
						model.addAttribute("email",email);
						return "admin/doimatkhau";
			}else {
				nhanVien.setMatKhau(newMatKhau);
				dao.update(nhanVien);
				send.EmailDoiMatKhau(email, newMatKhau);
				ra.addFlashAttribute("message","Đổi mật khẩu thành công, vui lòng đăng nhập lại");
				session.setAttribute("nhanvien",null);
				return "redirect:/admin/dangnhap";
			}		
		}
		catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message","Đổi mật khẩu thất bại");
			return "admin/doimatkhau";
		}
		
	}
	
	@RequestMapping("/admin/dangxuat")
	public String dangXuatAdmin(Model model) {
		session.setAttribute("nhanvien",null);
		session.removeAttribute("back-urlnv");
		return "redirect:/admin/dangnhap";
	}
}
