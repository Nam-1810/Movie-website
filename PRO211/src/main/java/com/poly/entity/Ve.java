package com.poly.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Ve")

public class Ve {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer maVe;
	Boolean trangThai;
	
	//Integer maDatVe;
	@ManyToOne
	@JoinColumn(name="maGhe")
	GheNgoi ghengoi;
	
	//Integer maLichChieu
	@ManyToOne
	@JoinColumn(name="maLichChieu")
	LichChieuPhim lichchieu;
	
	@OneToMany(mappedBy = "ve")
	List<ChiTietDatVe> chitiet;
	

	public Integer getMaVe() {
		return maVe;
	}

	public void setMaVe(Integer maVe) {
		this.maVe = maVe;
	}

	public Boolean getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(Boolean trangThai) {
		this.trangThai = trangThai;
	}

	public GheNgoi getGhengoi() {
		return ghengoi;
	}

	public void setGhengoi(GheNgoi ghengoi) {
		this.ghengoi = ghengoi;
	}

	public LichChieuPhim getLichchieu() {
		return lichchieu;
	}

	public void setLichchieu(LichChieuPhim lichchieu) {
		this.lichchieu = lichchieu;
	}

	public List<ChiTietDatVe> getChitiet() {
		return chitiet;
	}

	public void setChitiet(List<ChiTietDatVe> chitiet) {
		this.chitiet = chitiet;
	}

	
}