package com.app.directory.model;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "SUBJECT")
public class Subject implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @NotEmpty(message = "English subject need to be enter")
    @Column(name = "english")
    private String english;

    @Column(name = "russian")
    private String russian;

    @Column(name = "ukraine")
    private String ukraine;

    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "subjects")
    private List<Term> terms = new ArrayList<>();

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

    public List<Term> getTerms() {
        return terms;
    }

    public void setTerms(List<Term> terms) {
        this.terms = terms;
    }
}
