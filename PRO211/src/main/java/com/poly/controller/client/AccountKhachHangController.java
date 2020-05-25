package com.poly.controller.client;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.dao.ChiTietVeDAO;
import com.poly.dao.KhachHangDAO;
import com.poly.entity.KhachHang;
import com.poly.services.EmailServices;

@Controller
public class AccountKhachHangController {
	@Autowired
	KhachHangDAO dao;
	
	@Autowired
	ChiTietVeDAO daoCT;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	EmailServices send;
		
		///Client tạo tài khoản khách hàng
		@PostMapping("/DangKy") 
		public String createClient(Model model,@Validated @ModelAttribute("form") KhachHang khachHang, @ModelAttribute("nhapLaiMK") String nhapLaiMK, RedirectAttributes re, BindingResult errors) {
			if(errors.hasErrors()) {
				model.addAttribute("messageDK","Lỗi không thể đăng ký !");
				return "index";
			}
			try {
				 if(dao.findByEmail(khachHang.getEmail()) == null) { 
					 if(!khachHang.getMatKhau().equals(nhapLaiMK)) {
						 model.addAttribute("messageDK","Mật khẩu nhập lại không đúng");
						 return "index";
					 }
					dao.create(khachHang);
					re.addFlashAttribute("messageDK","Đăng ký thành công");	
					return "redirect:/index";
				 }
				 else {
					 model.addAttribute("messageDK","Email đã được sử dụng vui lòng nhập email khác");
					 return "index";
				 }
			}
			catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("messageDK","Đăng ký thất bại");
				return "index";
			}	
		}
		
		// Đăng nhập
		@PostMapping("/DangNhap")
		public String checkDangNhap(Model model, @ModelAttribute("email") String email,
				@ModelAttribute("matKhau") String matKhau) {
			String urlkh = (String) session.getAttribute("back-urlkh");
			KhachHang khachHang = dao.findByEmail(email);
			if (khachHang == null) {
				model.addAttribute("messageDN", "Email không tồn tại");
				model.addAttribute("form", new KhachHang());
				if(urlkh != null) {
					return "/DangNhap";
				}
					return "index";		
			} else if (!khachHang.getMatKhau().equals(matKhau)) {
				model.addAttribute("messageDN", "Mật khẩu không đúng");
				model.addAttribute("email", email);
				model.addAttribute("form", new KhachHang());
				if(urlkh != null) {
					return "/DangNhap";
				}
				return "index";
			} else {
				session.setAttribute("khachhang", khachHang);
				session.setAttribute("DangNhapHidden","display:none");
				session.setAttribute("DangXuatHidden","display:");
				if (urlkh != null) {
					session.setAttribute("message", null);
					return "redirect:" + urlkh;
				}
				return "redirect:/index";
			}
		}
		
		
		@PostMapping("/QuenMatKhau")
		public String QuenMatKhau(Model model, @ModelAttribute("email") String email, RedirectAttributes re) {
			KhachHang khachHang = dao.findByEmail(email);
			try {
				if(khachHang == null) {
					re.addFlashAttribute("message","Email không tồn tại");
					return "redirect:/index";
				}
				else {
					send.EmailQuenMatKhau(email, khachHang.getMatKhau());
					re.addFlashAttribute("message","Mật khẩu đã được gửi đến email của bạn !");
					return "redirect:/index";
				}
			}catch (Exception e) {
				re.addFlashAttribute("message","Thao tác thất bại!");
				return "redirect:/index";
			}
			
		}
		
		//Đổi mật khẩu
		@RequestMapping("/DoiMatKhau")
		public String DoiMatKhau(Model model) {
			model.addAttribute("form",new KhachHang());
			return "DoiMatKhau";
		}
		
		@PostMapping("/DoiMatKhau/kiemtra")
		public String DoiMatKhauCheck(Model model, @ModelAttribute("email") String email, @ModelAttribute("matKhau") String matKhau, 
				@ModelAttribute("newMatKhau") String newMatKhau,@ModelAttribute("renewMatKhau") String renewMatKhau, RedirectAttributes ra) {
			KhachHang khachHang = dao.findByEmail(email);
			try {
				if(khachHang == null) {
					ra.addFlashAttribute("message","Email không tồn tại");
					return "redirect:/DoiMatKhau";
					}else if(!khachHang.getMatKhau().equals(matKhau)) {
						ra.addFlashAttribute("message","Mật khẫu cũ không đúng");
						ra.addFlashAttribute("email",email);
						return "redirect:/DoiMatKhau";
						}else if(!renewMatKhau.equals(newMatKhau)){
							ra.addFlashAttribute("message","Mật khẫu không trùng khớp");
							ra.addFlashAttribute("email",email);
							return "redirect:/DoiMatKhau";
				}else {
					khachHang.setMatKhau(newMatKhau);
					dao.update(khachHang);
					send.EmailDoiMatKhau(email, newMatKhau);
					ra.addAttribute("messageDN","Đổi mật khẩu thành công, vui lòng đăng nhập lại");
					session.setAttribute("khachhang",null);
					return "redirect:/DangNhap";
				}
			}catch (Exception e) {
				e.printStackTrace();
				ra.addFlashAttribute("message","Đổi mật khẩu thất bại");
				return "redirect:/DoiMatKhau";
			}
		}
		
		
		///Đăng xuất
		@RequestMapping("/DangXuat")
		public String dangXuat(Model model) {
			session.setAttribute("khachhang",null);
			session.setAttribute("DangXuatHidden","display:none");
			session.removeAttribute("back-urlkh");
			session.removeAttribute("DangNhapHidden"); 	
			return "redirect:/DangNhap";
		}
		
		@RequestMapping("/UpdateKhachHang")
		public String updateNV(Model model,@Validated @ModelAttribute("formCTKH") KhachHang entity,
				BindingResult errors, RedirectAttributes re) {
			if(errors.hasErrors()) {
				re.addFlashAttribute("message", "Lỗi sai định dạng");
				return "redirect:/ThongTinKH/";
			}try {
			dao.update(entity);
			session.setAttribute("khachhang",entity);
			re.addFlashAttribute("message","Chỉnh sửa thành công !");
			} catch (Exception e) {
				re.addFlashAttribute("message","Chỉnh sửa thất bại !");
			}
			return "redirect:/ThongTinKH";
		}

		@RequestMapping("/ThongTinKH")
		public String ThongTinKH(Model model) {
			KhachHang kh = (KhachHang) session.getAttribute("khachhang");
			model.addAttribute("form",new KhachHang());
			model.addAttribute("item", kh);
			model.addAttribute("formCTKH", kh);
			model.addAttribute("listVe",daoCT.findByKH(kh.getMaKhachHang()));
			return "/ThongTinKH";
		}
}


