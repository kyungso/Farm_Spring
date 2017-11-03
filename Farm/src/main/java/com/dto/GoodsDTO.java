package com.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Alias("GoodsDTO")
public class GoodsDTO {

	private String gcode;
	private String gcategory;
	private String gname;
	private String gcontent;
	private int gprice;
	private String gimage1;
	private String gimage2;
	private List<MultipartFile> image;
	
	public String getGcode() {
		return gcode;
	}
	public void setGcode(String gcode) {
		this.gcode = gcode;
	}
	public String getGcategory() {
		return gcategory;
	}
	public void setGcategory(String gcategory) {
		this.gcategory = gcategory;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGcontent() {
		return gcontent;
	}
	public void setGcontent(String gcontent) {
		this.gcontent = gcontent;
	}
	public int getGprice() {
		return gprice;
	}
	public void setGprice(int gprice) {
		this.gprice = gprice;
	}
	public String getGimage1() {
		return gimage1;
	}
	public void setGimage1(String gimage1) {
		this.gimage1 = gimage1;
	}
	public String getGimage2() {
		return gimage2;
	}
	public void setGimage2(String gimage2) {
		this.gimage2 = gimage2;
	}
	public List<MultipartFile> getImage() {
		return image;
	}
	public void setImage(List<MultipartFile> image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "GoodsDTO [gcode=" + gcode + ", gcategory=" + gcategory + ", gname=" + gname + ", gcontent=" + gcontent
				+ ", gprice=" + gprice + ", gimage1=" + gimage1 + ", gimage2=" + gimage2 + ", image=" + image + "]";
	}
	public GoodsDTO(String gcode, String gcategory, String gname, String gcontent, int gprice, String gimage1,
			String gimage2, List<MultipartFile> image) {
		super();
		this.gcode = gcode;
		this.gcategory = gcategory;
		this.gname = gname;
		this.gcontent = gcontent;
		this.gprice = gprice;
		this.gimage1 = gimage1;
		this.gimage2 = gimage2;
		this.image = image;
	}
	public GoodsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
