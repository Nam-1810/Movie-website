package com.poly.dao;

import java.util.List;

import com.poly.entity.SuatChieu;

public interface SuatChieuDAO {
	SuatChieu findById(Integer maSuatChieu);
	List<SuatChieu> findAll();
	SuatChieu create(SuatChieu entity);
	void update(SuatChieu entity); 
	SuatChieu delete(Integer maSuatChieu);
}
