package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.ChiTietDatVe;

@Transactional
@Repository
public class ChiTietVeImpl implements ChiTietVeDAO{

	@Autowired
	SessionFactory factory;
	
	@Override
	public ChiTietDatVe findById(Integer maChiTietVe) {
		Session session = factory.getCurrentSession();
		return session.find(ChiTietDatVe.class, maChiTietVe);
	}

	@Override
	public List<ChiTietDatVe> findAll() {
		String hql ="FROM ChiTietDatVe";
		Session session = factory.getCurrentSession();
		TypedQuery<ChiTietDatVe> query = session.createQuery(hql, ChiTietDatVe.class);
		return query.getResultList();
	}
	
	@Override
	public List<ChiTietDatVe> findByKH(Integer maKH) {
		String hql ="FROM ChiTietDatVe ct WHERE ct.datve.khachhang.maKhachHang = :maKH";
		Session session = factory.getCurrentSession();
		TypedQuery<ChiTietDatVe> query = session.createQuery(hql, ChiTietDatVe.class);
		query.setParameter("maKH",maKH);
		return query.getResultList();
	}

	@Override
	public ChiTietDatVe create(ChiTietDatVe entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(ChiTietDatVe entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public ChiTietDatVe delete(Integer maChiTietVe) {
		ChiTietDatVe entity = this.findById(maChiTietVe);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}

}
