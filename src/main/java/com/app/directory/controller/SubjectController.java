package com.app.directory.controller;

import com.app.directory.model.Subject;
import com.app.directory.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("subjects")
public class SubjectController {
    @Autowired
    private SubjectService subjectService;

    @GetMapping("all")
    public String getAllSubjects(ModelMap modelMap) {
        List<Subject> subjects = new ArrayList<>(subjectService.getAllSubjects());
        modelMap.addAttribute("subjects", subjects);

        return "subjectsAdminList";
    }

    @GetMapping("add")
    public String addNewSubject(ModelMap modelMap) {
        Subject subject = new Subject();
        modelMap.addAttribute("subject", subject);

        return "addSubject";
    }

    @PostMapping("add")
    public String persistNewSubject(@Valid Subject subject, BindingResult result, HttpServletRequest servletRequest) {
        if (result.hasErrors()) {
            return "addSubject";
        }

        if (subjectService.isSubjectExists(subject.getEnglish())) {
            FieldError loadFileError = new FieldError("subject", "english", "That subject is already exists");
            result.addError(loadFileError);
            return "addSubject";
        }
        subjectService.addSubject(subject);
        servletRequest.getSession().setAttribute("subjects", subjectService.getAllSubjects());

        return "redirect: /subjects/all";
    }

    @PostMapping("delete-subject")
    public String removeSubject(@RequestParam String subjectId, HttpServletRequest servletRequest) {
        subjectService.deleteSubject(Long.valueOf(subjectId));
        servletRequest.getSession().setAttribute("subjects", subjectService.getAllSubjects());

        return "redirect: /subjects/all";
    }
}
