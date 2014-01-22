// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.searchbox.web;

import com.searchbox.domain.app.Preset;
import com.searchbox.domain.app.Searchbox;
import com.searchbox.web.SearchboxController;
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

privileged aspect SearchboxController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SearchboxController.create(@Valid Searchbox searchbox, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, searchbox);
            return "searchboxes/create";
        }
        uiModel.asMap().clear();
        searchbox.persist();
        return "redirect:/searchboxes/" + encodeUrlPathSegment(searchbox.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SearchboxController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Searchbox());
        return "searchboxes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String SearchboxController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("searchbox", Searchbox.findSearchbox(id));
        uiModel.addAttribute("itemId", id);
        return "searchboxes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SearchboxController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("searchboxes", Searchbox.findSearchboxEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Searchbox.countSearchboxes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("searchboxes", Searchbox.findAllSearchboxes(sortFieldName, sortOrder));
        }
        return "searchboxes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SearchboxController.update(@Valid Searchbox searchbox, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, searchbox);
            return "searchboxes/update";
        }
        uiModel.asMap().clear();
        searchbox.merge();
        return "redirect:/searchboxes/" + encodeUrlPathSegment(searchbox.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String SearchboxController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Searchbox.findSearchbox(id));
        return "searchboxes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String SearchboxController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Searchbox searchbox = Searchbox.findSearchbox(id);
        searchbox.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/searchboxes";
    }
    
    void SearchboxController.populateEditForm(Model uiModel, Searchbox searchbox) {
        uiModel.addAttribute("searchbox", searchbox);
        uiModel.addAttribute("presets", Preset.findAllPresets());
    }
    
    String SearchboxController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
