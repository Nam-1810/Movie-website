package com.poly.dao;

import java.util.List;

import com.poly.entity.DatVe;

public interface DatVeDAO {
	
	DatVe findById(Integer maDatVe);

	List<DatVe> findAll();

	DatVe create(DatVe entity);

	void update(DatVe entity);

	DatVe delete(Integer maDatVe);
	
	List<DatVe> findByKhachHang(Integer maKhachHang);
	
	List<DatVe> findByNhanVien(Integer maNhanVien);
}
