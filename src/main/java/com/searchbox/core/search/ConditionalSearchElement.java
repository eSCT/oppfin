package com.searchbox.core.search;


public abstract class ConditionalSearchElement<K extends SearchCondition> 
	extends SearchElement implements GenerateSearchCondition<K>, SearchConditionToElementMerger {

	public ConditionalSearchElement(String label) {
		super(label);
	}
	
	public ConditionalSearchElement(String label, Integer position) {
		super(label, position);
	}

	@Override
	public abstract K getSearchCondition();
	
	public abstract void mergeSearchCondition(SearchCondition condition);
}