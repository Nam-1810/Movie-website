package com.poly.entity;

import java.util.List;

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
@Table(name="NhanVien")

public class NhanVien {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer maNhanVien;
	
	@NotEmpty(message="Không để trống tên nhân viên")
	String tenNhanVien;
	
	@NotEmpty(message="Không để trống mật khẩu")
	@Length(min=8,message = "Mật khẩu tối thiểu 8 kí tự")
	@Length(max=18, message="Mật khẩu tối thiểu 18 kí tự")
	String matKhau;
	
	@NotEmpty(message = "Không để trống ngày sinh")
	String ngaySinh;
	
	Boolean gioiTinh;
	
	@NotEmpty(message = "Không để trống số điện thoại")
	@Length(min=10, max=10,message = "Số điện thoại 10 số")
	@Pattern(regexp = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$", message = "Số điện thoại không hợp lệ")
	String soDT;
	
	@NotEmpty(message = "Không để trống địa chỉ")
	String diaChi;	
	
	@NotEmpty(message = "Không để trống email")
	@Email(message = "Email không hợp lệ")
	@Pattern(regexp = ".+@.+\\..+",message="Email không hợp lệ!")
	String email;
	
	Boolean chucVu;	
	
	@OneToMany(mappedBy="nhanvien")
	List<DatVe> datVe;

	public Integer getMaNhanVien() {
		return maNhanVien;
	}

	public void setMaNhanVien(Integer maNhanVien) {
		this.maNhanVien = maNhanVien;
	}

	public String getTenNhanVien() {
		return tenNhanVien;
	}

	public void setTenNhanVien(String tenNhanVien) {
		this.tenNhanVien = tenNhanVien;
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

	public String getSoDT() {
		return soDT;
	}

	public void setSoDT(String soDT) {
		this.soDT = soDT;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getChucVu() {
		return chucVu;
	}

	public void setChucVu(Boolean chucVu) {
		this.chucVu = chucVu;
	}

	public List<DatVe> getDatVe() {
		return datVe;
	}

	public void setDatVe(List<DatVe> datVe) {
		this.datVe = datVe;
	}
	
	
}
