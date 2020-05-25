package com.poly.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.poly.dao.KhachHangDAO;
import com.poly.dao.LichChieuPhimDAO;
import com.poly.dao.NhanVienDAO;
import com.poly.dao.PhimDAO;
import com.poly.dao.VeDAO;
import com.poly.entity.ChiTietDatVe;
import com.poly.entity.DatVe;
import com.poly.entity.Ve;

@Controller
public class DatVeAdminController {
	@Autowired
	DatVeDAO DVdao;

	@Autowired
	NhanVienDAO NVdao;

	@Autowired
	KhachHangDAO KHdao;

	@Autowired
	ChiTietVeDAO CTdao;

	@Autowired
	LichChieuPhimDAO LCdao;

	@Autowired
	VeDAO Vedao;
	
	@Autowired
	PhimDAO Phimdao;

	@Autowired
	HttpSession session;

	@RequestMapping("/admin/VePhim/index")
	public String index(Model model) {
		model.addAttribute("formDatVe", new DatVe());
		model.addAttribute("formChiTiet", new ChiTietDatVe());
		model.addAttribute("listDatVe", DVdao.findAll());
		model.addAttribute("listChiTiet", CTdao.findAll());
		model.addAttribute("listVe", Vedao.findAll());
		model.addAttribute("disabled", true);
		return "admin/VePhim/index";
	}

	@RequestMapping("/admin/VePhim/insert")
	public String insert(Model model) {
		model.addAttribute("listKH", KHdao.findAll());
		model.addAttribute("listLichChieu", LCdao.PhimDangChieu());
		model.addAttribute("formDatVe", new DatVe());
		model.addAttribute("formChiTiet", new ChiTietDatVe());
		session.getAttribute("listVe");

		return "admin/VePhim/insert";
	}

	@PostMapping("/admin/VePhim/maLichChieu")
	public String Ve(Model model, @RequestParam("maLC") Integer maLichChieu) {
		session.setAttribute("giaVe", LCdao.findById(maLichChieu));
		session.setAttribute("listVe", Vedao.findByIdLichChieu(maLichChieu));
		session.setAttribute("maLC", maLichChieu);
		return "redirect:/admin/VePhim/index";
	}

	@PostMapping("/admin/VePhim/createDatVe")
	public String createDV(Model model, @ModelAttribute("formDatVe") DatVe datVe,
			@ModelAttribute("formChiTiet") ChiTietDatVe chiTiet, RedirectAttributes re) {
		try {
			DVdao.create(datVe);
			DatVe kh = DVdao.findById(datVe.getMaDatVe());

			re.addFlashAttribute("maKH", kh.getKhachhang().getMaKhachHang());
			re.addFlashAttribute("tenKH", kh.getKhachhang().getTenKhachHang());
			re.addFlashAttribute("ngayDV", datVe.getNgayDat());
			re.addFlashAttribute("maDV", datVe.getMaDatVe());
			re.addFlashAttribute("formChiTiet", chiTiet);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/VePhim/insert";
	}

	@PostMapping("/admin/VePhim/createChiTiet")
	public String createCT(Model model, @ModelAttribute("formChiTiet") ChiTietDatVe chiTiet,
			@RequestParam(name = "array", required = false) String array)
			throws JsonParseException, JsonMappingException, IOException {
		try {
			ObjectMapper mapper = new ObjectMapper();
			String[] mang = mapper.readValue(array, String[].class);

			Integer maLC = (Integer) session.getAttribute("maLC");
			for (int i = 0; i < mang.length; i++) {
				chiTiet.setVe(Vedao.findByGheAndLichChieu(mang[i], maLC));
				CTdao.create(chiTiet);

				Ve updateVe = Vedao.findByGheAndLichChieu(mang[i], maLC);
				updateVe.setTrangThai(true);
				Vedao.update(updateVe);
			}
			session.setAttribute("maLC", "");
			session.setAttribute("listVe", "");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/admin/VePhim/index";
	}

	@RequestMapping("/admin/VePhim/DatVe/edit/{maDatVe}")
	public String EditDV(Model model, @PathVariable("maDatVe") Integer maDatVe,
			@ModelAttribute("formChiTiet") ChiTietDatVe chiTiet) {

		if (maDatVe != null) {
			DatVe datVe = DVdao.findById(maDatVe);
			model.addAttribute("formDatVe", datVe);
		}

		if (chiTiet != null) {
			model.addAttribute("formChiTiet", chiTiet);
		}

		model.addAttribute("listNV", NVdao.findAll());
		model.addAttribute("listKH", KHdao.findAll());
		model.addAttribute("listDatVe", DVdao.findAll());
		model.addAttribute("listChiTiet", CTdao.findAll());
		model.addAttribute("listVe", Vedao.findAll());
		model.addAttribute("disabled", true);
		return "admin/VePhim/index";
	}

	@RequestMapping("/admin/VePhim/UpdateDV")
	public String UpdateDV(Model model, @ModelAttribute("formDatVe") DatVe datVe) {
		try {
			DVdao.update(datVe);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/VePhim/index";
	}

	// Xóa thông tin đặt vé trên danh sách
	@RequestMapping("/admin/VePhim/DatVe/delete/{maDatVe}")
	public String DeleteDV(Model model, @PathVariable("maDatVe") Integer maDatVe, RedirectAttributes re) {
		try {
			DVdao.delete(maDatVe);
		}
		catch(Exception e) {
			re.addFlashAttribute("message","Không thể xóa dữ liệu đang tồn tại ở bảng khác");
		}
		
		return "redirect:/admin/VePhim/index";
	}

	@RequestMapping("/admin/VePhim/ChiTiet/edit/{maChiTietVe}")
	public String EditCT(Model model, @PathVariable("maChiTietVe") Integer maChiTietVe,
			@ModelAttribute("formDatVe") DatVe datVe) {
		List<Ve> listVe = Vedao.findByIdLichChieu(CTdao.findById(maChiTietVe).getVe().getLichchieu().getMaLichChieu());
		if (maChiTietVe != null) {
			ChiTietDatVe chiTiet = CTdao.findById(maChiTietVe);
			model.addAttribute("formChiTiet", chiTiet);
			model.addAttribute("prevID", chiTiet);
		}

		if (datVe != null) {
			model.addAttribute("formDatVe", datVe);
		}

		model.addAttribute("listDatVe", DVdao.findAll());
		model.addAttribute("listChiTiet", CTdao.findAll());
		model.addAttribute("listVe", listVe);
		model.addAttribute("disabled", false);
		
		return "admin/VePhim/index";
	}

	@RequestMapping("/admin/VePhim/UpdateCT")
	public String update(Model model, @ModelAttribute("formChiTiet") ChiTietDatVe chiTiet,
			@ModelAttribute("prevID") ChiTietDatVe prevID, RedirectAttributes re) {
		try {
			
			  if(Vedao.findById(chiTiet.getVe().getMaVe()).getTrangThai() == true) {
			  re.addFlashAttribute("message","Ghế đã có người đặt"); return
			  "redirect:/admin/VePhim/index";
			  }
			  
		      ///Update xóa trạng thái ghế trước đó 
		      Integer maVeCu = CTdao.findById(prevID.getMaChiTietVe()).getVe().getMaVe(); 
		      Ve updateVeCu = Vedao.findById(maVeCu); 
		      updateVeCu.setTrangThai(false);
			  Vedao.update(updateVeCu);
			  
			  CTdao.update(chiTiet);
			  
			  ///Update trạng thái ghế mới 
			  
			  Integer maVeMoi = CTdao.findById(chiTiet.getMaChiTietVe()).getVe().getMaVe(); 
			  System.out.println(maVeMoi);
			  Ve updateVeMoi = Vedao.findById(maVeMoi); 
			  updateVeMoi.setTrangThai(true);
			  Vedao.update(updateVeMoi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/VePhim/index";
	}

	// Xóa thông tin đặt vé trên danh sách
	@RequestMapping("/admin/VePhim/ChiTiet/delete/{maChiTietVe}")
	public String delete(Model model, @PathVariable("maChiTietVe") Integer maChiTietVe, RedirectAttributes re) {
		try {
			Integer maVe = CTdao.findById(maChiTietVe).getVe().getMaVe();
			CTdao.delete(maChiTietVe);
			Ve updateVe = Vedao.findById(maVe);
			updateVe.setTrangThai(false);
			Vedao.update(updateVe);
		}
		catch(Exception e) {
			 re.addFlashAttribute("message","Không thể xóa dữ liệu đang tồn tại ở bảng khác");
		}
		return "redirect:/admin/VePhim/index#chiTiet";
	}
}
