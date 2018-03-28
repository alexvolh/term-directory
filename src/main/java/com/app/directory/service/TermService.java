package com.app.directory.service;

import com.app.directory.model.Term;
import org.springframework.web.multipart.MultipartFile;

import java.util.Collection;

public interface TermService {
    Term getTermById(long id);

    void addTerm(Term term);

    void updateTerm(Term term);

    void deleteTerm(long id);

    boolean isTermExists(String eng);

    Collection<Term> getAllTerms();

    void loadImage(MultipartFile multipartFile, String fileName, String path);

    void renameImage(String oldName, String newName);

    void removeFile(String fileName);
}
