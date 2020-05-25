package com.poly.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name="KhachHang")

public class KhachHang {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer maKhachHang;
	
	@NotEmpty(message = "Không để trống tên khách hàng")
	String tenKhachHang;
	
	@NotEmpty(message = "Không để trống mật khẩu")
	@Length(min = 8, message = "Mật khẩu tối thiếu 8 kí tự")
	@Length(max= 18,message = "Mật khẩu tối đa 18 kí tự")
	String matKhau;
	
	@NotEmpty(message = "Không để trống ngày sinh")
	String ngaySinh;
	
	Boolean gioiTinh;
	
	@NotEmpty(message = "Không để trống địa chỉ")
	String diaChi;
	
	@NotEmpty(message = "Không để trống số điện thoại")
	@Length(min=10,max=10, message = "Số điện thoại phải có 10 số")
	@Pattern(regexp = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$",message = "Số điện thoại không hợp lệ")
	String soDT;
	
	@Column(updatable = false)
	@NotEmpty
	@Email(message = "Email không hợp lệ!")
	@Pattern(regexp = ".+@.+\\..+",message="Email không hợp lệ!")
	String email;
	
	@OneToMany(mappedBy="khachhang")
	List<DatVe> datve;
	
	@OneToMany(mappedBy="khachhang")
	List<DanhGia> danhgia;
	
	
	public List<DanhGia> getDanhgia() {
		return danhgia;
	}

	public void setDanhgia(List<DanhGia> danhgia) {
		this.danhgia = danhgia;
	}

	public Integer getMaKhachHang() {
		return maKhachHang;
	}

	public void setMaKhachHang(Integer maKhachHang) {
		this.maKhachHang = maKhachHang;
	}
	

	public String getTenKhachHang() {
		return tenKhachHang;
	}

	public void setTenKhachHang(String tenKhachHang) {
		this.tenKhachHang = tenKhachHang;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(String ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public Boolean getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(Boolean gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getSoDT() {
		return soDT;
	}

	public void setSoDT(String soDT) {
		this.soDT = soDT;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<DatVe> getDatve() {
		return datve;
	}

	public void setDatve(List<DatVe> datve) {
		this.datve = datve;
	}
	
	
	
}
