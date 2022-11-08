package com.jugameza.unBook.entities;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name="users")
@NoArgsConstructor @AllArgsConstructor
public class UserEntity {

    @Id @Column(name="id")
    @Getter
    private String id;

    @Column(name="name")
    @Getter @Setter
    private String name;

    @Column(name="birthDate")
    @Getter @Setter
    private String birthDate;

    @Column(name="sex")
    @Getter @Setter
    private String sex;

    @Column(name="genders")
    @Getter @Setter
    private String genders;

    @Column(name="favorites")
    @Getter @Setter
    private String favorites;

}
