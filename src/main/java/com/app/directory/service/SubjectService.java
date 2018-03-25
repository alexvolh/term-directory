package com.app.directory.service;

import com.app.directory.model.Subject;

import java.util.List;

public interface SubjectService {
    Subject getSubjectById(long id);

    List<Subject> getAllSubjects();
}
