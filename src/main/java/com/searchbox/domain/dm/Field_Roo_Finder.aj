// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.searchbox.domain.dm;

import com.searchbox.domain.dm.Collection;
import com.searchbox.domain.dm.Field;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Field_Roo_Finder {
    
    public static Long Field.countFindFieldsByKeyEqualsAndCollectionEquals(String key, Collection collection) {
        if (key == null || key.length() == 0) throw new IllegalArgumentException("The key argument is required");
        if (collection == null) throw new IllegalArgumentException("The collection argument is required");
        EntityManager em = Field.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM Field AS o WHERE o.key = :key  AND o.collection = :collection", Long.class);
        q.setParameter("key", key);
        q.setParameter("collection", collection);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<Field> Field.findFieldsByKeyEqualsAndCollectionEquals(String key, Collection collection) {
        if (key == null || key.length() == 0) throw new IllegalArgumentException("The key argument is required");
        if (collection == null) throw new IllegalArgumentException("The collection argument is required");
        EntityManager em = Field.entityManager();
        TypedQuery<Field> q = em.createQuery("SELECT o FROM Field AS o WHERE o.key = :key  AND o.collection = :collection", Field.class);
        q.setParameter("key", key);
        q.setParameter("collection", collection);
        return q;
    }
    
    public static TypedQuery<Field> Field.findFieldsByKeyEqualsAndCollectionEquals(String key, Collection collection, String sortFieldName, String sortOrder) {
        if (key == null || key.length() == 0) throw new IllegalArgumentException("The key argument is required");
        if (collection == null) throw new IllegalArgumentException("The collection argument is required");
        EntityManager em = Field.entityManager();
        String jpaQuery = "SELECT o FROM Field AS o WHERE o.key = :key  AND o.collection = :collection";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        TypedQuery<Field> q = em.createQuery(jpaQuery, Field.class);
        q.setParameter("key", key);
        q.setParameter("collection", collection);
        return q;
    }
    
}
