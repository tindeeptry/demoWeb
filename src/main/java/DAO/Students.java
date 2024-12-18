package DAO;

public class Students {
	private String MaSV;
	private String MaLop;
    private String TenSV;
    private String email;
    private String SDT;
    private String DOB;
    private String DiaChi;
	public Students(String maSV, String maLop, String tenSV, String email, String sDT, String dOB, String diaChi) {
		super();
		MaSV = maSV;
		MaLop = maLop;
		TenSV = tenSV;
		this.email = email;
		SDT = sDT;
		DOB = dOB;
		DiaChi = diaChi;
	}
	public String getMaSV() {
		return MaSV;
	}
	public void setMaSV(String maSV) {
		MaSV = maSV;
	}
	public String getMaLop() {
		return MaLop;
	}
	public void setMaLop(String maLop) {
		MaLop = maLop;
	}
	public String getTenSV() {
		return TenSV;
	}
	public void setTenSV(String tenSV) {
		TenSV = tenSV;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSDT() {
		return SDT;
	}
	public void setSDT(String sDT) {
		SDT = sDT;
	}
	public String getDOB() {
		return DOB;
	}
	public void setDOB(String dOB) {
		DOB = dOB;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
    
	
}
