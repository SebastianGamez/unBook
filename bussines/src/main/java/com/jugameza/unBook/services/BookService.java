package com.jugameza.unBook.services;

import com.jugameza.unBook.entities.BookEntity;
import com.jugameza.unBook.repositories.BookRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BookService {

    final private BookRepository bookRepository;

    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public Optional<BookEntity> getBookById(Integer id){
        return bookRepository.findById(id);
    }

    public List<BookEntity> getBooks(){ return bookRepository.findAll(); }

    public List<BookEntity> getBooksByGender(String gender){
        return bookRepository.findByGender(gender);
    }

}
