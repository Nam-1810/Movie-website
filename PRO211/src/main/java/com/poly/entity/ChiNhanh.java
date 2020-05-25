package com.poly.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;



@Entity
@Table(name="ChiNhanh")
public class ChiNhanh {
	@Id
	@NotEmpty(message="Nhập mã chi nhánh")
	String maChiNhanh;
	@NotEmpty(message="Nhập tên chi nhánh")
	String tenChiNhanh;
	@NotEmpty(message="Nhập địa chỉ chi nhánh")
	String diaChi;
	
	@OneToMany(mappedBy = "chinhanh")
	List<PhongChieuPhim> phongchieuphim ;

	
	
	public String getmaChiNhanh() {
		return maChiNhanh;
	}

	public void setmaChiNhanh(String maChiNhanh) {
		this.maChiNhanh = maChiNhanh;
	}
	
	public String getMaChiNhanh() {
		return maChiNhanh;
	}

	public void setMaChiNhanh(String maChiNhanh) {
		this.maChiNhanh = maChiNhanh;
	}

	public String getTenChiNhanh() {
		return tenChiNhanh;
	}

	public void setTenChiNhanh(String tenChiNhanh) {
		this.tenChiNhanh = tenChiNhanh;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public List<PhongChieuPhim> getPhongchieuphim() {
		return phongchieuphim;
	}

	public void setPhongchieuphim(List<PhongChieuPhim> phongchieuphim) {
		this.phongchieuphim = phongchieuphim;
	}

	
}
