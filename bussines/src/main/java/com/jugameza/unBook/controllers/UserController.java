package com.jugameza.unBook.controllers;

import com.jugameza.unBook.entities.UserEntity;
import com.jugameza.unBook.models.ResponseModel;
import com.jugameza.unBook.services.UserService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/user")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("")
    public ResponseModel addUser(@RequestBody UserEntity user){

        ResponseModel response;

        try {
            userService.addUser(user);
            response = new ResponseModel("User created", null);
        }catch(Exception e){
            response = new ResponseModel(null, "Error: " + e);
        }

        return response;

    }
    @PatchMapping("")
    public ResponseModel addFavorites(@RequestBody UserEntity user){

        ResponseModel response;

        try {
            userService.addFavorites(user);
            response = new ResponseModel("Favorites saved", null);
        }catch(Exception e){
            response = new ResponseModel(null, "Error: " + e);
        }

        return response;

    }

}
