package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.TheLoaiPhim;

@Transactional
@Repository
public class TheLoaiPhimDAOImpl implements TheLoaiPhimDAO {
	@Autowired
	SessionFactory factory;
	

	@Override
	public TheLoaiPhim findById(String maTheLoai) {
		Session session = factory.getCurrentSession();
		return session.find(TheLoaiPhim.class, maTheLoai);
	}

	@Override
	public List<TheLoaiPhim> findAll() {
		String hql ="FROM TheLoaiPhim";
		Session session = factory.getCurrentSession();
		TypedQuery<TheLoaiPhim> query = session.createQuery(hql, TheLoaiPhim.class);
		return query.getResultList();

	}

	@Override
	public TheLoaiPhim create(TheLoaiPhim entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(TheLoaiPhim entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public TheLoaiPhim delete(String maTheLoai) {
	TheLoaiPhim entity=this.findById(maTheLoai);
		Session session = factory.getCurrentSession();
		session.delete(entity);
		return entity;
		
	}

	

}
