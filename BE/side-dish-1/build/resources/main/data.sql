insert into category(id, categoryName) values (1, 'main');
insert into category(id, categoryName) values (2, 'soup');
insert into category(id, categoryName) values (3, 'side');

insert into BANCHAN(id, name, price, category_id) values (1, 'tomato pasta', '2000WON', 1);
insert into BANCHAN(id, name, price, category_id) values (2, 'cream pasta', '2000WON', 2);
insert into BANCHAN(id, name, price, category_id) values (3, 'oil pasta', '2000WON', 3);
insert into BANCHAN(id, name, price, category_id) values (4, 'tomato pasta2', '2000WON', 1);
insert into BANCHAN(id, name, price, category_id) values (5, 'cream pasta2', '2000WON', 2);
insert into BANCHAN(id, name, price, category_id) values (6, 'oil pasta2', '2000WON', 3);


insert into IMAGE(id, url, banchan) values (1, 'image1', 1);
insert into IMAGE(id, url, banchan) values (2, 'image2', 2);
insert into IMAGE(id, url, banchan) values (3, 'image3', 3)
