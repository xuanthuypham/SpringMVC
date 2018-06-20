package com.tinyworld.hibernate.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


//ALTER TABLE user ADD CONSTRAINT userPermission FOREIGN KEY (permissionId) REFERENCES permission(id);
@Entity
@Table(name="permission")
public class Permission {
	@Id 
	@GeneratedValue 
	@Column(name="id")
	private int id	;//int(11) NOT NULL
	
	@Column(name="permissionName")
	private String permissionName	;//varchar(1000) NOT NULL
	
	@Column(name="description")
	private String description	;//varchar(2000) NOT NULL
	
	@Column(name="isManagerUser")
	private boolean isManagerUser	;//tinyint(1) NOT NULL
	
	@Column(name="isManagerCategory")
	private boolean isManagerCategory	;//tinyint(1) NOT NULL
	
	@Column(name="isManagerPermission")
	private boolean isManagerPermission	;//tinyint(1) NOT NULL
	
	@Column(name="canAddProduct")
	private boolean canAddProduct	;//tinyint(1) NOT NULL
	
	@Column(name="canAddShareFile")
	private boolean canAddShareFile	;//tinyint(1) NOT NULL
	
	@Column(name="canAddInformation")
	private boolean canAddInformation	;//tinyint(1) NOT NULL
	
	@Column(name="isOrderReportManager")
	private boolean isOrderReportManager	;//tinyint(1) NOT NULL
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "permission")
	private Set<User> users ; 
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPermissionName() {
		return permissionName;
	}
	public void setPermissionName(String permissionName) {
		this.permissionName = permissionName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isManagerUser() {
		return isManagerUser;
	}
	public void setManagerUser(boolean isManagerUser) {
		this.isManagerUser = isManagerUser;
	}
	public boolean isManagerCategory() {
		return isManagerCategory;
	}
	public void setManagerCategory(boolean isManagerCategory) {
		this.isManagerCategory = isManagerCategory;
	}
	public boolean isManagerPermission() {
		return isManagerPermission;
	}
	public void setManagerPermission(boolean isManagerPermission) {
		this.isManagerPermission = isManagerPermission;
	}
	public boolean isCanAddProduct() {
		return canAddProduct;
	}
	public void setCanAddProduct(boolean canAddProduct) {
		this.canAddProduct = canAddProduct;
	}
	public boolean isCanAddShareFile() {
		return canAddShareFile;
	}
	public void setCanAddShareFile(boolean canAddShareFile) {
		this.canAddShareFile = canAddShareFile;
	}
	public boolean isCanAddInformation() {
		return canAddInformation;
	}
	public void setCanAddInformation(boolean canAddInformation) {
		this.canAddInformation = canAddInformation;
	}
	public boolean isOrderReportManager() {
		return isOrderReportManager;
	}
	public void setOrderReportManager(boolean isOrderReportManager) {
		this.isOrderReportManager = isOrderReportManager;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
}
