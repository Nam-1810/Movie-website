package com.poly.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name="TheLoaiPhim")
public class TheLoaiPhim {
	@Id
	@NotEmpty(message="Nhập mã thể loại phim")
	@Length(min=5,message ="Mã thể loại 5 ký tự")
	@Length(max=5,message ="Mã thể loại 5 ký tự")
	String maTheLoai;
	@NotEmpty(message="Nhập thể loại phim")
	String tenTheLoai;
	
	@OneToMany(mappedBy = "theloaiphim",fetch = FetchType.EAGER)
	List<Phim> phim;

	public String getMaTheLoai() {
		return maTheLoai;
	}

	public void setMaTheLoai(String maTheLoai) {
		this.maTheLoai = maTheLoai;
	}

	public String getTenTheLoai() {
		return tenTheLoai;
	}

	public void setTenTheLoai(String tenTheLoai) {
		this.tenTheLoai = tenTheLoai;
	}

	public List<Phim> getPhim() {
		return phim;
	}

	public void setPhim(List<Phim> phim) {
		this.phim = phim;
	}
	
	
}
