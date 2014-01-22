// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.searchbox.web;

import com.searchbox.domain.search.facet.FieldFacet;
import com.searchbox.web.FieldFacetController;
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

privileged aspect FieldFacetController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String FieldFacetController.create(@Valid FieldFacet fieldFacet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, fieldFacet);
            return "fieldfacets/create";
        }
        uiModel.asMap().clear();
        fieldFacet.persist();
        return "redirect:/fieldfacets/" + encodeUrlPathSegment(fieldFacet.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String FieldFacetController.createForm(Model uiModel) {
        populateEditForm(uiModel, new FieldFacet());
        return "fieldfacets/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String FieldFacetController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("fieldfacet", FieldFacet.findFieldFacet(id));
        uiModel.addAttribute("itemId", id);
        return "fieldfacets/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String FieldFacetController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("fieldfacets", FieldFacet.findFieldFacetEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) FieldFacet.countFieldFacets() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("fieldfacets", FieldFacet.findAllFieldFacets(sortFieldName, sortOrder));
        }
        return "fieldfacets/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String FieldFacetController.update(@Valid FieldFacet fieldFacet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, fieldFacet);
            return "fieldfacets/update";
        }
        uiModel.asMap().clear();
        fieldFacet.merge();
        return "redirect:/fieldfacets/" + encodeUrlPathSegment(fieldFacet.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String FieldFacetController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, FieldFacet.findFieldFacet(id));
        return "fieldfacets/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String FieldFacetController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        FieldFacet fieldFacet = FieldFacet.findFieldFacet(id);
        fieldFacet.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/fieldfacets";
    }
    
    void FieldFacetController.populateEditForm(Model uiModel, FieldFacet fieldFacet) {
        uiModel.addAttribute("fieldFacet", fieldFacet);
    }
    
    String FieldFacetController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
