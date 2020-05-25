package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.DatVe;

@Transactional
@Repository
public class DatVeImpl implements DatVeDAO {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public DatVe findById(Integer maDatVe) {
		Session session = factory.getCurrentSession();
		return session.find(DatVe.class, maDatVe);
	}

	@Override
	public List<DatVe> findAll() {
		String hql ="FROM DatVe";
		Session session = factory.getCurrentSession();
		TypedQuery<DatVe> query = session.createQuery(hql, DatVe.class);
		return query.getResultList();
	}

	@Override
	public DatVe create(DatVe entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(DatVe entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public DatVe delete(Integer maDatVe) {
		DatVe entity = this.findById(maDatVe);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}
	
	@Override
	public List<DatVe> findByKhachHang(Integer maKhachHang)
	{
		String hql = "FROM DatVe WHERE maKhachHang = :maKhachHang";
		Session session = factory.getCurrentSession();
		TypedQuery<DatVe> query = session.createQuery(hql, DatVe.class);
		query.setParameter("maKhachHang", maKhachHang);
		return query.getResultList();
	}
	
	@Override
	public List<DatVe> findByNhanVien(Integer maNhanVien)
	{
		String hql = "FROM DatVe WHERE maNhanVien = :maNhanVien";
		Session session = factory.getCurrentSession();
		TypedQuery<DatVe> query = session.createQuery(hql, DatVe.class);
		query.setParameter("maNhanVien", maNhanVien);
		return query.getResultList();
	}
}
