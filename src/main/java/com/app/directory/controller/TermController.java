package com.app.directory.controller;

import com.app.directory.model.Subject;
import com.app.directory.model.Term;
import com.app.directory.service.SubjectService;
import com.app.directory.service.TermService;
import com.app.directory.service.TermServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;

@Controller

@RequestMapping("terms")
@SessionAttributes("subjects")
public class TermController {

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
    public String persistNewTerm(@Valid Term term, BindingResult result, @RequestParam("termPic") MultipartFile termPic, HttpServletRequest httpServletRequest) {
        if (result.hasErrors()) {
            return "addTerm";
        }
        term.setAdded(new Date());

        try {
            String rootDirectory = httpServletRequest.getSession().getServletContext().getRealPath("/");
            byte[] termPicBytes = termPic.getBytes();
            Path termsPicPath = Paths.get(rootDirectory + "terms-pic\\" + termPic.getOriginalFilename());
            Files.write(termsPicPath, termPicBytes);
            term.setImageLink(termPic.getOriginalFilename());
        } catch (IOException e) {
            e.printStackTrace();
        }

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
    public String updateTerm(@PathVariable("id") long id) {
        Term updatedTerm = termService.getTermById(id);
        if (updatedTerm != null) {
            termService.updateTerm(updatedTerm);
        }

        return "redirect: /terms/all";
    }

    @GetMapping("delete-term-{id}")
    public String removeTerm(@PathVariable("id") long id) {
        termService.deleteTerm(id);
        return "redirect: /terms/admin-list";
    }
}
