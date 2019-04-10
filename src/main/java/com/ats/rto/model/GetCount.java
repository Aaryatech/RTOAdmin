package com.ats.rto.model;

public class GetCount {

	private int noDocument;
	private int noCost;
	private int noPayment;
	private int noAllocate;
	private int noOffice;
	private int noRto;
	private int noHandover;
	private int noTotalHandover;
	public int getNoDocument() {
		return noDocument;
	}
	public void setNoDocument(int noDocument) {
		this.noDocument = noDocument;
	}
	public int getNoCost() {
		return noCost;
	}
	public void setNoCost(int noCost) {
		this.noCost = noCost;
	}
	public int getNoPayment() {
		return noPayment;
	}
	public void setNoPayment(int noPayment) {
		this.noPayment = noPayment;
	}
	public int getNoAllocate() {
		return noAllocate;
	}
	public void setNoAllocate(int noAllocate) {
		this.noAllocate = noAllocate;
	}
	public int getNoOffice() {
		return noOffice;
	}
	public void setNoOffice(int noOffice) {
		this.noOffice = noOffice;
	}
	public int getNoRto() {
		return noRto;
	}
	public void setNoRto(int noRto) {
		this.noRto = noRto;
	}
	public int getNoHandover() {
		return noHandover;
	}
	public void setNoHandover(int noHandover) {
		this.noHandover = noHandover;
	}
	public int getNoTotalHandover() {
		return noTotalHandover;
	}
	public void setNoTotalHandover(int noTotalHandover) {
		this.noTotalHandover = noTotalHandover;
	}
	@Override
	public String toString() {
		return "GetCount [noDocument=" + noDocument + ", noCost=" + noCost + ", noPayment=" + noPayment
				+ ", noAllocate=" + noAllocate + ", noOffice=" + noOffice + ", noRto=" + noRto + ", noHandover="
				+ noHandover + ", noTotalHandover=" + noTotalHandover + "]";
	}
	
	
}
