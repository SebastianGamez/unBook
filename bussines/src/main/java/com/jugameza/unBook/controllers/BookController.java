package com.jugameza.unBook.controllers;

import com.jugameza.unBook.entities.BookEntity;
import com.jugameza.unBook.services.BookService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/books")
public class BookController {

    private final BookService bookService;

    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/{id}")
    Optional<BookEntity> getBookById(@PathVariable int id){
        return bookService.getBookById(id);
    }

    @GetMapping("/")
    List<BookEntity> getBooks(){
        return bookService.getBooks();
    }

    @GetMapping("/gender/{gender}")
    List<BookEntity> getBooksByGender(@PathVariable String gender){
        return bookService.getBooksByGender(gender);
    }

}
