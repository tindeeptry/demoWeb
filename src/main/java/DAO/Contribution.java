package DAO;

public class Contribution {
	private String MaXH;
	private String MaSV;
	private int SoHoatDong;
	public Contribution(String maXH, String maSV, int soHoatDong) {
		super();
		MaXH = maXH;
		MaSV = maSV;
		SoHoatDong = soHoatDong;
	}
	public String getMaXH() {
		return MaXH;
	}
	public void setMaXH(String maXH) {
		MaXH = maXH;
	}
	public String getMaSV() {
		return MaSV;
	}
	public void setMaSV(String maSV) {
		MaSV = maSV;
	}
	public int getSoHoatDong() {
		return SoHoatDong;
	}
	public void setSoHoatDong(int soHoatDong) {
		SoHoatDong = soHoatDong;
	}
	
}
