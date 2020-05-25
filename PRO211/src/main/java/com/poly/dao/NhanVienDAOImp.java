package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.NhanVien;

@Transactional
@Repository
public class NhanVienDAOImp implements NhanVienDAO {
	@Autowired
	SessionFactory factory;
	Session session;
	
	@Override
	public NhanVien findById(Integer maNhanVien) {
		session = factory.getCurrentSession();
		return session.find(NhanVien.class, maNhanVien);
	}
	
	@Override
	public NhanVien findByEmail(String email) {
		try {
			session = factory.getCurrentSession();
			String hql = "FROM NhanVien Where email= :email";
			TypedQuery<NhanVien> query = session.createQuery(hql,NhanVien.class);
			query.setParameter("email",email);
			return query.getSingleResult();
		}catch(Exception e) {
			return null;
		}
	}

	@Override
	public List<NhanVien> findAll() {
		String hql = "FROM NhanVien";
		session = factory.getCurrentSession();
		TypedQuery<NhanVien> query = session.createQuery(hql, NhanVien.class);
		return query.getResultList();
	}

	@Override
	public NhanVien create(NhanVien entity) {
		session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(NhanVien entity) {
		session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public NhanVien delete(Integer maNhanVien) {
		session = factory.getCurrentSession();
		NhanVien entity = this.findById(maNhanVien);
		session.remove(entity);
		return entity;
	}
	
	
}
