package com.poly.dao;

import java.util.List;

import com.poly.entity.ChiTietDatVe;

public interface ChiTietVeDAO {
	
	ChiTietDatVe findById(Integer ChiTietDatVe);

	List<ChiTietDatVe> findAll();
	
	List<ChiTietDatVe> findByKH(Integer maKH);

	ChiTietDatVe create(ChiTietDatVe entity);

	void update(ChiTietDatVe entity);

	ChiTietDatVe delete(Integer maChiTietVe);

}
