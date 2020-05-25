package com.poly.dao;

import java.util.List;

import com.poly.entity.KhachHang;

public interface KhachHangDAO {
	KhachHang findById(Integer maKhachHang);
	KhachHang findByEmail(String email);
	List<KhachHang> findAll();
	KhachHang create(KhachHang entity);
	void update(KhachHang entity); 
	KhachHang delete(Integer maKhachHang);
	KhachHang findByName(String tenKhachHang);
	//List<KhachHang> search(String key);
}
