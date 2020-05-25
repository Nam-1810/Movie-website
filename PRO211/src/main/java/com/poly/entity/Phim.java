package com.poly.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table

public class Phim {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer maPhim;
	@NotEmpty(message="Nhập tên phim")
	String tenPhim;
	@NotEmpty(message="Nhập tên đạo diễn")
	String daoDien;
	
	@NotEmpty(message="Nhập tên đạo diễn")
	String dienVien;
	
	@NotEmpty(message="Nhập tên đạo diễn")
	String nhaSanXuat;
	@NotEmpty(message="Nhập ngày phát hành")
	String ngayPhatHanh;
	@Length(min=10,message ="Nhập thêm nội dung phim")
	String noiDung;
	String thoiLuong;
	@NotEmpty(message="Nhập quốc gia ")
	String quocGia;
	//@NotEmpty(message="Chọn hình phim")
	String hinhPhim;
	

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date ngayBatDau;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date ngayKetThuc;
	
	//Integer maTheLoai
	@ManyToOne
	@JoinColumn(name="maTheLoai")
	TheLoaiPhim theloaiphim;
	
	@OneToMany(mappedBy = "phim")
	List<LichChieuPhim> lichchieuphim;
	
	@OneToMany(mappedBy = "phim")
	List<DanhGia> danhgia;

	
	
	public String getHinhPhim() {
		return hinhPhim;
	}

	public void setHinhPhim(String hinhPhim) {
		this.hinhPhim = hinhPhim;
	}

	public Integer getMaPhim() {
		return maPhim;
	}

	public void setMaPhim(Integer maPhim) {
		this.maPhim = maPhim;
	}

	public String getTenPhim() {
		return tenPhim;
	}

	public void setTenPhim(String tenPhim) {
		this.tenPhim = tenPhim;
	}


	public String getDaoDien() {
		return daoDien;
	}

	public void setDaoDien(String daoDien) {
		this.daoDien = daoDien;
	}

	public String getNhaSanXuat() {
		return nhaSanXuat;
	}

	public void setNhaSanXuat(String nhaSanXuat) {
		this.nhaSanXuat = nhaSanXuat;
	}

	public String getNgayPhatHanh() {
		return ngayPhatHanh;
	}

	public void setNgayPhatHanh(String ngayPhatHanh) {
		this.ngayPhatHanh = ngayPhatHanh;
	}

	public String getNoiDung() {
		return noiDung;
	}

	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}

	public String getThoiLuong() {
		return thoiLuong;
	}

	public void setThoiLuong(String thoiLuong) {
		this.thoiLuong = thoiLuong;
	}

	public String getQuocGia() {
		return quocGia;
	}

	public void setQuocGia(String quocGia) {
		this.quocGia = quocGia;
	}

	public TheLoaiPhim getTheloaiphim() {
		return theloaiphim;
	}

	public void setTheloaiphim(TheLoaiPhim theloaiphim) {
		this.theloaiphim = theloaiphim;
	}


	public List<LichChieuPhim> getLichchieuphim() {
		return lichchieuphim;
	}

	public void setLichchieuphim(List<LichChieuPhim> lichchieuphim) {
		this.lichchieuphim = lichchieuphim;
	}

	public List<DanhGia> getDanhgia() {
		return danhgia;
	}

	public void setDanhgia(List<DanhGia> danhgia) {
		this.danhgia = danhgia;
	}

	public Date getNgayBatDau() {
		return ngayBatDau;
	}

	public void setNgayBatDau(Date ngayBatDau) {
		this.ngayBatDau = ngayBatDau;
	}

	public Date getNgayKetThuc() {
		return ngayKetThuc;
	}

	public void setNgayKetThuc(Date ngayKetThuc) {
		this.ngayKetThuc = ngayKetThuc;
	}

	public String getDienVien() {
		return dienVien;
	}

	public void setDienVien(String dienVien) {
		this.dienVien = dienVien;
	}
	
	
	
}
