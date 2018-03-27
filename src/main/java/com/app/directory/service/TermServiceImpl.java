package com.app.directory.service;

import com.app.directory.dao.TermDAO;
import com.app.directory.model.Term;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class TermServiceImpl implements TermService {

    @Autowired
    private TermDAO termDAO;

    @Override
    public Term getTermById(long id) {
        return termDAO.getTermById(id);
    }

    @Override
    public void addTerm(Term term) {
        termDAO.addTerm(term);
    }

    @Override
    public void updateTerm(Term term) {
        termDAO.updateTerm(term);
    }

    @Override
    public void deleteTerm(long id) {
        termDAO.deleteTerm(id);
    }

    @Override
    public Collection<Term> getAllTerms() {
        return termDAO.getAllTerms();
    }
}
