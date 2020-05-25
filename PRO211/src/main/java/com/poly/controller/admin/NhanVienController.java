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

import com.poly.dao.DatVeDAO;
import com.poly.dao.NhanVienDAO;
import com.poly.entity.NhanVien;


@Controller
public class NhanVienController {
	@Autowired
	NhanVienDAO dao;
	
	@Autowired
	DatVeDAO daoDV;
	
	@Autowired
	HttpSession session;
	
	String message = "Bạn không có quyền thực hiện thao tác này";
	NhanVien nv;
	
	
	//Trang danh sách nhân viên
	@RequestMapping("/admin/nhanvien")
	public String index(Model model) {
		model.addAttribute("_new","disabled");
		model.addAttribute("listNV", dao.findAll());
		model.addAttribute("form",new NhanVien());
		return "admin/nhanvien";
	}
	
	//Chức năng thêm viên sửa nhân viên
	@PostMapping("/admin/nhanvien/create") 
	public String create(Model model,@Validated @ModelAttribute("form") NhanVien nhanVien, BindingResult errors, RedirectAttributes re) {
		if(errors.hasErrors()) {
			return "redirect:/admin/nhanvien";
		}
		try {
			 if(nhanVien.getMaNhanVien() == null) {
				 if(dao.findByEmail(nhanVien.getEmail()) != null) {
					 model.addAttribute("message","Email đã tồn tại");
					 model.addAttribute("listNV", dao.findAll());
					 model.addAttribute("form", nhanVien);
					return "admin/nhanvien";
				 }else{
					 dao.create(nhanVien);
					 re.addFlashAttribute("message","Thêm thành công");
					 return "redirect:/admin/nhanvien";
				 }
			 }else {
				 try {
					 dao.update(nhanVien);
					 re.addFlashAttribute("message","Sửa thành công");
					 return "redirect:/admin/nhanvien"; 
				 }
				 catch (Exception e) {
					model.addAttribute("nhanvien", dao.findAll());
					model.addAttribute("form",nhanVien);
					model.addAttribute("message","Sửa mới thất bại");
					return "admin/nhanvien";
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			List<NhanVien> list = dao.findAll();
			model.addAttribute("listNV", list);
			model.addAttribute("form",nhanVien);
			model.addAttribute("message","Thêm mới thất bại");
		}
		return "admin/nhanvien";
	}
	
	//Lấy thông tin khách hàng điền vào form để chỉnh sửa
	@RequestMapping("/admin/nhanvien/edit/{maNhanVien}")
	public String edit(Model model, @PathVariable("maNhanVien") Integer maNhanVien) {
		model.addAttribute("listNV",  dao.findAll());
		model.addAttribute("form", dao.findById(maNhanVien));
		model.addAttribute("clear","disabled");
		model.addAttribute("_new","");
		model.addAttribute("readonly","true");
		return "admin/nhanvien";
	}
	
	// Xóa thông tin khách hàng trên danh sách
		@RequestMapping("/admin/nhanvien/delete/{maNV}/{maNhanVien}")
		public String delete(Model model, @PathVariable("maNV") Integer maNV, @PathVariable("maNhanVien") Integer maNhanVien,RedirectAttributes rs) {
			if (maNV == maNhanVien) {
				rs.addFlashAttribute("message", "Tài khoản đang đăng nhập, không thể xóa");
				return "redirect:/admin/nhanvien";
			}
			else if (daoDV.findByNhanVien(maNhanVien).isEmpty() == false) {
				rs.addFlashAttribute("message", "Nhân viên đang được sử dụng - Đặt vé, không thể xóa");
				return "redirect:/admin/nhanvien";
			}
			else {
				dao.delete(maNhanVien);
				rs.addFlashAttribute("message", "Xóa thành công");
				return "redirect:/admin/nhanvien";
			}
		}
	
	//Làm mới ô nhập nhân viên
	@RequestMapping("/admin/nhanvien/clear")
	public String clear(Model model) {
		return "redirect:/admin/nhanvien";
	}

}
