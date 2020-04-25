package com.codesquad.sidedish1.domain.repository;

import com.codesquad.sidedish1.domain.entity.Token;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TokenRepository extends CrudRepository<Token, Long> {
}
