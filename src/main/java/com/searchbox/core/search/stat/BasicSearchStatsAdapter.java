package com.searchbox.core.search.stat;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.response.QueryResponse;

import com.searchbox.anno.SearchAdaptor;
import com.searchbox.core.adaptor.SolrElementAdapter;
import com.searchbox.core.dm.Preset;

@SearchAdaptor
public class BasicSearchStatsAdapter implements SolrElementAdapter<BasicSearchStats>{

	@Override
	public SolrQuery doAdapt(Preset preset,
			BasicSearchStats searchElement, SolrQuery query) {
		return query;
	}

	@Override
	public BasicSearchStats doAdapt(Preset preset,
			BasicSearchStats searchElement, SolrQuery query,
			QueryResponse response) {
		searchElement.setHitCount(response.getResults().getNumFound());
		searchElement.setSearchTime(response.getElapsedTime());
		return searchElement;
	}
}