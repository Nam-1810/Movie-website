	package com.poly.dao;

import java.util.List;

import com.poly.entity.GheNgoi;



public interface GheNgoiDAO {
	GheNgoi findById(String maGhe);

	List<GheNgoi> findAll();

	GheNgoi create(GheNgoi entity);

	void update(GheNgoi entity);

	GheNgoi delete(String maGhe);
	
	List<GheNgoi> findByPhongChieu(String maPhong);
}
