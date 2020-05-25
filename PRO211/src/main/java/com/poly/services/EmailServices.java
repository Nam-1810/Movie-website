package com.poly.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.poly.dao.ChiTietVeDAO;
import com.poly.entity.ChiTietDatVe;

@Service
public class EmailServices {
	@Autowired
	EmailServices send;
	
	@Autowired
	ChiTietVeDAO dao;
	
	@Autowired
	private JavaMailSender javaMailSender ;
	
	public void EmailDoiMatKhau(String email, String matKhau) {

        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setTo(email);

        msg.setSubject("[Đổi] Đổi mật khẩu");
        msg.setText("Xin chào, mật khẩu mới của bạn là : " + matKhau);

        javaMailSender.send(msg);
    }
	
	public void EmailQuenMatKhau(String email, String matKhau) {

		SimpleMailMessage msg = new SimpleMailMessage();
        msg.setTo(email);

        msg.setSubject("[Cấp lại] Cấp lại mật khẩu");
        msg.setText("Xin chào, mật khẩu của bạn là : " + matKhau);

        javaMailSender.send(msg);
    }
	
	public void SendVeEmail(String email, List<ChiTietDatVe> Ve) {
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setTo(email);
        String message ="";
        msg.setSubject("[Vé] Vé bạn đã đặt");
        for(int i =0; i < Ve.size(); i++) {
        	ChiTietDatVe ct = dao.findById(Ve.get(i).getMaChiTietVe());
        	 String mess = "Xin chào, Cảm ơn bạn đã đặt vé. \n"
             		+ "Mã vé của bạn là: " + ct.getMaChiTietVe() +"\n "
     				+ "Ngày chiếu và suất chiếu là :" + ct.getVe().getLichchieu().getNgayChieu() + " / " + ct.getVe().getLichchieu().getSuatchieu().getGioBatDau() + "\n "
					+ "Mã ghế : " + ct.getVe().getGhengoi().getMaGhe() + "\n "
					+ "Phòng chiếu / Chi nhánh : " + ct.getVe().getLichchieu().getPhongchieuphim().getTenPhong() + " / " + ct.getVe().getLichchieu().getPhongchieuphim().getChinhanh().getTenChiNhanh() +"\n "
					+ "Giá : "+ ct.getVe().getLichchieu().getGia() +"\n \n";
        	 message += mess;
        }
        msg.setText(message);
   	 javaMailSender.send(msg);
    }
}
