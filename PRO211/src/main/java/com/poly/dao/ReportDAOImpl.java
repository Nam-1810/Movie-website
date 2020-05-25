package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Transactional
@Repository
public class ReportDAOImpl implements ReportDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public List<Object[]> phimTK() {
		String hql="SELECT p.tenPhim,"
				+ " SUM(p.maPhim)"
				+ " FROM Phim p "
				+ "GROUP BY p.tenPhim "
				+ "ORDER BY SUM(p.maPhim) DESC";
				
				
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql, Object[].class);
		List<Object[]> list=query.getResultList();
		return list;
	}
	@Override
	public List<Object[]> doanhThuTheLoai() {
		String hql="SELECT c.ve.lichchieu.phim.theloaiphim.tenTheLoai,"
				+ "Count(c.maChiTietVe) ,"
				+ "Sum(c.ve.lichchieu.gia) "
				
				+ "From ChiTietDatVe c "
				+ "GROUP BY c.ve.lichchieu.phim.theloaiphim.tenTheLoai ";
//				+ "ORDER BY Sum(v.soLuong * v.gia) DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql, Object[].class);
		List<Object[]> list=query.getResultList();
		return list;
	}
	@Override
	public List<Object[]> doanhThuChiNhanh() {
//		SELECT distinct cn.tenChiNhanh, 
//		 Count(c.maChiTietVe) ,
//		 Sum(lc.gia) 
//		 From ChiTietDatVe c, Ve v, LichChieuPhim lc, PhongChieuPhim p, ChiNhanh cn
//		 Where c.maVe = v.maVe AND v.maLichChieu = lc.maLichChieu AND lc.maPhong = p.maPhong AND cn.maChiNhanh = p.maChiNhanh
//		 GROUP BY cn.tenChiNhanh 
//		 ORDER BY Sum(lc.gia)  DESC
		String hql="SELECT c.ve.lichchieu.phongchieuphim.chinhanh.tenChiNhanh, "
				+ "Count(c.maChiTietVe) ,"
				+ "Sum(c.ve.lichchieu.gia) "
				+ "From ChiTietDatVe c  "
//				+ "  Where c.maVe = v.maVe AND v.maLichChieu = lc.maLichChieu AND lc.maPhong = p.maPhong AND cn.maChiNhanh = p.maChiNhanh"		
				+ "GROUP BY c.ve.lichchieu.phongchieuphim.chinhanh.tenChiNhanh "
				+ "ORDER BY Sum(c.ve.lichchieu.gia)  DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql, Object[].class);
		List<Object[]> list=query.getResultList();
		return list;
	}
	@Override
	public List<Object[]> doanhThuKhacHang() {
		String hql="SELECT c.datve.khachhang.tenKhachHang, "
				+ "Count(c.maChiTietVe), "
				+ "Sum(c.ve.lichchieu.gia) "
				+ "From ChiTietDatVe c "
				+ "GROUP BY c.datve.khachhang.tenKhachHang "
				+ "ORDER BY Sum(c.ve.lichchieu.gia) DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql, Object[].class);
		List<Object[]> list=query.getResultList();
		return list;
	}
	@Override
	public List<Object[]> diemDanhGia() {
		String hql="SELECT d.phim.tenPhim, "
				+ "AVG(d.diem) "
				+ "From DanhGia d "
				+ "GROUP BY d.phim.tenPhim "
				+ "ORDER BY AVG(d.diem) DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql, Object[].class);
		List<Object[]> list=query.getResultList();
		return list;
	}
	@Override
	public List<Object[]> doanhThuPhim() {
		String hql="SELECT c.ve.lichchieu.phim.tenPhim,"
				+ "Count(c.maChiTietVe) ,"
				+ "Sum(c.ve.lichchieu.gia) "
				+ "From ChiTietDatVe c "
				+ "GROUP BY c.ve.lichchieu.phim.tenPhim "
				+ "ORDER BY Sum(c.ve.lichchieu.gia) DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql, Object[].class);
		List<Object[]> list=query.getResultList();
		return list;
	}
	@Override
	public List<Object[]> doanhThuNgay() {
		String hql="SELECT Month( c.ve.lichchieu.ngayChieu),"
				+ "Count(c.maChiTietVe) ,"
				+ "Sum(c.ve.lichchieu.gia) "
				+ "From ChiTietDatVe c "
				+ "where Year(c.ve.lichchieu.ngayChieu) =2019"
				+ "GROUP BY Month(c.ve.lichchieu.ngayChieu) "
				+ "ORDER BY Sum(c.ve.lichchieu.gia) ASC";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql, Object[].class);
		List<Object[]> list=query.getResultList();
		return list;
		
	}
}
