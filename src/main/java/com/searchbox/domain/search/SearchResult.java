package com.searchbox.domain.search;

import java.util.ArrayList;
import java.util.List;
import java.util.SortedSet;
import java.util.TreeSet;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
public class SearchResult {

	List<String> fields = new ArrayList<String>();
	SortedSet<Hit> hits = new TreeSet<Hit>();
	SortedSet<Facet> facets = new TreeSet<Facet>();
	
	public void addHit(Hit hit) {
		this.hits.add(hit);
	}
	
}