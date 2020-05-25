package com.poly.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name="GheNgoi")
public class GheNgoi {

	@Id
	String maGhe;
	
	//String maPhong;
	@ManyToOne
	@JoinColumn(name="maPhong")
	PhongChieuPhim phongchieuphim;

	@OneToMany(mappedBy="ghengoi")
	List<Ve> ve;
	
	public String getMaGhe() {
		return maGhe;
	}

	public void setMaGhe(String maGhe) {
		this.maGhe = maGhe;
	}


	public PhongChieuPhim getPhongchieuphim() {
		return phongchieuphim;
	}

	public void setPhongchieuphim(PhongChieuPhim phongchieuphim) {
		this.phongchieuphim = phongchieuphim;
	}
}
