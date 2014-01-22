// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.searchbox.web;

import com.searchbox.domain.dm.Collection;
import com.searchbox.domain.dm.Field;
import com.searchbox.domain.engine.SearchEngine;
import com.searchbox.web.CollectionController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CollectionController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CollectionController.create(@Valid Collection collection, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, collection);
            return "collections/create";
        }
        uiModel.asMap().clear();
        collection.persist();
        return "redirect:/collections/" + encodeUrlPathSegment(collection.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CollectionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Collection());
        return "collections/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CollectionController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("collection", Collection.findCollection(id));
        uiModel.addAttribute("itemId", id);
        return "collections/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CollectionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("collections", Collection.findCollectionEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Collection.countCollections() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("collections", Collection.findAllCollections(sortFieldName, sortOrder));
        }
        return "collections/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CollectionController.update(@Valid Collection collection, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, collection);
            return "collections/update";
        }
        uiModel.asMap().clear();
        collection.merge();
        return "redirect:/collections/" + encodeUrlPathSegment(collection.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CollectionController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Collection.findCollection(id));
        return "collections/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CollectionController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Collection collection = Collection.findCollection(id);
        collection.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/collections";
    }
    
    void CollectionController.populateEditForm(Model uiModel, Collection collection) {
        uiModel.addAttribute("collection", collection);
        uiModel.addAttribute("fields", Field.findAllFields());
        uiModel.addAttribute("searchengines", SearchEngine.findAllSearchEngines());
    }
    
    String CollectionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
