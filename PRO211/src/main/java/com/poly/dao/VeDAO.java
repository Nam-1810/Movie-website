package com.poly.dao;

import java.util.List;

import com.poly.entity.Ve;

public interface VeDAO {

	Ve findById(Integer maVe);
	
	List<Ve> findAll();

	Ve findByGheAndLichChieu(String maGhe, Integer maLichChieu);
	
	List<Ve> findByIdLichChieu(Integer maLichChieu);

	Ve create(Ve entity);

	void update(Ve entity);

	Ve delete(Integer maVe);

	void deleteAll(Integer maVe);
	
	List<Ve> findByGheNgoi(String maGhe);
	
	List<Ve> findByMaLichChieu(Integer maLichChieu);
}
