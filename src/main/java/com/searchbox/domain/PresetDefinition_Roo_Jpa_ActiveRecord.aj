// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.searchbox.domain;

import com.searchbox.domain.PresetDefinition;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PresetDefinition_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager PresetDefinition.entityManager;
    
    public static final List<String> PresetDefinition.fieldNames4OrderClauseFilter = java.util.Arrays.asList("logger", "searchbox", "collection", "searchElements", "fieldAttributes", "slug", "label", "description", "global", "visible", "position");
    
    public static final EntityManager PresetDefinition.entityManager() {
        EntityManager em = new PresetDefinition().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PresetDefinition.countPresetDefinitions() {
        return entityManager().createQuery("SELECT COUNT(o) FROM PresetDefinition o", Long.class).getSingleResult();
    }
    
    public static List<PresetDefinition> PresetDefinition.findAllPresetDefinitions() {
        return entityManager().createQuery("SELECT o FROM PresetDefinition o", PresetDefinition.class).getResultList();
    }
    
    public static List<PresetDefinition> PresetDefinition.findAllPresetDefinitions(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM PresetDefinition o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, PresetDefinition.class).getResultList();
    }
    
    public static PresetDefinition PresetDefinition.findPresetDefinition(Long id) {
        if (id == null) return null;
        return entityManager().find(PresetDefinition.class, id);
    }
    
    public static List<PresetDefinition> PresetDefinition.findPresetDefinitionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PresetDefinition o", PresetDefinition.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<PresetDefinition> PresetDefinition.findPresetDefinitionEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM PresetDefinition o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, PresetDefinition.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void PresetDefinition.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PresetDefinition.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PresetDefinition attached = PresetDefinition.findPresetDefinition(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PresetDefinition.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PresetDefinition.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public PresetDefinition PresetDefinition.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PresetDefinition merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
