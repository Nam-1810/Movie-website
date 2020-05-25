package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.SuatChieu;
@Transactional
@Repository
public class SuatChieuDAOImpl implements SuatChieuDAO {
	@Autowired
	SessionFactory factory;
	
	@Override
	public SuatChieu findById(Integer maSuatChieu) {
		Session session = factory.getCurrentSession();
		return session.find(SuatChieu.class, maSuatChieu);
	}

	@Override
	public List<SuatChieu> findAll() {
		String hql="FROM SuatChieu";
		Session session = factory.getCurrentSession();
		TypedQuery<SuatChieu> query = session.createQuery(hql, SuatChieu.class); 
		return query.getResultList() ;
	}

	@Override
	public SuatChieu create(SuatChieu entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(SuatChieu entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public SuatChieu delete(Integer maSuatChieu) {
		SuatChieu entity = this.findById(maSuatChieu);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}

}
