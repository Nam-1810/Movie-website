package com.poly.dao;

import java.util.List;

import com.poly.entity.PhongChieuPhim;



public interface PhongChieuPhimDAO {
	PhongChieuPhim findById(String maPhong);

	List<PhongChieuPhim> findAll();

	PhongChieuPhim create(PhongChieuPhim entity);

	void update(PhongChieuPhim entity);

	PhongChieuPhim delete(String maPhong);
	
	List<PhongChieuPhim> findByChiNhanh(String maChiNhanh);
}
