/*
-- Query: select yo_survey.id,user_id,yo_survey.type,yo_survey.question,yo_survey.answer,yo_survey.point, 	
    case 
			when muniyo_prod.yo_survey.category_id = 1 then 'Bisnis'
			when muniyo_prod.yo_survey.category_id = 2 then 'Film'
			when muniyo_prod.yo_survey.category_id = 3 then 'Gaya Hidup'
			when muniyo_prod.yo_survey.category_id = 4 then 'Musik'
			when muniyo_prod.yo_survey.category_id = 5 then 'Makanan & Minuman'
			when muniyo_prod.yo_survey.category_id = 6 then 'Teknologi'
			when muniyo_prod.yo_survey.category_id = 7 then 'Seni'
			when muniyo_prod.yo_survey.category_id = 8 then 'Politik'
			when muniyo_prod.yo_survey.category_id = 9 then 'Otomotif'
			when muniyo_prod.yo_survey.category_id = 10 then 'Olahraga'
			when muniyo_prod.yo_survey.category_id = 11 then 'Kecantikan & Kosmetik'
			when muniyo_prod.yo_survey.category_id = 12 then 'Wisata'
			when muniyo_prod.yo_survey.category_id = 13 then 'Kesehatan'
			when muniyo_prod.yo_survey.category_id = 14 then 'Selebriti'
			when muniyo_prod.yo_survey.category_id = 15 then 'lain-lain edit'
			when muniyo_prod.yo_survey.category_id = 16 then 'test'
			when muniyo_prod.yo_survey.category_id = 17 then 'Pendidikan'
			when muniyo_prod.yo_survey.category_id = 18 then 'Suasana Hati'
			when muniyo_prod.yo_survey.category_id = 19 then 'Permainan'
		else 'Transportasi'
		end as category_name
    from yo_survey
-- Date: 2023-02-26 18:07
*/
INSERT INTO `` (`id`,`user_id`,`qtype`,`question`,`answer`,`point`,`category_name`) VALUES (40326,0,1,'Sobat, mana nih boy band Korea favorit kalian?','a:2:{s:11:\"answer_type\";i:0;s:6:\"answer\";a:5:{i:0;s:3:\"EXO\";i:1;s:3:\"NCT\";i:2;s:3:\"BTS\";i:3;s:9:\"Seventeen\";i:4;s:7:\"Lainnya\";}}',20,'Transportasi');
INSERT INTO `` (`id`,`user_id`,`qtype`,`question`,`answer`,`point`,`category_name`) VALUES (40327,0,1,'Sobat Mumun yang suka sarapan, merapat! Makanan mana yang jadi favorit kalian untuk sarapan?','a:2:{s:11:\"answer_type\";i:0;s:6:\"answer\";a:6:{i:0;s:6:\"Cereal\";i:1;s:5:\"Bubur\";i:2;s:9:\"Nasi uduk\";i:3;s:13:\"Lontong sayur\";i:4;s:4:\"Roti\";i:5;s:7:\"Lainnya\";}}',20,'Transportasi');
INSERT INTO `` (`id`,`user_id`,`qtype`,`question`,`answer`,`point`,`category_name`) VALUES (40328,0,1,'Sobat, air mineral mana nih yang jadi favorit kalian?','a:2:{s:11:\"answer_type\";i:0;s:6:\"answer\";a:5:{i:0;s:6:\"Nestle\";i:1;s:3:\"Vit\";i:2;s:4:\"AQUA\";i:3;s:11:\"Le Minerale\";i:4;s:7:\"Lainnya\";}}',20,'Transportasi');
INSERT INTO `` (`id`,`user_id`,`qtype`,`question`,`answer`,`point`,`category_name`) VALUES (40329,102052,1,'Sobat,pesanan makanan online apa yang sering sobat pesan','a:2:{s:11:\"answer_type\";i:0;s:6:\"answer\";a:4:{i:0;s:11:\"A .martabak\";i:1;s:8:\"B .bakso\";i:2;s:18:\"C .soto ayam/babat\";i:3;s:11:\"D .mie ayam\";}}',0,'Makanan & Minuman');
INSERT INTO `` (`id`,`user_id`,`qtype`,`question`,`answer`,`point`,`category_name`) VALUES (40330,98938,3,'Berwisata ke gunung atau ke pantai, sob?','a:2:{i:0;s:45:\"c2f3834b_6a3034db559727f31ac8827c40ea7d01.jpg\";i:1;s:45:\"c2f3834b_f97d7cca950c6572ad3c2c49e130803a.jpg\";}',0,'Wisata');
INSERT INTO `` (`id`,`user_id`,`qtype`,`question`,`answer`,`point`,`category_name`) VALUES (40331,21135,3,'Suka yang mana nih, sobat muniyo ','a:2:{i:0;s:45:\"ff5091d0_6d7f7ca225310b27108e57de0d1ecdc9.png\";i:1;s:45:\"ff5091d0_f083f826ecd32db97937d580b09bc28f.png\";}',0,'Makanan & Minuman');
INSERT INTO `` (`id`,`user_id`,`qtype`,`question`,`answer`,`point`,`category_name`) VALUES (40332,35926,1,'https://sck.io/TwdWosY2','a:2:{s:11:\"answer_type\";i:0;s:6:\"answer\";a:2:{i:0;s:5:\"Pasti\";i:1;s:5:\"Legit\";}}',0,'Suasana Hati');
