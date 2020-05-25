package com.poly.controller.client;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.poly.dao.ChiTietVeDAO;
import com.poly.dao.DatVeDAO;
import com.poly.dao.LichChieuPhimDAO;
import com.poly.dao.NhanVienDAO;
import com.poly.dao.PhimDAO;
import com.poly.dao.VeDAO;
import com.poly.entity.ChiTietDatVe;
import com.poly.entity.DatVe;
import com.poly.entity.KhachHang;
import com.poly.entity.LichChieuPhim;
import com.poly.entity.NhanVien;
import com.poly.entity.Ve;
import com.poly.services.EmailServices;

@Transactional
@Controller

public class DatVeController {
	@Autowired
	PhimDAO daoPhim;
	
	@Autowired
	VeDAO daoVe;
	
	@Autowired
	DatVeDAO daoDV;
	
	@Autowired
	NhanVienDAO daoNV;
	
	@Autowired
	ChiTietVeDAO daoCT;
	
	@Autowired
	LichChieuPhimDAO daoLC;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	EmailServices send;
	
	@RequestMapping("/DatVe/{maLichChieu}")
	public String DatVe(Model model,@PathVariable("maLichChieu") Integer maLichChieu) {
		model.addAttribute("listVe", daoVe.findByIdLichChieu(maLichChieu));
		model.addAttribute("formDatVe",new DatVe());
		model.addAttribute("form",new KhachHang());
		session.setAttribute("lichChieu", daoLC.findById(maLichChieu));
		return "DatVe";
	}
	
	@PostMapping("/DatVe/create")
	public String DanhSachGhe(Model model,@RequestParam(name = "array", required = false) String array,
			@ModelAttribute("formDatVe") DatVe datVe) throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		String[] mang = mapper.readValue(array, String[].class);	
		session.setAttribute("danhSachGhe",mang);
		try {
			KhachHang kh = (KhachHang) session.getAttribute("khachhang");
			NhanVien nv = daoNV.findById(1);
			LichChieuPhim lc = (LichChieuPhim) session.getAttribute("lichChieu");
			datVe.setNgayDat(lc.getNgayChieu().toString());
			datVe.setKhachhang(kh);
			datVe.setNhanvien(nv);
			daoDV.create(datVe);
			session.setAttribute("datVe",datVe);
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/index";
		}
		return "redirect:/ThanhToan";
	}
	
	@GetMapping("/ThanhToan")
	public String ThanhToan(Model model) {
		session.setAttribute("back-urlkh","");
		DatVe dv = (DatVe) session.getAttribute("datVe");
		model.addAttribute("tenKH",dv.getKhachhang().getTenKhachHang());
		model.addAttribute("email",dv.getKhachhang().getEmail());
		model.addAttribute("soDT",dv.getKhachhang().getSoDT());
		model.addAttribute("formChiTiet",new ChiTietDatVe());
		model.addAttribute("form",new KhachHang());
		return "ThanhToan";
	}
	
	@PostMapping("/ThanhToan/create")
	public String ThanhToan(Model model, @ModelAttribute("formChiTiet") ChiTietDatVe chiTiet){
		try {
			LichChieuPhim lc =(LichChieuPhim) session.getAttribute("lichChieu");
			String[] mang = (String[]) session.getAttribute("danhSachGhe");
			List<ChiTietDatVe> list = new ArrayList<>();
			for (int i = 0; i < mang.length; i++) {
				ChiTietDatVe ct = new ChiTietDatVe();
				ct.setMaChiTietVe(chiTiet.getMaChiTietVe());
				ct.setDatve(chiTiet.getDatve());	
				ct.setVe(daoVe.findByGheAndLichChieu(mang[i], lc.getMaLichChieu()));
				
				daoCT.create(ct);
				list.add(ct);
				Ve updateVe = daoVe.findByGheAndLichChieu(mang[i], lc.getMaLichChieu());
				updateVe.setTrangThai(true);
				daoVe.update(updateVe);
				
			}
			session.setAttribute("danhSachGhe","");
			session.setAttribute("DatVe","");
			session.setAttribute("veList",list);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/ThanhToan";
		}
		return "redirect:/success";
	}
	
	@RequestMapping("/success")
	public String success(Model model) {
		model.addAttribute("form",new KhachHang());
		return "success";
	}
	
	@PostMapping("/SendVeEmail")
	public String SendVeEmail(Model model,RedirectAttributes re) {
		try {
			List<ChiTietDatVe> Ve = (List<ChiTietDatVe>) session.getAttribute("veList");
			KhachHang kh = (KhachHang) session.getAttribute("khachhang");
			send.SendVeEmail(kh.getEmail(), Ve);
			re.addFlashAttribute("message","Email đã được gửi !");
		}
		catch(Exception e) {
			e.printStackTrace();
			re.addFlashAttribute("message","Lỗi không thể gửi mail !");
		}
		return "redirect:/success";
	}
	
	@RequestMapping("/ThanhToan/DatVe/Delete")
	public String delete(Model model) {
		DatVe datVe = (DatVe) session.getAttribute("datVe");
		session.setAttribute("datVe","");
		daoDV.delete(datVe.getMaDatVe());
		return "redirect:/index";
	}
}
