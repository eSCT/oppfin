// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.searchbox.domain.dm;

import com.searchbox.domain.dm.Collection;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Collection_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Collection.entityManager;
    
    public static final List<String> Collection.fieldNames4OrderClauseFilter = java.util.Arrays.asList("name", "engine", "cfields");
    
    public static final EntityManager Collection.entityManager() {
        EntityManager em = new Collection().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Collection.countCollections() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Collection o", Long.class).getSingleResult();
    }
    
    public static List<Collection> Collection.findAllCollections() {
        return entityManager().createQuery("SELECT o FROM Collection o", Collection.class).getResultList();
    }
    
    public static List<Collection> Collection.findAllCollections(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Collection o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Collection.class).getResultList();
    }
    
    public static Collection Collection.findCollection(Long id) {
        if (id == null) return null;
        return entityManager().find(Collection.class, id);
    }
    
    public static List<Collection> Collection.findCollectionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Collection o", Collection.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Collection> Collection.findCollectionEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Collection o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Collection.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Collection.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Collection.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Collection attached = Collection.findCollection(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Collection.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Collection.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Collection Collection.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Collection merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
