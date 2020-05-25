package com.poly.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name="DanhGia")
public class DanhGia {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer maDanhGia;
	
	@NotEmpty(message = "Không để trống ô chi tiết!")
	@Length(max=100, message = "Tối đa 100 kí tự")
	String chiTiet;
	
	@NotNull(message = "Vui lòng đánh giá điểm số !")
	Double diem;
	
	//String maPhim;
	@ManyToOne
	@JoinColumn(name="maPhim")
	Phim phim;
	
	//Integer maKhachHang
	@ManyToOne
	@JoinColumn(name="maKhachHang")
	KhachHang khachhang;

	public Integer getMaDanhGia() {
		return maDanhGia;
	}

	public void setMaDanhGia(Integer maDanhGia) {
		this.maDanhGia = maDanhGia;
	}

	public String getChiTiet() {
		return chiTiet;
	}

	public void setChiTiet(String chiTiet) {
		this.chiTiet = chiTiet;
	}

	public Double getDiem() {
		return diem;
	}

	public void setDiem(Double diem) {
		this.diem = diem;
	}

	public Phim getPhim() {
		return phim;
	}

	public void setPhim(Phim phim) {
		this.phim = phim;
	}

	public KhachHang getKhachhang() {
		return khachhang;
	}

	public void setKhachhang(KhachHang khachhang) {
		this.khachhang = khachhang;
	}
	
	
}
