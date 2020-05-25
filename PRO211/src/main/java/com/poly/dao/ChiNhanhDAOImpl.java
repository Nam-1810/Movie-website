package com.poly.dao;

import java.util.List;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.ChiNhanh;

@Transactional
@Repository
public class ChiNhanhDAOImpl implements ChiNhanhDAO {
	@Autowired
	SessionFactory factory;
	

	@Override
	public ChiNhanh findById(String maChiNhanh) {
		Session session = factory.getCurrentSession();
		return session.find(ChiNhanh.class, maChiNhanh);
	}
	

	@Override
	public List<ChiNhanh> findAll() {
		String hql ="FROM ChiNhanh";
		Session session = factory.getCurrentSession();
		TypedQuery<ChiNhanh> query = session.createQuery(hql, ChiNhanh.class);
		return query.getResultList();
	}

	@Override
	public ChiNhanh create(ChiNhanh entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(ChiNhanh entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public ChiNhanh delete(String maChiNhanh) {
		ChiNhanh entity=this.findById(maChiNhanh);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}
}
