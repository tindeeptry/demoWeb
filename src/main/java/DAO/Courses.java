package DAO;

public class Courses {
	private String MaKH;
	private String TenKH;
	private String NgayBatDau_N_H;
	private String NgayKetThuc_N_H;
	public Courses(String maKH, String tenKH, String ngayBatDau_N_H, String ngayKetThuc_N_H) {
		super();
		MaKH = maKH;
		TenKH = tenKH;
		NgayBatDau_N_H = ngayBatDau_N_H;
		NgayKetThuc_N_H = ngayKetThuc_N_H;
	}
	public String getMaKH() {
		return MaKH;
	}
	public void setMaKH(String maKH) {
		MaKH = maKH;
	}
	public String getTenKH() {
		return TenKH;
	}
	public void setTenKH(String tenKH) {
		TenKH = tenKH;
	}
	public String getNgayBatDau_N_H() {
		return NgayBatDau_N_H;
	}
	public void setNgayBatDau_N_H(String ngayBatDau_N_H) {
		NgayBatDau_N_H = ngayBatDau_N_H;
	}
	public String getNgayKetThuc_N_H() {
		return NgayKetThuc_N_H;
	}
	public void setNgayKetThuc_N_H(String ngayKetThuc_N_H) {
		NgayKetThuc_N_H = ngayKetThuc_N_H;
	}
	
}
