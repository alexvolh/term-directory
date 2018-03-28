package com.app.directory.controller;

import com.app.directory.model.Subject;
import com.app.directory.model.Term;
import com.app.directory.service.SubjectService;
import com.app.directory.service.TermService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller

@RequestMapping("terms")
@SessionAttributes("subjects")
public class TermController {
    private final int maxFileSize = 1000000;

    @Autowired
    private TermService termService;

    @Autowired
    private SubjectService subjectService;

    @ModelAttribute("subjects")
    public List<Subject> initializeSubjects() {
        return subjectService.getAllSubjects();
    }

    @GetMapping("all")
    public String getAllTerms(ModelMap modelMap) {
        List<Term> terms = new ArrayList<>(termService.getAllTerms());
        modelMap.addAttribute("terms", terms);

        return "terms";
    }

    @GetMapping("admin-list")
    public String getTermAdminList(ModelMap modelMap) {
        List<Term> terms = new ArrayList<>(termService.getAllTerms());
        modelMap.addAttribute("terms", terms);

        return "termsAdminList";
    }

    @GetMapping("term-{id}")
    public String getTerm(@PathVariable("id") Long id, ModelMap modelMap) {
        Term term = termService.getTermById(id);
        modelMap.addAttribute("term", term);

        return "term";
    }

    @GetMapping("add")
    public String addNewTerm(ModelMap modelMap) {
        Term term = new Term();
        modelMap.addAttribute("term", term);

        return "addTerm";
    }

    @PostMapping("add")
    public String persistNewTerm(@Valid Term term, BindingResult result, HttpServletRequest httpServletRequest) {
        if (result.hasErrors()) {
            return "addTerm";
        }

        if(term.getMultipartFile().getSize() > maxFileSize) {
            FieldError loadFileError = new FieldError("term", "multipartFile", "Error load file. Max size of image 1 Mb");
            result.addError(loadFileError);
            return "addTerm";
        }

        term.setAdded(new Date());

        termService.loadImage(term.getMultipartFile(),
                                term.getEnglish(),
                                httpServletRequest.getSession().getServletContext().getRealPath("/"),
                                true);
        termService.addTerm(term);

        return "redirect: /terms/all";
    }

    @GetMapping("edit-term-{id}")
    public String editTerm(@PathVariable("id") long id, ModelMap modelMap) {
        Term term = termService.getTermById(id);
        modelMap.addAttribute("term", term);

        return "editTerm";
    }

    @PostMapping("edit-term-{id}")
    public String updateTerm(@Valid @ModelAttribute("term") Term term, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "editTerm";
        }

        termService.updateTerm(term);

        return "redirect: /terms/all";
    }

    @GetMapping("delete-term-{id}")
    public String removeTerm(@PathVariable("id") long id) {
        termService.deleteTerm(id);

        return "redirect: /terms/admin-list";
    }
}
