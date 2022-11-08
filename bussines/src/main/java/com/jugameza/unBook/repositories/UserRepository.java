package com.jugameza.unBook.repositories;

import com.jugameza.unBook.entities.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserEntity, String> {
}
