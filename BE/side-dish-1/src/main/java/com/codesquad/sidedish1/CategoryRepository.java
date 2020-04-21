package com.codesquad.sidedish1;

import com.codesquad.sidedish1.presentation.Banchan;
import com.codesquad.sidedish1.presentation.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class CategoryRepository {

    private JdbcTemplate jdbcTemplate;
    
    @Autowired
    public CategoryRepository(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public static RowMapper<Category> categoryRowMapper = BeanPropertyRowMapper.newInstance(Category.class);
    public static RowMapper<Banchan> banchanRowMapper = BeanPropertyRowMapper.newInstance(Banchan.class);

    public Category findCategoryWithBanchans(Long categoryId) {
        String sql =
                "select * from category, banchan where category.id = banchan.category_id and category.id = ?";
        return jdbcTemplate.query(sql, new ResultSetExtractor<Category>() {
            @Override
            public Category extractData(ResultSet rs) throws SQLException, DataAccessException {
                Category category = findCategoryById(categoryId);
                int row = 0;
                while (rs.next()) {
                    if (category == null) {
                        category = categoryRowMapper.mapRow(rs, row);
                    }
                    category.addBanchan(banchanRowMapper.mapRow(rs, row));
                    row++;
                }
                return category;
            }
        }, categoryId);
    }

    public List<Category> findAllCategoryWithBanchans() {
        String sql = "select * from category, banchan where category.id = banchan.category_id order by category.id";
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<Category>>() {
            @Override
            public List<Category> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Category> categories = new ArrayList<>();
                Long categoryId = null;
                String categoryName = null;
                Category currentCategory = null;
                int categoryIndex = 0;
                int banchanIndex = 0;
                while (rs.next()) {
                    if (currentCategory == null || !categoryId.equals(rs.getLong("id"))) {

                        categoryId = rs.getLong("id");
                        categoryName = rs.getString("categoryName");
                        currentCategory = categoryRowMapper.mapRow(rs, categoryIndex);
                        currentCategory.setName(categoryName);
                        banchanIndex = 0;
                        categories.add(currentCategory);
                    }
                    currentCategory.addBanchan(banchanRowMapper.mapRow(rs, banchanIndex++));
                }
                    return categories;
            }
        });
    }

    public Category findCategoryById(Long categoryId) {
        String sql = "SELECT * FROM CATEGORY WHERE id = ?";

        return jdbcTemplate.queryForObject(sql, new Object[] {categoryId}, BeanPropertyRowMapper.newInstance(Category.class));
    }

    }
