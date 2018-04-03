package com.app.directory.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.apache.lucene.analysis.core.LowerCaseFilterFactory;
import org.apache.lucene.analysis.miscellaneous.WordDelimiterFilterFactory;
import org.apache.lucene.analysis.ngram.EdgeNGramFilterFactory;
import org.apache.lucene.analysis.standard.StandardTokenizerFactory;
import org.hibernate.search.annotations.*;
import org.hibernate.search.annotations.Parameter;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.xml.bind.annotation.XmlTransient;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Indexed
@Table(name = "TERM")
@AnalyzerDef(name = "autocompleteNGramAnalyzer",
        tokenizer = @TokenizerDef(factory = StandardTokenizerFactory.class),
        filters = {
                @TokenFilterDef(factory = WordDelimiterFilterFactory.class,
                        params = @Parameter(name = "catenateAll", value = "1")),
                @TokenFilterDef(factory = LowerCaseFilterFactory.class),
                @TokenFilterDef(factory = EdgeNGramFilterFactory.class, params = {
                        @Parameter(name = "minGramSize", value = "1"),
                        @Parameter(name = "maxGramSize", value = "5")})})
public class Term implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @NotEmpty(message = "English term need to be enter")
    @Field
    @Analyzer(definition = "autocompleteNGramAnalyzer")
    @Column(name = "english")
    private String english;

    @Field
    @Analyzer(definition = "autocompleteNGramAnalyzer")
    @NotEmpty(message = "Russian term need to be enter")
    @Column(name = "russian")
    private String russian;

    @Field
    @Analyzer(definition = "autocompleteNGramAnalyzer")
    @NotEmpty(message = "Ukrainian term need to be enter")
    @Column(name = "ukraine")
    private String ukraine;

    @NotEmpty(message = "Transcription need to be enter")
    @Column(name = "transcription")
    private String transcription;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date_time_added")
    private Date added;

    @Column(name = "description")
    private String description;

    @JsonIgnore
    @Transient
    private MultipartFile multipartFile;

    @NotEmpty(message = "Choose one subject at least")
    @ManyToMany
    @JoinTable(name = "SUBJECT_TERM",
            joinColumns = {@JoinColumn(name = "term_id")},
            inverseJoinColumns = {@JoinColumn(name = "subject_id")})
    private List<Subject> subjects = new ArrayList<>();

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getEnglish() {
        return english;
    }

    public void setEnglish(String english) {
        this.english = english;
    }

    public String getRussian() {
        return russian;
    }

    public void setRussian(String russian) {
        this.russian = russian;
    }

    public String getUkraine() {
        return ukraine;
    }

    public void setUkraine(String ukraine) {
        this.ukraine = ukraine;
    }

    public String getTranscription() {
        return transcription;
    }

    public void setTranscription(String transcription) {
        this.transcription = transcription;
    }

    public Date getAdded() {
        return added;
    }

    public void setAdded(Date added) {
        this.added = added;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    public MultipartFile getMultipartFile() {
        return multipartFile;
    }

    public void setMultipartFile(MultipartFile multipartFile) {
        this.multipartFile = multipartFile;
    }

    public List<Subject> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<Subject> subjects) {
        this.subjects = subjects;
    }
}
