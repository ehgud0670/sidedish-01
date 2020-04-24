package com.codesquad.sidedish1.domain.repository;

import com.codesquad.sidedish1.domain.entity.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
}
