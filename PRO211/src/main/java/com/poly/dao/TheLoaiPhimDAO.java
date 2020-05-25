package com.poly.dao;

import java.util.List;

import com.poly.entity.TheLoaiPhim;

public interface TheLoaiPhimDAO {
	TheLoaiPhim findById(String maTheLoai);

	List<TheLoaiPhim> findAll();

	TheLoaiPhim create(TheLoaiPhim entity);

	void update(TheLoaiPhim entity);

	TheLoaiPhim delete(String maTheLoai);

}
