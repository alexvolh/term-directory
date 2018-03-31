package com.app.directory.service;

import com.app.directory.dao.SubjectDAO;
import com.app.directory.model.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    SubjectDAO subjectDAO;

    @Override
    public Subject getSubjectById(long id) {
        return  subjectDAO.getSubjectById(id);
    }

    @Override
    public void addSubject(Subject subject) {
        subjectDAO.addSubject(subject);
    }

    @Override
    public void updateSubject(Subject subject) {
        subjectDAO.updateSubject(subject);
    }

    @Override
    public void deleteSubject(long id) {
        subjectDAO.deleteSubject(id);
    }

    @Override
    public boolean isSubjectExists(String eng) {
        return subjectDAO.isSubjectExists(eng);
    }

    @Override
    public List<Subject> getAllSubjects() {
        return (List<Subject>) subjectDAO.getAllSubjects();
    }
}
