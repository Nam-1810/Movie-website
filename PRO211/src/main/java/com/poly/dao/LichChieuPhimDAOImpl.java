package com.poly.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.LichChieuPhim;

@Transactional
@Repository
public class LichChieuPhimDAOImpl implements LichChieuPhimDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public LichChieuPhim findById(Integer maLichChieu) {
		Session session = factory.getCurrentSession();
		return session.find(LichChieuPhim.class, maLichChieu);
	}

	@Override
	public List<LichChieuPhim> findAll() {
		String hql = "FROM LichChieuPhim";
		Session session = factory.getCurrentSession();
		TypedQuery<LichChieuPhim> query = session.createQuery(hql, LichChieuPhim.class);
		return query.getResultList();
	}

	@Override
	public LichChieuPhim create(LichChieuPhim entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(LichChieuPhim entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);

	}

	@Override
	public LichChieuPhim delete(Integer maLichChieu) {
		LichChieuPhim entity = this.findById(maLichChieu);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}

	@Override
	public LichChieuPhim findByMSC(Integer maSuatChieu) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<LichChieuPhim> PhimDaChieu() {
		Date ngayHienTai = new Date();
		String hql = "FROM LichChieuPhim WHERE phim.ngayKetThuc < :ngayHienTai";
		Session session = factory.getCurrentSession();
		TypedQuery<LichChieuPhim> query = session.createQuery(hql, LichChieuPhim.class);
		query.setParameter("ngayHienTai", ngayHienTai);
		return query.getResultList();
	}

	@Override
	public List<LichChieuPhim> PhimDangChieu() {
		Date ngayHienTai = new Date();
		String hql = "FROM LichChieuPhim WHERE phim.ngayBatDau <= :ngayHienTai AND phim.ngayKetThuc >= :ngayHienTai";
		Session session = factory.getCurrentSession();
		TypedQuery<LichChieuPhim> query = session.createQuery(hql, LichChieuPhim.class);
		query.setParameter("ngayHienTai", ngayHienTai);
		return query.getResultList();
	}

	@Override
	public List<LichChieuPhim> PhimSapChieu() {
		Date ngayHienTai = new Date();
		String hql = "FROM LichChieuPhim WHERE phim.ngayBatDau > :ngayHienTai";
		Session session = factory.getCurrentSession();
		TypedQuery<LichChieuPhim> query = session.createQuery(hql, LichChieuPhim.class);
		query.setParameter("ngayHienTai", ngayHienTai);
		return query.getResultList();
	}
	
	@Override
	public List<LichChieuPhim> LichPhimDangChieu(Integer maPhim) {
		Date ngayHienTai = new Date();
		String hql = "FROM LichChieuPhim WHERE ngayChieu >= :ngayHienTai AND phim.ngayBatDau <= :ngayHienTai AND phim.ngayKetThuc >= :ngayHienTai AND phim.maPhim = :maPhim";
		Session session = factory.getCurrentSession();
		TypedQuery<LichChieuPhim> query = session.createQuery(hql, LichChieuPhim.class);
		query.setParameter("ngayHienTai", ngayHienTai);
		query.setParameter("maPhim", maPhim);
		return query.getResultList();
	}
	
	@Override
	public List<LichChieuPhim> findBySuatChieu(Integer maSuatChieu)
	{
		String hql = "FROM LichChieuPhim l WHERE suatchieu.maSuatChieu = :maSuatChieu";
		Session session = factory.getCurrentSession();
		TypedQuery<LichChieuPhim> query = session.createQuery(hql, LichChieuPhim.class);
		query.setParameter("maSuatChieu", maSuatChieu);
		return query.getResultList();
	}
	@Override
	public List<LichChieuPhim> findByPhongChieu(String maPhong)
	{
		String hql = "FROM LichChieuPhim WHERE maPhong = :maPhong";
		Session session = factory.getCurrentSession();
		TypedQuery<LichChieuPhim> query = session.createQuery(hql, LichChieuPhim.class);
		query.setParameter("maPhong", maPhong);
		return query.getResultList();
	}
	@Override
	public List<LichChieuPhim> findByMaPhim(Integer maPhim)
	{
		String hql = "FROM LichChieuPhim WHERE maPhim = :maPhim";
		Session session = factory.getCurrentSession();
		TypedQuery<LichChieuPhim> query = session.createQuery(hql, LichChieuPhim.class);
		query.setParameter("maPhim", maPhim);
		return query.getResultList();
	}
}
