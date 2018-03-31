package com.app.directory.service;

import com.app.directory.dao.TermDAO;
import com.app.directory.model.Term;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
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
}
