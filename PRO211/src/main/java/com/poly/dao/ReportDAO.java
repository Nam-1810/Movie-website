package com.poly.dao;

import java.util.List;

public interface ReportDAO {
	// List<Oject[]> phimTK();

	List<Object[]> phimTK();

	List<Object[]> doanhThuTheLoai();
	List<Object[]> doanhThuPhim();
	List<Object[]> doanhThuChiNhanh();
	List<Object[]> doanhThuKhacHang();
	List<Object[]> diemDanhGia();
	List<Object[]> doanhThuNgay();
}
