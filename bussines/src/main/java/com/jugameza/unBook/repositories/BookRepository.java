package com.jugameza.unBook.repositories;

import com.jugameza.unBook.entities.BookEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookRepository extends JpaRepository<BookEntity, Integer> {

    public List<BookEntity> findByGender(String gender);

}
