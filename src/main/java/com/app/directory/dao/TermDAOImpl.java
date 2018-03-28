package com.app.directory.dao;

import com.app.directory.model.Term;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Collection;
import java.util.Date;

@Transactional
@Repository
public class TermDAOImpl implements TermDAO {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Term getTermById(long id) {
        return entityManager.find(Term.class, id);
    }

    @Override
    public void addTerm(Term term) {
        entityManager.persist(term);
    }

    @Override
    public void updateTerm(Term term) {
        Term updTerm = getTermById(term.getId());
        updTerm.setEnglish(term.getEnglish());
        updTerm.setRussian(term.getRussian());
        updTerm.setUkraine(term.getUkraine());
        updTerm.setTranscription(term.getTranscription());
        updTerm.setAdded(new Date());
        updTerm.setSubjects(term.getSubjects());
        updTerm.setDescription(term.getDescription());
        entityManager.flush();
    }

    @Override
    public void deleteTerm(long id) {
        entityManager.remove(getTermById(id));
    }

    @SuppressWarnings("unchecked")
    @Override
    public Collection<Term> getAllTerms() {
        String hql = "FROM Term as terms ORDER BY terms.added";
        return (Collection<Term>) entityManager.createQuery(hql).getResultList();
    }
}
