package com.poly.dao;

import java.util.List;

import com.poly.entity.LichChieuPhim;

public interface LichChieuPhimDAO {
	LichChieuPhim findById(Integer maLichChieu);
	LichChieuPhim findByMSC(Integer maSuatChieu);
	List<LichChieuPhim> findAll();
	List<LichChieuPhim> PhimDaChieu();
	List<LichChieuPhim> PhimDangChieu();
	List<LichChieuPhim> PhimSapChieu();
	List<LichChieuPhim> LichPhimDangChieu(Integer maPhim);
	LichChieuPhim create(LichChieuPhim entity);
	void update(LichChieuPhim entity); 
	LichChieuPhim delete(Integer maLichChieu);
	List<LichChieuPhim> findBySuatChieu(Integer maSuatChieu);
	List<LichChieuPhim> findByPhongChieu(String maPhong);
	List<LichChieuPhim> findByMaPhim(Integer maPhim);
}
