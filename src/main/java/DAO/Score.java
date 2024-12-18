package DAO;

public class Score {
	private String MaLopMonHoc;
	private String MaLop;
	private String MaMH;
	private String MaSV;
	private float Diem;
	public Score(String maLopMonHoc, String maLop, String maMH, String maSV, float diem) {
		super();
		MaLopMonHoc = maLopMonHoc;
		MaLop = maLop;
		MaMH = maMH;
		MaSV = maSV;
		Diem = diem;
	}
	public String getMaLopMonHoc() {
		return MaLopMonHoc;
	}
	public void setMaLopMonHoc(String maLopMonHoc) {
		MaLopMonHoc = maLopMonHoc;
	}
	public String getMaLop() {
		return MaLop;
	}
	public void setMaLop(String maLop) {
		MaLop = maLop;
	}
	public String getMaMH() {
		return MaMH;
	}
	public void setMaMH(String maMH) {
		MaMH = maMH;
	}
	public String getMaSV() {
		return MaSV;
	}
	public void setMaSV(String maSV) {
		MaSV = maSV;
	}
	public float getDiem() {
		return Diem;
	}
	public void setDiem(float diem) {
		Diem = diem;
	}
	
	
}
