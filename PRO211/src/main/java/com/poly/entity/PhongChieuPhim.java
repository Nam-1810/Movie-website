package com.poly.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import org.hibernate.validator.constraints.Length;



@Entity
@Table(name = "PhongChieuPhim")
public class PhongChieuPhim {

	@Id
	@Length(min = 2, message = "Nhập 2 ký tự")
	String maPhong;
	@NotEmpty(message = "không để trống tên phòng")
	String tenPhong;
//	@Length(min=10,message = "Tổng số ghế lớn hơn 10 nhỏ hơn 50")
//	@Size(min = 10, message = "loi")
	@Min(10)
	@Max(50)
	Integer tongSoGhe;

	// String maChiNhanh;
	@ManyToOne
	@JoinColumn(name = "maChiNhanh")
	ChiNhanh chinhanh;

	@OneToMany(mappedBy = "phongchieuphim")
	List<LichChieuPhim> lichchieuphim;

	@OneToMany(mappedBy = "phongchieuphim")
	List<GheNgoi> ghengoi;

	public String getMaPhong() {
		return maPhong;
	}

	public void setMaPhong(String maPhong) {
		this.maPhong = maPhong;
	}

	public String getTenPhong() {
		return tenPhong;
	}

	public void setTenPhong(String tenPhong) {
		this.tenPhong = tenPhong;
	}

	public Integer getTongSoGhe() {
		return tongSoGhe;
	}

	public void setTongSoGhe(Integer tongSoGhe) {
		this.tongSoGhe = tongSoGhe;
	}

	public ChiNhanh getChinhanh() {
		return chinhanh;
	}

	public void setChinhanh(ChiNhanh chinhanh) {
		this.chinhanh = chinhanh;
	}

	public List<LichChieuPhim> getLichchieuphim() {
		return lichchieuphim;
	}

	public void setLichchieuphim(List<LichChieuPhim> lichchieuphim) {
		this.lichchieuphim = lichchieuphim;
	}

	public List<GheNgoi> getGhengoi() {
		return ghengoi;
	}

	public void setGhengoi(List<GheNgoi> ghengoi) {
		this.ghengoi = ghengoi;
	}

}
