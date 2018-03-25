package com.app.directory.service;

import com.app.directory.dao.SubjectDAO;
import com.app.directory.model.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
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
    public List<Subject> getAllSubjects() {
        return (List<Subject>) subjectDAO.getAllSubjects();
    }
}
