package com.app.directory.service;

import com.app.directory.model.Term;

import java.util.Collection;

public interface TermService {
    Term getTermById(long id);

    void addTerm(Term term);

    void updateTerm(Term term);

    void deleteTerm(long id);

    Collection<Term> getAllTerms();
}
