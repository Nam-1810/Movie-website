package com.poly.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.dao.GheNgoiDAO;
import com.poly.dao.LichChieuPhimDAO;
import com.poly.dao.PhimDAO;
import com.poly.dao.VeDAO;
import com.poly.entity.LichChieuPhim;
import com.poly.entity.Ve;

@Controller
public class VeController {
	@Autowired
	VeDAO daoV;
	
	@Autowired
	LichChieuPhimDAO daoLC;
	
	@Autowired
	PhimDAO daoP;
	
	@Autowired
	GheNgoiDAO daoG;
	
	//View danh sách vé trang của admin
	@RequestMapping("/admin/ve")
	public String indexAdmin(Model model) {
		model.addAttribute("ve", daoV.findAll());
		model.addAttribute("formVe",new Ve());
		model.addAttribute("formNhieuVe",new Ve());
		model.addAttribute("lichChieu",daoLC.PhimSapChieu());
		return "admin/ve";
	}
	
	@PostMapping("/admin/ve/create")
	public String create(Model model, @ModelAttribute("formVe") Ve Ve, RedirectAttributes re) {
		try {
			 if(Ve.getMaVe() == null) {
					 daoV.create(Ve);
					 re.addFlashAttribute("message","Thêm thành công");
					 return "redirect:/admin/ve";
			 }else {
				 try {
					 daoV.update(Ve);
					 re.addFlashAttribute("message","Sửa thành công");
					 return "redirect:/admin/ve"; 
				 }
				 catch (Exception e) {
					model.addAttribute("nhanvien", daoV.findAll());
					model.addAttribute("formVe",Ve);
					model.addAttribute("message","Sửa mới thất bại");
					return "admin/ve";
				}
			}
		} catch (Exception e) {
			re.addAttribute("message", "Thất bại");
			return "redirect:/admin/ve"; 
		}	
	}
	
	@PostMapping("/admin/ve/createNhieuVe")
	public String createNhieuVe(Model model, @ModelAttribute("formNhieuVe") Ve Ve, RedirectAttributes re) {
		try {			
			LichChieuPhim lc = daoLC.findById(Ve.getLichchieu().getMaLichChieu());
			Integer soLuongGhe = lc.getPhongchieuphim().getTongSoGhe();
			String maPhong =  lc.getPhongchieuphim().getMaPhong();		
			for(int i = 1; i<= soLuongGhe;i++) {
				Ve veCreate = new Ve();
				veCreate.setTrangThai(false);
				veCreate.setLichchieu(Ve.getLichchieu());
				veCreate.setGhengoi(daoG.findById(maPhong+i));;
				daoV.create(veCreate);
			}
			re.addFlashAttribute("message", "Thêm vé thành công");
		} catch (Exception e) {
			e.printStackTrace();
			re.addFlashAttribute("message", "Thất bại");
		}
		return "redirect:/admin/ve"; 
	}
	
		///Chọn vé cần sửa
	  @RequestMapping("/admin/ve/{maVe}") 
	  public String edit(Model model, @PathVariable("maVe") Integer maVe) { 
		  model.addAttribute("formVe",daoV.findById(maVe));
		  model.addAttribute("ve", daoV.findAll());
		  return "/admin/Ve"; 
	  }
	  
	  ///Sửa vé
	  @RequestMapping("/admin/ve/update")
		public String update(Model model, @ModelAttribute("formVe") Ve entity) {
			daoV.update(entity);		
			return "redirect:/admin/ve"; 
		}
	  
	  //Xóa thông tin đánh giá trên danh sách
	  
	  @RequestMapping("/admin/ve/delete/{maVe}") 
	  public String delete(Model model, @PathVariable("maVe") Integer maVe, RedirectAttributes re) {
		  try {
			  daoV.delete(maVe);
		  }
		  catch(DataIntegrityViolationException e) {
			  e.printStackTrace();
			  re.addFlashAttribute("message","Không thể xóa dữ liệu đang tồn tại");
		  }
	  return "redirect:/admin/ve"; 
	  }
	  
	  
	  //Xóa tất cả theo mã lịch
	  @RequestMapping("/admin/ve/deleteAll") 
	  public String deleteAll(Model model, @ModelAttribute("maLichChieu") Integer maLichChieu, RedirectAttributes re) {
		  try {
			  daoV.deleteAll(maLichChieu);
		  }
		  catch(DataIntegrityViolationException e) {
			  e.printStackTrace();
			  re.addFlashAttribute("message","Không thể xóa dữ liệu đang tồn tại");
		  }
	  return "redirect:/admin/ve"; 
	  }
	 
}
