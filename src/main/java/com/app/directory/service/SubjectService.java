package com.app.directory.service;

import com.app.directory.model.Subject;

import java.util.List;

public interface SubjectService {
    Subject getSubjectById(long id);

    void addSubject(Subject subject);

    void updateSubject(Subject subject);

    void deleteSubject(long id);

    boolean isSubjectExists(String eng);

    List<Subject> getAllSubjects();
}
