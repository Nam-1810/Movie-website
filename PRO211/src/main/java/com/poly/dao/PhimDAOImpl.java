package com.poly.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.Phim;

@Transactional
@Repository
public class PhimDAOImpl implements PhimDAO {
	@Autowired
	SessionFactory factory;
	

	@Override
	public Phim findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(Phim.class, id);
	}

	@Override
	public List<Phim> findAll() {
		String hql ="FROM Phim";
		Session session = factory.getCurrentSession();
		TypedQuery<Phim> query = session.createQuery(hql, Phim.class);
		return query.getResultList();

	}
	
	@Override
	public List<Phim> findSameCategory(Integer id, String maTheLoai) {
		String hql ="FROM Phim p WHERE maPhim != :id and p.theloaiphim.maTheLoai = :maTheLoai";
		Session session = factory.getCurrentSession();
		TypedQuery<Phim> query = session.createQuery(hql, Phim.class);
		query.setParameter("id", id);
		query.setParameter("maTheLoai", maTheLoai);
		return query.getResultList();
	}
	
	@Override
	public List<Phim> DangChieuVaSapChieu() {
		Date ngayHienTai = new Date();
		String hql ="FROM Phim  WHERE :ngayHienTai <= ngayKetThuc";
		Session session = factory.getCurrentSession();
		TypedQuery<Phim> query = session.createQuery(hql, Phim.class);
		query.setParameter("ngayHienTai", ngayHienTai);
		return query.getResultList();
	}
	
	@Override
	public List<Phim> PhimDangChieu() {
		Date ngayHienTai = new Date();
		String hql ="FROM Phim  WHERE :ngayHienTai <= ngayKetThuc AND :ngayHienTai >= ngayBatDau";
		Session session = factory.getCurrentSession();
		TypedQuery<Phim> query = session.createQuery(hql, Phim.class);
		query.setParameter("ngayHienTai", ngayHienTai);
		return query.getResultList();
	}
	
	@Override
	public List<Phim> PhimSapChieu() {
		Date ngayHienTai = new Date();
		String hql ="FROM Phim  WHERE :ngayHienTai < ngayBatDau";
		Session session = factory.getCurrentSession();
		TypedQuery<Phim> query = session.createQuery(hql, Phim.class);
		query.setParameter("ngayHienTai", ngayHienTai);
		return query.getResultList();
	}

	

	@Override
	public Phim create(Phim entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Phim entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public Phim delete(Integer id) {
	Phim entity=this.findById(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
		
	}

	@Override
	public List<Phim> findByMaTL(String maTheLoai)
	{
		String hql = "FROM Phim WHERE maTheLoai = :maTheLoai";
		Session session = factory.getCurrentSession();
		TypedQuery<Phim> query = session.createQuery(hql, Phim.class);
		query.setParameter("maTheLoai", maTheLoai);
		return query.getResultList();
	}

}
