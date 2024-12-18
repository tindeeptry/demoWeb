package DAO;

public class Club {
	private String MaHD;
	private String TenHD;
	private String NgayToChuc;
	
	public Club(String maHD, String tenHD, String ngayToChuc) {
		super();
		MaHD = maHD;
		TenHD = tenHD;
		NgayToChuc = ngayToChuc;
	}

	public String getMaHD() {
		return MaHD;
	}

	public void setMaHD(String maHD) {
		MaHD = maHD;
	}

	public String getTenHD() {
		return TenHD;
	}

	public void setTenHD(String tenHD) {
		TenHD = tenHD;
	}

	public String getNgayToChuc() {
		return NgayToChuc;
	}

	public void setNgayToChuc(String ngayToChuc) {
		NgayToChuc = ngayToChuc;
	}
	
}
