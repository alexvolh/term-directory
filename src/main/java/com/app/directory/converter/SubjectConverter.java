package com.app.directory.converter;

import com.app.directory.model.Subject;
import com.app.directory.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.stereotype.Component;

@Component
public class SubjectConverter implements Converter<Object, Subject> {

    @Autowired
    SubjectService subjectService;

    @Override
    public Subject convert(Object element) {
        Integer id = Integer.parseInt((String)element);
        Subject subject = subjectService.getSubjectById(id);
        return subject;
    }
}
