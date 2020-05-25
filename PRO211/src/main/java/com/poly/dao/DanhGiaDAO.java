package com.poly.dao;

import java.util.List;

import com.poly.entity.DanhGia;

public interface DanhGiaDAO {
	DanhGia findById(Integer maDanhGia);
	List<DanhGia> findAll();
	DanhGia create(DanhGia entity);
	void update(DanhGia entity); 
	DanhGia delete(Integer maDanhGia);
	Double tongDiem(Integer maPhim);
	Double diemTB(Integer maPhim);
	Double diemCaoNhat(Integer maPhim);
	Double diemThapNhat(Integer maPhim);
	Long luotDanhGia(Integer maPhim);
	//List<KhachHang> search(String key);
	List<DanhGia> findByKhachHang(Integer maKhachHang);
}
