package com.app.directory.dao;

import com.app.directory.model.Subject;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Collection;

@Transactional
@Repository
public class SubjectDAOImpl implements SubjectDAO {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Subject getSubjectById(long id) {
        return entityManager.find(Subject.class, id);
    }

    @Override
    public void addSubject(Subject subject) {
        entityManager.persist(subject);
    }

    @Override
    public void updateSubject(Subject subject) {
        Subject updSubject = getSubjectById(subject.getId());
        updSubject.setEnglish(subject.getEnglish());
        updSubject.setRussian(subject.getRussian());
        updSubject.setUkraine(subject.getUkraine());
        entityManager.flush();
    }

    @Override
    public void deleteSubject(long id) {
        entityManager.remove(getSubjectById(id));
    }

    @SuppressWarnings("unchecked")
    @Override
    public boolean isSubjectExists(String eng) {
        String hql = "FROM Subject as subjects WHERE subjects.english = :english";
        int count = entityManager.createQuery(hql).setParameter("english", eng).getResultList().size();

        return count > 0 ? true : false;
    }

    @SuppressWarnings("unchecked")
    @Override
    public Collection<Subject> getAllSubjects() {
        String hql = "FROM Subject as subject ORDER BY subject.english";
        return (Collection<Subject>) entityManager.createQuery(hql).getResultList();
    }
}
