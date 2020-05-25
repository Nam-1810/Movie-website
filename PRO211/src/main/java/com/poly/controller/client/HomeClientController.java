package com.poly.controller.client;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.ChiNhanhDAO;
import com.poly.dao.DanhGiaDAO;
import com.poly.dao.LichChieuPhimDAO;
import com.poly.dao.PhimDAO;
import com.poly.dao.TheLoaiPhimDAO;
import com.poly.entity.KhachHang;
import com.poly.entity.Phim;
import com.poly.entity.TheLoaiPhim;
import com.poly.entity.ChiNhanh;


@Controller
public class HomeClientController {
	@Autowired
	SessionFactory factory;

	@Autowired
	LichChieuPhimDAO daoLC;
	
	@Autowired
	PhimDAO daoPhim;

	@Autowired
	DanhGiaDAO daoDG;
	
	@Autowired
	ChiNhanhDAO daoCN;
	
	@Autowired
	TheLoaiPhimDAO daoTL;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/index")
	public String indexClinet(Model model) {
		if(session.getAttribute("DangNhapHidden") != "display:none") {
			session.setAttribute("DangXuatHidden","display:none");
		}
		model.addAttribute("form",new KhachHang());
		model.addAttribute("list",daoPhim.PhimDangChieu());
		return "index";
	}
	
	@RequestMapping("/DangNhap")
	public String dangNhap(Model model) {
		model.addAttribute("form",new KhachHang());
		return "DangNhap";
	}

	@RequestMapping("/PhimDangChieu")
	public String dangChieu(Model model) {
		model.addAttribute("form",new KhachHang());
		model.addAttribute("list", daoPhim.PhimDangChieu());
		return "PhimDangChieu";
	}
	
	@RequestMapping("/PhimSapChieu")
	public String sapChieu(Model model) {
		model.addAttribute("form",new KhachHang());
		model.addAttribute("list", daoPhim.PhimSapChieu());
		return "PhimSapChieu";
	}
	
	@RequestMapping("/TheLoai")
	public String theLoai(Model model) {
		model.addAttribute("form",new KhachHang());
		model.addAttribute("formTL",new TheLoaiPhim());
		model.addAttribute("list", daoPhim.findAll());
		model.addAttribute("listTL", daoTL.findAll());
		return "TheLoai";
	}

	@RequestMapping("/ChiTietPhim/{maPhim}")
	public String detail(Model model, @PathVariable("maPhim") Integer maPhim) {
		model.addAttribute("form",new KhachHang());
		Phim item = daoPhim.findById(maPhim);
		List<Phim> same = daoPhim.findSameCategory(maPhim,item.getTheloaiphim().getMaTheLoai());
		model.addAttribute("diem",daoDG.diemTB(maPhim));
		model.addAttribute("lichChieu", daoLC.LichPhimDangChieu(maPhim));
		model.addAttribute("same",same);
		model.addAttribute("item", item);
		return "ChiTietPhim";
	}
	
	@RequestMapping("/ChiNhanh")
	public String ChiNhanh(Model model) {
		
		try {
			model.addAttribute("form",new KhachHang());
			model.addAttribute("formCN",new ChiNhanh());
			List<ChiNhanh> list = daoCN.findAll();
			model.addAttribute("listCN", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "ChiNhanh";
	}
}
