// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.searchbox.domain.app;

import com.searchbox.domain.app.FacetDefinition;
import com.searchbox.domain.app.Preset;
import com.searchbox.domain.dm.Field;

privileged aspect FacetDefinition_Roo_JavaBean {
    
    public String FacetDefinition.getLabel() {
        return this.label;
    }
    
    public void FacetDefinition.setLabel(String label) {
        this.label = label;
    }
    
    public Integer FacetDefinition.getPosition() {
        return this.position;
    }
    
    public void FacetDefinition.setPosition(Integer position) {
        this.position = position;
    }
    
    public Preset FacetDefinition.getPreset() {
        return this.preset;
    }
    
    public void FacetDefinition.setPreset(Preset preset) {
        this.preset = preset;
    }
    
}
