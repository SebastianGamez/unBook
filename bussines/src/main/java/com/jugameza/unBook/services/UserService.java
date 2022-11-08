package com.jugameza.unBook.services;

import com.jugameza.unBook.entities.UserEntity;
import com.jugameza.unBook.repositories.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void addUser(UserEntity user){
        userRepository.save(user);
    }

    public void addFavorites(UserEntity user){

        UserEntity userToSave = userRepository.findById(user.getId()).get();

        userToSave.setFavorites(userToSave.getFavorites() + user.getFavorites());

        userRepository.save(userToSave);

    }

}
