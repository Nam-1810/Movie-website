package com.poly.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="DatVe")

public class DatVe {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer maDatVe;

	//Integer maNhanVien;
	@ManyToOne
	@JoinColumn(name="maNhanVien")
	NhanVien nhanvien;
	
	//Integer maKhachHang;
	@ManyToOne
	@JoinColumn(name="maKhachHang")
	KhachHang khachhang;

	@OneToMany(mappedBy = "datve")
	List<ChiTietDatVe> chitietdatve;

	String ngayDat;

	public Integer getMaDatVe() {
		return maDatVe;
	}

	public void setMaDatVe(Integer maDatVe) {
		this.maDatVe = maDatVe;
	}


	public String getNgayDat() {
		return ngayDat;
	}

	public void setNgayDat(String ngayDat) {
		this.ngayDat = ngayDat;
	}

	public NhanVien getNhanvien() {
		return nhanvien;
	}

	public void setNhanvien(NhanVien nhanvien) {
		this.nhanvien = nhanvien;
	}

	public KhachHang getKhachhang() {
		return khachhang;
	}

	public void setKhachhang(KhachHang khachhang) {
		this.khachhang = khachhang;
	}

	public List<ChiTietDatVe> getChitietdatve() {
		return chitietdatve;
	}

	public void setChitietdatve(List<ChiTietDatVe> chitietdatve) {
		this.chitietdatve = chitietdatve;
	}
	
	

	
}
