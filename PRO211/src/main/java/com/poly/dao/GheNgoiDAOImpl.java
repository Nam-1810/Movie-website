package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.GheNgoi;

@Transactional
@Repository
public class GheNgoiDAOImpl implements GheNgoiDAO {
	@Autowired
	SessionFactory factory;
	

	@Override
	public GheNgoi findById(String maGhe) {
		Session session = factory.getCurrentSession();
		return session.find(GheNgoi.class, maGhe);
	}
	

	@Override
	public List<GheNgoi> findAll() {
		String hql ="FROM GheNgoi";
		Session session = factory.getCurrentSession();
		TypedQuery<GheNgoi> query = session.createQuery(hql, GheNgoi.class);
		return query.getResultList();

	}

	@Override
	public GheNgoi create(GheNgoi entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(GheNgoi entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public GheNgoi delete(String maGhe) {
	GheNgoi entity=this.findById(maGhe);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
		
	}


	@Override
	public List<GheNgoi> findByPhongChieu(String maPhong) {
		String hql = "FROM GheNgoi WHERE maPhong = :maPhong";
		Session session = factory.getCurrentSession();
		TypedQuery<GheNgoi> query = session.createQuery(hql, GheNgoi.class);
		query.setParameter("maPhong", maPhong);
		return query.getResultList();
	}

	

}
