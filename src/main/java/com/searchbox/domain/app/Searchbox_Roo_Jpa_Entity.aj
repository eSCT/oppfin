// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.searchbox.domain.app;

import com.searchbox.domain.app.Searchbox;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Searchbox_Roo_Jpa_Entity {
    
    declare @type: Searchbox: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Searchbox.id;
    
    @Version
    @Column(name = "version")
    private Integer Searchbox.version;
    
    public Searchbox.new() {
        super();
    }

    public Long Searchbox.getId() {
        return this.id;
    }
    
    public void Searchbox.setId(Long id) {
        this.id = id;
    }
    
    public Integer Searchbox.getVersion() {
        return this.version;
    }
    
    public void Searchbox.setVersion(Integer version) {
        this.version = version;
    }
    
}