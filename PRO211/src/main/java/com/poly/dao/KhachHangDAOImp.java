package com.poly.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.KhachHang;

@Transactional
@Repository
public class KhachHangDAOImp implements KhachHangDAO {
	@Autowired
	SessionFactory factory;
	
	
	@Override
	public KhachHang findById(Integer maKhachHang) {
		Session session = factory.getCurrentSession();
		return session.find(KhachHang.class, maKhachHang);
	}
	
	@Override
	public KhachHang findByEmail(String email) { 
		try {
			String hql = "FROM KhachHang  WHERE email = :email";
			Session session = factory.getCurrentSession();
			TypedQuery<KhachHang> query = session.createQuery(hql); 
			query.setParameter("email", email);
			return query.getSingleResult();	
		}catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public List<KhachHang> findAll() {
		String hql="FROM KhachHang";
		Session session = factory.getCurrentSession();
		TypedQuery<KhachHang> query = session.createQuery(hql, KhachHang.class); 
		return query.getResultList() ;
	}

	@Override
	public KhachHang create(KhachHang entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(KhachHang entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public KhachHang delete(Integer maKhachHang) {
		Session session = factory.getCurrentSession();
		KhachHang entity = this.findById(maKhachHang);
		session.remove(entity);
		return entity;
	}
	
	@Override
	public KhachHang findByName(String tenKhachHang) {
		Session session = factory.getCurrentSession();
		return session.find(KhachHang.class, tenKhachHang);
		
	}

}
