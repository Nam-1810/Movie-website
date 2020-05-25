package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.PhongChieuPhim;



@Transactional
@Repository
public class PhongChieuPhimDAOImpl implements PhongChieuPhimDAO {
	@Autowired
	SessionFactory factory;
	

	@Override
	public PhongChieuPhim findById(String maPhong) {
		Session session = factory.getCurrentSession();
		return session.find(PhongChieuPhim.class, maPhong);
	}
	

	@Override
	public List<PhongChieuPhim> findAll() {
		String hql ="FROM PhongChieuPhim";
		Session session = factory.getCurrentSession();
		TypedQuery<PhongChieuPhim> query = session.createQuery(hql, PhongChieuPhim.class);
		return query.getResultList();
	}

	@Override
	public PhongChieuPhim create(PhongChieuPhim entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(PhongChieuPhim entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public PhongChieuPhim delete(String maPhong) {
		PhongChieuPhim entity=this.findById(maPhong);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
		
	}


	@Override
	public List<PhongChieuPhim> findByChiNhanh(String maChiNhanh) {
		String hql ="FROM PhongChieuPhim WHERE maChiNhanh = :maChiNhanh";
		Session session = factory.getCurrentSession();
		TypedQuery<PhongChieuPhim> query = session.createQuery(hql, PhongChieuPhim.class);
		return query.getResultList();
	}

}
