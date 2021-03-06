/*******************************************************************************
 * Copyright Searchbox - http://www.searchbox.com
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/
package com.searchbox.core.dm;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.searchbox.core.SearchAttribute;
import com.searchbox.core.engine.SearchEngine;

public class MultiCollection implements Collection, SearchableCollection {

  @SearchAttribute
  protected String name;

  @SearchAttribute
  protected String description;

  @SearchAttribute
  protected List<String> collections = new ArrayList<>();

  @SearchAttribute
  protected String idFieldName;
  
  @SearchAttribute
  protected SearchEngine<?,?> searchEngine;

  public MultiCollection() {

  }

  public MultiCollection(String name) {
    this.name = name;
  }

  public String getName() {
    return this.name;
  }

  public void setName(String name) {
    this.name = name;
  }

  @Override
  public String toString() {
    return ReflectionToStringBuilder.toString(this,
        ToStringStyle.SHORT_PREFIX_STYLE);
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public List<String> getCollections() {
    return collections;
  }

  public void setCollections(List<String> collections) {
    this.collections = collections;
  }

  @Override
  public String getIdFieldName() {
    return idFieldName;
  }
  
  public void setIdFieldName(String idFieldName) {
    this.idFieldName = idFieldName;
  }

  public SearchEngine<?, ?> getSearchEngine() {
    return searchEngine;
  }

  public SearchableCollection setSearchEngine(SearchEngine<?, ?> searchEngine) {
    this.searchEngine = searchEngine;
    return this;
  }
}
