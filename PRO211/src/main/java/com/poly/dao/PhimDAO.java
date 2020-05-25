package com.poly.dao;

import java.util.List;

import com.poly.entity.Phim;
public interface PhimDAO {
	Phim findById(Integer id);
	
	List<Phim> findSameCategory(Integer id, String maTheLoai);

	List<Phim> findAll();
	
	List<Phim> DangChieuVaSapChieu();
	
	List<Phim> PhimDangChieu();
	
	List<Phim> PhimSapChieu();
	
	Phim create(Phim entity);

	void update(Phim entity);

	Phim delete(Integer id);

	List<Phim> findByMaTL(String maTheLoai);
}
