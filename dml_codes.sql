
-----------------------------------------------
--USERS TABLE--
-----------------------------------------------
INSERT INTO users(user_name,password,mobile_number,email,name,state)
VALUES
('Pritam1026','pritam@123',9765495616,'pritam123@gmail.com','Pritam','Bihar'),
('Rahul8865','coolboy@1234',9764946472,'rahulrider@gmail.com','Rahul','Karnatak'),
('Amit6545','delhi@8826',9554848485,'Amitprem@gmail.com','Amit','Madhyapradesh'),
('Juhipreet','juhibhopal@123',9816496465,'juhisahu1@gmail.com','Juhi','Madhyapradesh'),
('Ajaysingh_1','Ajaymedico@9896',9816454548,'ajayji@gmail.com','Ajay','Assam'),
('Ronakstarboy','Ronal_delhi@1',9884894654,'ronakranjan@gmail.com','Ronak','Delhi'),
('Ankita_dust','Ankitab@2257',8584641612,'ankitabhargav@gmail.com','Ankita','Jharkhand'),
('Renukaengg','Renukajain@584641',9789569515,'renuka983@gmail.com','Renuka','Uttarpradesh'),
('Saurabhlucifer','Saurabhju@1123',8814694697,'saurabhwork1@gmail.com','Saurabh','Gujarat'),
('Deepaktufan','tufandeep@111222',7898659522,'tufandeep112@gmail.com','Deepak','Delhi')
--10 user data is randomly generated.These data are fake and donot have real world significance.

-----------------------------------------------
--USER_CARD TABLE--
-----------------------------------------------
INSERT INTO user_card(card_number,user_name,exp_date,bank,card_type)
VALUES
(6494141498189415,'Pritam1026','27-11-2026','HDFC','credit'),
(5448848848484848,'Ajaysingh_1','18-09-2025','SBI','credit'),
(4989484894649494,'Ronakstarboy','14-04-2023','AXIS','debit'),
(4485034557940008,'Juhipreet','12-10-2023','SBI','debit'),
(5503679872654724,'Renukaengg','08-05-2027','ICICI','credit'),
(2393080627101694,'Ankita_dust','16-10-2026','HDFC','credit'),
(4800750281450286,'Saurabhlucifer','15-10-2024','PNB','credit'),
(8750061846745375,'Amit6545','17-09-2024','HDFC','debit'),
(4616972464506847,'Rahul8865','25-04-2028','CANARA','debit'),
(4297250127925978,'Deepaktufan','04-02-2026','SBI','debit'),
(3427608279354524,'Amit6545','18-12-2027','CANARA','credit'),
(9683445916287171,'Rahul8865','15-10-2024','HDFC','debit'),
(8909640738967205,'Pritam1026','10-10-2027','CBI','debit'),
(3844884677462567,'Rahul8865','18-08-2027','ICICI','credit'),
(3144728936385519,'Amit6545','14-10-2026','PNB','credit'),
(5443159167324219,'Juhipreet','17-12-2022','CANARA','debit'),
(5849395379583202,'Ajaysingh_1','15-11-2023','SBI','debit'),
(3985451269983155,'Ronakstarboy','18-11-2025','HDFC','debit'),
(8694327844522414,'Ankita_dust','17-12-2026','ICICI','credit')
--users data is randomly generated.
--These data are fake and donot have real world significance.
--The relation between user and user_card is one to many.
--A single user_name can have multiple cards.
-----------------------------------------------
--PAYMENTS TABLE--
-----------------------------------------------
INSERT INTO payments(amount,date_of_pay,card_number)
VALUES
(200,'02-01-2021',4989484894649494),
(500,'04-01-2021',8750061846745375),
(350,'13-01-2021',8909640738967205),
(700,'02-02-2021',5503679872654724),
(700,'15-02-2021',5448848848484848),
(200,'04-03-2021',5448848848484848),
(350,'06-04-2021',4616972464506847),
(500,'22-04-2021',9683445916287171),
(350,'08-05-2021',3427608279354524),
(700,'03-06-2021',8694327844522414),
(200,'28-06-2021',4616972464506847),
(500,'15-07-2021',2393080627101694),
(350,'01-08-2021',3985451269983155),
(200,'12-09-2021',8694327844522414),
(500,'22-10-2021',3844884677462567),
(700,'28-10-2021',5503679872654724),
(350,'17-11-2021',2393080627101694),
(200,'18-12-2021',6494141498189415),
(350,'19-12-2021',5448848848484848),
(700,'03-01-2022',4989484894649494),
(500,'12-01-2022',4485034557940008),
(350,'15-01-2022',5503679872654724),
(500,'18-01-2022',2393080627101694),
(200,'31-01-2022',4800750281450286),
(700,'03-02-2022',8750061846745375),
(350,'06-02-2022',4616972464506847),
(200,'17-02-2022',3985451269983155),
(700,'22-02-2022',8694327844522414),
(350,'03-03-2022',4297250127925978),
(500,'16-03-2022',3427608279354524),
(700,'25-03-2022',3144728936385519),
(500,'31-03-2022',8694327844522414),
(350,'04-04-2022',4616972464506847),
(700,'11-04-2022',2393080627101694),
(700,'16-04-2022',3985451269983155),
(350,'18-04-2022',8694327844522414),
(500,'19-04-2022',3844884677462567),
(200,'28-04-2022',5503679872654724),
(500,'01-05-2022',2393080627101694),
(200,'11-05-2022',6494141498189415),
(350,'12-05-2022',5448848848484848),
(700,'18-05-2022',4989484894649494),
(500,'26-05-2022',8909640738967205),
(200,'01-06-2022',5503679872654724),
(700,'15-02-2021',5448848848484848),
(200,'04-03-2021',5448848848484848),
(350,'06-04-2021',4616972464506847),
(500,'22-04-2021',9683445916287171),
(700,'03-01-2022',4989484894649494),
(500,'12-01-2022',4485034557940008),
(350,'15-01-2022',5503679872654724),
(500,'18-01-2022',2393080627101694),
(200,'31-01-2022',4800750281450286),
(700,'03-02-2022',8750061846745375),
(700,'15-02-2021',5448848848484848),
(350,'18-02-2022',5448848848484848),
(350,'22-02-2022',4616972464506847),
(500,'01-03-2022',9683445916287171),
(350,'06-03-2022',3427608279354524),
(700,'11-03-2022',8694327844522414),
(200,'16-03-2022',4616972464506847),
(500,'21-03-2022',2393080627101694),
(350,'26-03-2022',3985451269983155),
(200,'28-03-2022',8694327844522414),
(500,'02-04-2022',3844884677462567),
(500,'13-04-2022',3844884677462567),
(700,'16-04-2022',5503679872654724),
(350,'21-04-2022',2393080627101694),
(200,'26-04-2022',6494141498189415),
(350,'01-05-2022',5448848848484848),
(500,'12-05-2022',9683445916287171),
(350,'16-05-2022',3427608279354524),
(700,'18-05-2022',8694327844522414),
(200,'19-05-2022',4616972464506847),
(500,'22-05-2022',2393080627101694),
(350,'26-05-2022',5503679872654724),
(500,'30-05-2022',2393080627101694)
--payments data is randomly generated
--These data are fake and donot have real world significance.
--relation between user_card and payments is one to many. that means a payment which is successfully commited
--is done by a single card only.
-----------------------------------------------
--SONGS TABLE--
-----------------------------------------------
--songs data is fetched and modified from Kaggle
--To know about the modication methods please read readme.md
--url:"https://www.kaggle.com/datasets/makvel/hindi-film-music-kishor-kumar-1-to-300-songs"
--This dataset contains the songs of legendry singer Kishor kumar
--import method of PGADMIN is used to import the data into database.
-----------------------------------------------
--SINGER TABLE--
-----------------------------------------------
--Singer data is fetched and modified from Kaggle
--To know about the modication methods please read readme.md
--url:"https://www.kaggle.com/datasets/makvel/hindi-film-music-kishor-kumar-1-to-300-songs"
--import method of PGADMIN is used to import the data into database.
-----------------------------------------------
--SONG_SINGER TABLE--
-----------------------------------------------
--Songs_singer data is fetched and modified from Kaggle
--To know about the modication methods please read readme.md
--url:"https://www.kaggle.com/datasets/makvel/hindi-film-music-kishor-kumar-1-to-300-songs"
--import method of PGADMIN is used to import the data into database.
--The relation between songs and singer tables is many to many relation.
-----------------------------------------------
--MUSIC_DIRECTOR_TABLE--
-----------------------------------------------
--Songs_singer data is fetched and modified from Kaggle
--To know about the modication methods please read readme.md
--url:"https://www.kaggle.com/datasets/makvel/hindi-film-music-kishor-kumar-1-to-300-songs"
--import method of PGADMIN is used to import the data into database.
-----------------------------------------------
--MUSIC_DIRECTOR_SONGS TABLE--
-----------------------------------------------
--Songs_singer data is fetched and modified from Kaggle
--To know about the modication methods please read readme.md
--url:"https://www.kaggle.com/datasets/makvel/hindi-film-music-kishor-kumar-1-to-300-songs"
--import method of PGADMIN is used to import the data into database.
--The relation between music director and songs tables is many to many relation.
-----------------------------------------------
--PLAYLIST TABLE--
-----------------------------------------------
--playlist data is randomly generated using excel
--These data are fake and donot have real world significance.
-----------------------------------------------
--PLAYLIST_SONGS TABLE--
-----------------------------------------------
--The relation between playlist and songs is many to many
--The data is generated using excel and import using impport method of PGADMIN
-----------------------------------------------
--USER_PLAYLISTS TABLE--
-----------------------------------------------
--The relation between user and playlist is one to many.
--The data is generated using excel and import using impport method of PGADMIN









