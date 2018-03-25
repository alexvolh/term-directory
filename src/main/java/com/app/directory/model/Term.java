package com.app.directory.model;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.io.Serializable;
import java.util.*;

@Entity
@Table(name = "TERM")
public class Term implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @NotEmpty(message = "English term need to be enter")
    @Column(name = "english")
    private String english;

    @NotEmpty(message = "Russian term need to be enter")
    @Column(name = "russian")
    private String russian;

    @NotEmpty(message = "Ukrainian term need to be enter")
    @Column(name = "ukraine")
    private String ukraine;

    @Column(name = "img_link")
    private String imageLink;

    @NotEmpty(message = "Transcription need to be enter")
    @Column(name = "transcription")
    private String transcription;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date_time_added")
    private Date added;

    @Column(name = "description")
    private String description;

    @NotEmpty(message = "Choose one subject at least")
    @ManyToMany(fetch = FetchType.EAGER)
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

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
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

    public List<Subject> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<Subject> subjects) {
        this.subjects = subjects;
    }
}