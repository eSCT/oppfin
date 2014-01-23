package com.searchbox.web.admin;
import com.searchbox.domain.dm.Collection;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/collections")
@Controller
@RooWebScaffold(path = "admin/collections", formBackingObject = Collection.class)
public class CollectionController {
}