// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.searchbox.web;

import com.searchbox.domain.app.FieldDefinition;
import com.searchbox.domain.dm.Field;
import com.searchbox.web.FieldDefinitionController;
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

privileged aspect FieldDefinitionController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String FieldDefinitionController.create(@Valid FieldDefinition fieldDefinition, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, fieldDefinition);
            return "fielddefinitions/create";
        }
        uiModel.asMap().clear();
        fieldDefinition.persist();
        return "redirect:/fielddefinitions/" + encodeUrlPathSegment(fieldDefinition.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String FieldDefinitionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new FieldDefinition());
        return "fielddefinitions/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String FieldDefinitionController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("fielddefinition", FieldDefinition.findFieldDefinition(id));
        uiModel.addAttribute("itemId", id);
        return "fielddefinitions/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String FieldDefinitionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("fielddefinitions", FieldDefinition.findFieldDefinitionEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) FieldDefinition.countFieldDefinitions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("fielddefinitions", FieldDefinition.findAllFieldDefinitions(sortFieldName, sortOrder));
        }
        return "fielddefinitions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String FieldDefinitionController.update(@Valid FieldDefinition fieldDefinition, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, fieldDefinition);
            return "fielddefinitions/update";
        }
        uiModel.asMap().clear();
        fieldDefinition.merge();
        return "redirect:/fielddefinitions/" + encodeUrlPathSegment(fieldDefinition.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String FieldDefinitionController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, FieldDefinition.findFieldDefinition(id));
        return "fielddefinitions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String FieldDefinitionController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        FieldDefinition fieldDefinition = FieldDefinition.findFieldDefinition(id);
        fieldDefinition.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/fielddefinitions";
    }
    
    void FieldDefinitionController.populateEditForm(Model uiModel, FieldDefinition fieldDefinition) {
        uiModel.addAttribute("fieldDefinition", fieldDefinition);
        uiModel.addAttribute("fields", Field.findAllFields());
    }
    
    String FieldDefinitionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
