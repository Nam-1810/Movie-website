package com.poly.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.DanhGia;

@Transactional
@Repository
public class DanhGiaDAOimp implements DanhGiaDAO {
	@Autowired
	SessionFactory factory;
	Session session;
	
	@Override
	public DanhGia findById(Integer maDanhGia) {
		session = factory.getCurrentSession();
		return session.find(DanhGia.class, maDanhGia);
	}

	@Override
	public List<DanhGia> findAll() {
		String hql="FROM DanhGia";
		session = factory.getCurrentSession();
		TypedQuery<DanhGia> query = session.createQuery(hql, DanhGia.class); 
		return query.getResultList() ;
	}

	@Override
	public DanhGia create(DanhGia entity) {
		session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(DanhGia entity) {
		session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public DanhGia delete(Integer maDanhGia) {
		session = factory.getCurrentSession();
		DanhGia entity = this.findById(maDanhGia);
		session.remove(entity);
		return null;
	}

	@Override
	public Double tongDiem(Integer maPhim) {
		session = factory.getCurrentSession();
		String hql1 = "Select SUM(diem) From DanhGia where maPhim =" + maPhim;
		Query query = session.createQuery(hql1);	
		return (Double) query.getSingleResult();
	}
	
	@Override
	public Double diemTB(Integer maPhim) {
		session = factory.getCurrentSession();
		String hql1 = "Select SUM(diem)/COUNT(maDanhGia) From DanhGia where maPhim =" + maPhim;
		Query query = session.createQuery(hql1);	
		return (Double) query.getSingleResult();
	}

	@Override
	public Double diemCaoNhat(Integer maPhim) {
		session = factory.getCurrentSession();
		String hql = "Select MAX(diem) FROM DanhGia where maPhim=" + maPhim;
		TypedQuery<Double> query = session.createQuery(hql);
		return query.getSingleResult();
	}

	@Override
	public Double diemThapNhat(Integer maPhim) {
		session = factory.getCurrentSession();
		String hql = "Select Min(diem) FROM DanhGia where maPhim=" + maPhim;
		TypedQuery<Double> query = session.createQuery(hql);
		return query.getSingleResult();
	}

	@Override
	public Long luotDanhGia(Integer maPhim) {
		session = factory.getCurrentSession();
		String hql = "Select COUNT(*) FROM DanhGia where maPhim=" + maPhim;
		TypedQuery<Long> query = session.createQuery(hql);
		return query.getSingleResult();
	}
	@Override
	public List<DanhGia> findByKhachHang(Integer maKhachHang)
	{
		String hql = "FROM DanhGia WHERE maKhachHang = :maKhachHang";
		Session session = factory.getCurrentSession();
		TypedQuery<DanhGia> query = session.createQuery(hql, DanhGia.class);
		query.setParameter("maKhachHang", maKhachHang);
		return query.getResultList();
	}
	
	
	
	

	/*
	 * @Override public List<KhachHang> search(String key){ 
	 * session = factory.getCurrentSession();  
	 * return results; }
	 */
}
