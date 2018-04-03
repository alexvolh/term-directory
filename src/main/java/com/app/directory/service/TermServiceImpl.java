package com.app.directory.service;

import com.app.directory.dao.TermDAO;
import com.app.directory.model.Term;
import org.apache.commons.io.FilenameUtils;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.jpa.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.List;

@Service
public class TermServiceImpl implements TermService {

    @Autowired
    private TermDAO termDAO;

    @PersistenceContext
    EntityManager entityManager;

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
    public boolean isTermExists(String eng) {
        return termDAO.isTermExists(eng);
    }

    @Override
    public Collection<Term> getAllTerms() {
        return termDAO.getAllTerms();
    }

    public void loadImage(MultipartFile multipartFile, String fileName, String path) {
        try {
            multipartFile.transferTo(new File(path + fileName + "." + FilenameUtils.getExtension(multipartFile.getOriginalFilename())));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void renameImage(String oldName, String newName) {
        try {
            Files.move(Paths.get(oldName), Paths.get(newName));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void removeFile(String fileName) {
        try {
            Files.delete(Paths.get(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void createFolderIfNotExists(String path) {
        File directory = new File(path);

        if (!directory.exists()) {
            directory.mkdir();
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    @Transactional
    //Hibernate basic search by search criteria
    public Collection<Term> searchTerms(String searchKeywords) {
        FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(entityManager);
        try {
            fullTextEntityManager.createIndexer().startAndWait();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        QueryBuilder qb = fullTextEntityManager.getSearchFactory()
                .buildQueryBuilder().forEntity(Term.class).get();

        org.apache.lucene.search.Query query = qb
                .keyword()
                .onFields("english", "russian", "ukraine")
                .matching(searchKeywords)
                .createQuery();

        javax.persistence.Query persistenceQuery =
                fullTextEntityManager.createFullTextQuery(query, Term.class);

        List<Term> terms = null;
        try {
            terms = persistenceQuery.getResultList();
        } catch (NoResultException nre) {

        }

        return terms;
    }
}
