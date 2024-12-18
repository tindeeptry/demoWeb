package DAO;

public class Teachers {
	 private String MaGV;
	 private String TenGV;
	 private String SDT;
	 private String email;
	 private String DOB;
	public Teachers(String maGV, String tenGV, String sDT, String email, String dOB) {
		super();
		MaGV = maGV;
		TenGV = tenGV;
		SDT = sDT;
		this.email = email;
		DOB = dOB;
	}
	public String getMaGV() {
		return MaGV;
	}
	public void setMaGV(String maGV) {
		MaGV = maGV;
	}
	public String getTenGV() {
		return TenGV;
	}
	public void setTenGV(String tenGV) {
		TenGV = tenGV;
	}
	public String getSDT() {
		return SDT;
	}
	public void setSDT(String sDT) {
		SDT = sDT;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDOB() {
		return DOB;
	}
	public void setDOB(String dOB) {
		DOB = dOB;
	}
	
	 
}
