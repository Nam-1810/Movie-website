package com.poly.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="LichChieuPhim")
public class LichChieuPhim {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer maLichChieu;
	Double gia;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	Date ngayChieu;


	@ManyToOne
	@JoinColumn(name="maPhong")
	PhongChieuPhim phongchieuphim;
	
	//String maPhim
	@ManyToOne
	@JoinColumn(name="maPhim")
	Phim phim;
	
	//Integer maSuatChieu
	@ManyToOne
	@JoinColumn(name="maSuatChieu")
	SuatChieu suatchieu;
	
	@OneToMany(mappedBy="lichchieu")
	List<Ve> ve;
	
	public Double getGia() {
		return gia;
	}

	public void setGia(Double gia) {
		this.gia = gia;
	}

	public List<Ve> getVe() {
		return ve;
	}

	public void setVe(List<Ve> ve) {
		this.ve = ve;
	}

	public Integer getMaLichChieu() {
		return maLichChieu;
	}

	public void setMaLichChieu(Integer maLichChieu) {
		this.maLichChieu = maLichChieu;
	}


	public PhongChieuPhim getPhongchieuphim() {
		return phongchieuphim;
	}

	public void setPhongchieuphim(PhongChieuPhim phongchieuphim) {
		this.phongchieuphim = phongchieuphim;
	}

	public Phim getPhim() {
		return phim;
	}

	public void setPhim(Phim phim) {
		this.phim = phim;
	}

	public SuatChieu getSuatchieu() {
		return suatchieu;
	}

	public void setSuatchieu(SuatChieu suatchieu) {
		this.suatchieu = suatchieu;
	}

	public Date getNgayChieu() {
		return ngayChieu;
	}

	public void setNgayChieu(Date ngayChieu) {
		this.ngayChieu = ngayChieu;
	}
	
	

}
