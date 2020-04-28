package com.codesquad.sidedish1.presentation;

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
import java.util.Arrays;
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

    public Category getCategoryWithId(int categoryId) {
        String sql = "select * from category, banchan where category.category_id = banchan.category_id and category.category_id = ?";
        return jdbcTemplate.query(sql, new ResultSetExtractor<Category>() {
            @Override
            public Category extractData(ResultSet rs) throws SQLException, DataAccessException {
                Category category = findCategoryById(categoryId);
                List<Integer> banchanIds = findBanchanIdWithSameCategory(categoryId);
                for (int i : banchanIds) {
                    Banchan banchan = getBanchanWithEveryDetails(i);
                    category.addBanchan(banchan);
                }
                return category;
            }
        }, categoryId);
    }

    public Banchan getBanchanWithBadge(int banchanId) {
        String sql = "SELECT * FROM banchan, badge where banchan.banchan_id = badge.banchan_id and banchan.banchan_id = ?";
        return jdbcTemplate.query(sql, new ResultSetExtractor<Banchan>() {
            @Override
            public Banchan extractData(ResultSet rs) throws SQLException, DataAccessException {

                Banchan banchan = findBanchanById(banchanId);
                List<String> badges = Arrays.asList(getBadges(banchanId));
                for(String a : badges) {
                    System.out.println(a);
                    banchan.addBadge(a);
                }
                return banchan;
            }
        }, banchanId);
    }

    public Banchan getBanchanWithEveryDetails(int banchanId) {
            Banchan banchan = findBanchanById(banchanId);
            System.out.println(banchan);
            String[] deliveries = getDeliveryType(banchanId);
            for(String d : deliveries) {
                banchan.addDelivery(d);
            }
            String[] badges = getBadges(banchanId);
            for(String b : badges) {
            banchan.addBadge(b);
            }

            return banchan;
    }

    public BanchanDetail getBanchanDetailWithThumbImages(int banchanId) {
        String sql = "SELECT * FROM banchanDetail, ThumbImg where banchanDetail.banchanDetail_id = ThumbImg.banchanDetail_id and banchanDetail.banchanDetail_id = " + banchanId;
        return jdbcTemplate.query(sql, new ResultSetExtractor<BanchanDetail>() {
            @Override
            public BanchanDetail extractData(ResultSet rs) throws SQLException, DataAccessException {
                BanchanDetail banchanDetail = findBanchanDetailById(banchanId);
                List<String> thumbs = Arrays.asList(getThumbs(banchanId));
                for(String a : thumbs) {
                    System.out.println(a);
                    banchanDetail.addThumbImages(a);
                }
                return banchanDetail;
            }
        });
    }

    public BanchanDetail getBanchanDetailWithThumbImagesAndDetailImages(int banchanId) {
        String sql = "SELECT * FROM banchanDetail, DetailImg where banchanDetail.banchanDetail_id = DetailImg.banchanDetail_id and banchanDetail.banchanDetail_id = " + banchanId;
        return jdbcTemplate.query(sql, new ResultSetExtractor<BanchanDetail>() {
            @Override
            public BanchanDetail extractData(ResultSet rs) throws SQLException, DataAccessException {
                BanchanDetail banchanDetail = getBanchanDetailWithThumbImages(banchanId);
                String[] details = getDetailImages(banchanId);
                for(String a : details) {
                    banchanDetail.addDetailImages(a);
                }
                return banchanDetail;
            }
        });
    }


//    public List<Category> findAllCategoryWithBanchans() {
//        String sql = "select * from category, banchan where category.category_id = banchan.category_id order by category_id";
//        return jdbcTemplate.query(sql, new ResultSetExtractor<List<Category>>() {
//            @Override
//            public List<Category> extractData(ResultSet rs) throws SQLException, DataAccessException {
//                List<Category> categories = new ArrayList<>();
//                Long categoryId = null;
//                String categoryName = null;
//                Category currentCategory = null;
//                int categoryIndex = 0;
//                int banchanIndex = 0;
//                while (rs.next()) {
//                    if (currentCategory == null || !categoryId.equals(rs.getLong("id"))) {
//
//                        categoryId = rs.getLong("id");
//                        categoryName = rs.getString("categoryName");
//                        currentCategory = categoryRowMapper.mapRow(rs, categoryIndex);
//                        currentCategory.setCategory_name(categoryName);
//                        banchanIndex = 0;
//                        categories.add(currentCategory);
//                    }
//                    currentCategory.addBanchan(banchanRowMapper.mapRow(rs, banchanIndex++));
//                }
//                return categories;
//            }
//        });
//    }

    public Category findCategoryById(int categoryId) {
        String sql = "SELECT * FROM category WHERE category_id = ?";

        return jdbcTemplate.queryForObject(sql, new Object[] {categoryId}, BeanPropertyRowMapper.newInstance(Category.class));
    }

    public Banchan findBanchanById(int banchanId) {
        String sql = "SELECT * FROM banchan WHERE banchan_id = ?";

        return jdbcTemplate.queryForObject(sql, new Object[] {banchanId}, BeanPropertyRowMapper.newInstance(Banchan.class));
    }

    public BanchanDetail findBanchanDetailById(int banchanId) {
        String sql = "SELECT * FROM banchanDetail WHERE banchanDetail.banchan_id = ?";

        return jdbcTemplate.queryForObject(sql, new Object[] {banchanId}, BeanPropertyRowMapper.newInstance(BanchanDetail.class));
    }

    public List<String> findBadgeListByBanchanId(int banchanId) {
        String sql = "SELECT name FROM badge WHERE badge.banchan_id =" + banchanId;

        List<String> data = new ArrayList();
        data = jdbcTemplate.queryForList(sql,String.class);
        return data;
    }

    public List<Integer> findBanchanIdWithSameCategory(int categoryId) {
        String sql = "SELECT banchan_id FROM banchan WHERE banchan.category_id =" + categoryId;

        List<Integer> data = new ArrayList();
        data = jdbcTemplate.queryForList(sql,Integer.class);
        return data;
    }


    public String[] getThumbs(int banchanDetailId) {
        String sql = "SELECT url from ThumbImg where ThumbImg.banchanDetail_id =" + banchanDetailId;
        String data = jdbcTemplate.queryForObject(sql, String.class);
        String result[] = data.trim().split("\\s*,\\s*");
        return result;
    }

    public String[] getDetailImages(int banchanDetailId) {
        String sql = "SELECT url from DetailImg where DetailImg.banchanDetail_id =" + banchanDetailId;
        String data = jdbcTemplate.queryForObject(sql, String.class);
        String result[] = data.trim().split("\\s*,\\s*");
        return result;
    }

    public String[] getBadges(int banchanId) {
        String sql = "SELECT name from badge where badge.banchan_id =" + banchanId;
        String data = jdbcTemplate.queryForObject(sql, String.class);
        String result[] = data.trim().split("\\s*,\\s*");
        return result;
    }

    public String[] getDeliveryType(int banchanId) {
        String sql = "SELECT name from deliveryType where deliveryType.banchan_id =" + banchanId;
        String data = jdbcTemplate.queryForObject(sql, String.class);
        String result[] = data.trim().split("\\s*,\\s*");
        return result;
    }


}
