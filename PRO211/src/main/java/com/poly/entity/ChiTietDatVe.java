package com.poly.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="ChiTietDatVe")

public class ChiTietDatVe {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer maChiTietVe;

	//Integer maDatVe;
	@ManyToOne
	@JoinColumn(name="maDatVe")
	DatVe datve;
	
	//Integer maVe
	@ManyToOne
	@JoinColumn(name="maVe")
	Ve ve;
	
	public Ve getVe() {
		return ve;
	}

	public void setVe(Ve ve) {
		this.ve = ve;
	}

	public Integer getMaChiTietVe() {
		return maChiTietVe;
	}

	public void setMaChiTietVe(Integer maChiTietVe) {
		this.maChiTietVe = maChiTietVe;
	}

	public DatVe getDatve() {
		return datve;
	}

	public void setDatve(DatVe datve) {
		this.datve = datve;
	}

}
