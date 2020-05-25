package com.poly.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="SuatChieu")
public class SuatChieu {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer maSuatChieu;
	
	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "hh:mm")
	Date gioBatDau;
	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "hh:mm")
	Date gioKetThuc;
	
	@OneToMany(mappedBy = "suatchieu")
	List<LichChieuPhim> lichchieuphim;

	public Integer getMaSuatChieu() {
		return maSuatChieu;
	}

	public void setMaSuatChieu(Integer maSuatChieu) {
		this.maSuatChieu = maSuatChieu;
	}

	public Date getGioBatDau() {
		return gioBatDau;
	}

	public void setGioBatDau(Date gioBatDau) {
		this.gioBatDau = gioBatDau;
	}

	public Date getGioKetThuc() {
		return gioKetThuc;
	}

	public void setGioKetThuc(Date gioKetThuc) {
		this.gioKetThuc = gioKetThuc;
	}

	public List<LichChieuPhim> getLichchieuphim() {
		return lichchieuphim;
	}

	public void setLichchieuphim(List<LichChieuPhim> lichchieuphim) {
		this.lichchieuphim = lichchieuphim;
	}
	
	
}
