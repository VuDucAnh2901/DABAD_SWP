package duclm.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import duclm.domain.Field;
import duclm.domain.User;

@Repository
public interface FieldRepository extends JpaRepository<Field, Long> {
	Field findByName(String name);
	Page<Field> findByNameContaining(String name, Pageable pageable);
}
