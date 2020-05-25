package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.Ve;

@Transactional
@Repository
public class VeDAOImp  implements VeDAO{
	@Autowired
	SessionFactory factory;
	
	@Override
	public Ve findById(Integer maVe) {
		Session session = factory.getCurrentSession();
		return session.find(Ve.class, maVe);
	}
	
	@Override
	public List<Ve> findAll(){
		String hql ="FROM Ve";
		Session session = factory.getCurrentSession();
		TypedQuery<Ve> query = session.createQuery(hql, Ve.class);
		return query.getResultList();
	}
	
	@Override
	public Ve findByGheAndLichChieu(String maGhe, Integer maLichChieu) {
		try {
			String hql ="FROM Ve WHERE lichchieu.maLichChieu = :maLichChieu and ghengoi.maGhe = :maGhe";
			Session session = factory.getCurrentSession();
			TypedQuery<Ve> query = session.createQuery(hql, Ve.class);
			query.setParameter("maGhe",maGhe);
			query.setParameter("maLichChieu", maLichChieu);
			return query.getSingleResult();
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}	
	}

	@Override
	public List<Ve> findByIdLichChieu(Integer maLichChieu) {
		String hql ="FROM Ve WHERE lichchieu.maLichChieu = :maLichChieu";
		Session session = factory.getCurrentSession();
		TypedQuery<Ve> query = session.createQuery(hql, Ve.class);
		query.setParameter("maLichChieu", maLichChieu);
		return query.getResultList();
	}

	@Override
	public Ve create(Ve entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Ve entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public Ve delete(Integer maVe) {
		Ve entity = this.findById(maVe);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}

	@Override
	public void deleteAll(Integer maLichChieu) {
		List<Ve> entities = this.findByIdLichChieu(maLichChieu);
		Session session = factory.getCurrentSession();
		for(int i=0; i< entities.size();i++) {
			session.remove(entities.get(i));
		}
	}
	
	@Override
	public List<Ve> findByGheNgoi(String maGhe)
	{
		String hql = "FROM Ve WHERE maGhe = :maGhe";
		Session session = factory.getCurrentSession();
		TypedQuery<Ve> query = session.createQuery(hql, Ve.class);
		query.setParameter("maGhe", maGhe);
		return query.getResultList();
	}
	@Override
	public List<Ve> findByMaLichChieu(Integer maLichChieu)
	{
		String hql = "FROM Ve WHERE maLichChieu = :maLichChieu";
		Session session = factory.getCurrentSession();
		TypedQuery<Ve> query = session.createQuery(hql, Ve.class);
		query.setParameter("maLichChieu", maLichChieu);
		return query.getResultList();
	}

}
