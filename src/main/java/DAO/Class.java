package DAO;

public class Class {
	private String MaLop;
	private String TenLop;
	private String MaKH;
	
	public Class(String maLop, String tenLop, String maKH) {
		super();
		MaLop = maLop;
		TenLop = tenLop;
		MaKH = maKH;
	}
	
	public String getMaLop() {
		return MaLop;
	}
	public void setMaLop(String maLop) {
		MaLop = maLop;
	}
	public String getTenLop() {
		return TenLop;
	}
	public void setTenLop(String tenLop) {
		TenLop = tenLop;
	}
	public String getMaKH() {
		return MaKH;
	}
	public void setMaKH(String maKH) {
		MaKH = maKH;
	}

	public static void forName(String string) {
		// TODO Auto-generated method stub
		
	}
	
}
