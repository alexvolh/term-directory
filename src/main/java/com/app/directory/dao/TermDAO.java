package com.app.directory.dao;

import com.app.directory.model.Term;

import java.util.Collection;

public interface TermDAO {

    Term getTermById(long id);

    void addTerm(Term term);

    void updateTerm(Term term);

    void deleteTerm(long id);

    boolean isTermExists (String eng);

    Collection<Term> getAllTerms();
}
