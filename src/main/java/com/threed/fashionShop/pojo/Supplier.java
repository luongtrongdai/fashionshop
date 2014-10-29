package com.threed.fashionShop.pojo;

import javax.persistence.Entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "suppliers", uniqueConstraints = {
        @UniqueConstraint(columnNames = "SupplierId"),
        @UniqueConstraint(columnNames = "CompanyName") })
public class Supplier {
    @Id
    @Column(name = "SupplierId", unique = true, nullable = false)
    private Long supplierId;
    @Column(name = "CompanyName", unique = true, nullable = false, length = 100)
    private String companyName;
    @Column(name = "Address")
    private String address;
    @Column(name = "Country", length = 200)
    private String country;
    @Column(name = "Phone", length = 20)
    private String phone;
    @Column(name = "Fax", length = 20)
    private String fax;
    @Column(name = "Email", length = 100)
    private String email;
    @Column(name = "URL")
    private String url;
    @Column(name = "Note")
    private String note;

    
    public Long getSupplierId() {
        return supplierId;
    }
    public void setSupplierId(Long supplierId) {
        this.supplierId = supplierId;
    }
    
    public String getCompanyName() {
        return companyName;
    }
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
    
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
   
    public String getCountry() {
        return country;
    }
    public void setCountry(String country) {
        this.country = country;
    }
    
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getFax() {
        return fax;
    }
    public void setFax(String fax) {
        this.fax = fax;
    }
    
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    
    public String getNote() {
        return note;
    }
    public void setNote(String note) {
        this.note = note;
    }
}
