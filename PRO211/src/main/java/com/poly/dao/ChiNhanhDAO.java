package com.poly.dao;

import java.util.List;
import com.poly.entity.ChiNhanh;

public interface ChiNhanhDAO {
	ChiNhanh findById(String maChiNhanh);

	List<ChiNhanh> findAll();

	ChiNhanh create(ChiNhanh entity);

	void update(ChiNhanh entity);

	ChiNhanh delete(String maChiNhanh);
}
