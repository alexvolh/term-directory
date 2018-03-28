package com.app.directory.service;

import com.app.directory.dao.TermDAO;
import com.app.directory.model.Term;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
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

    public void loadImage(MultipartFile multipartFile, String fileName, String path,  boolean isNewLoad) {
        if (multipartFile != null && !multipartFile.isEmpty()) {

            try {
                multipartFile.transferTo(new File(path + "terms-pic\\" + fileName + "." + FilenameUtils.getExtension(multipartFile.getOriginalFilename())));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
