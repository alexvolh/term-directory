package com.app.directory.dao;

import com.app.directory.model.Subject;

import java.util.Collection;

public interface SubjectDAO {

    Subject getSubjectById(long id);

    void addSubject(Subject subject);

    void updateSubject(Subject subject);

    void deleteSubject(long id);

    Collection<Subject> getAllSubjects();
}
