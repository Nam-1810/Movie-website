package com.poly.dao;

import java.util.List;

import com.poly.entity.NhanVien;

public interface NhanVienDAO {
	NhanVien findById(Integer maNhanVien);
	NhanVien findByEmail(String email);
	List<NhanVien> findAll();
	NhanVien create(NhanVien entity);
	void update(NhanVien entity); 
	NhanVien delete(Integer maNhanVien);
	//List<NhanVien> search(String key);
}
