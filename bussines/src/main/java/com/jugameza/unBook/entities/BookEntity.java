package com.jugameza.unBook.entities;

import lombok.*;

import javax.persistence.*;


@Entity
@Table(name = "books")
@NoArgsConstructor @AllArgsConstructor
public class BookEntity {

    @Id @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Getter @Setter
    private int id;

    @Column(name="author")
    @Getter @Setter
    private String author;

    @Column(name="title")
    @Getter @Setter
    private String title;

    @Column(name="releasedate")
    @Getter @Setter
    private String releaseDate;

    @Column(name="gender")
    @Getter @Setter
    private String gender;

    @Column(name="image")
    @Getter @Setter
    private String image;

}

