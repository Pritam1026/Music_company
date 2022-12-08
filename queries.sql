-----------------------
--QUERIES--
-----------------------
/*Q(1)COMPANY WANTS TO GIVE SPECIAL DISCOUNTS TO TOP 3 CUSTOMERS WITH HEIGHEST PAYMENT,FETCH THE NAME,NUMBER AND EMAIL OF
     SUCH CUSTOMERS.*/
--SOLUTION
SELECT t2.name,t2.mobile_number,t2.email,SUM(t3.amount) amount
FROM user_card t1
INNER JOIN payments t3
ON t1.card_number=t3.card_number
INNER JOIN users t2
ON t1.user_name=t2.user_name
--users and user_card is connected with user_name and payments and user_card is is connected with card_number
GROUP BY t2.name,t2.mobile_number,t2.email
ORDER BY amount DESC
LIMIT 3
--Hence top 3 user which are eligible for the gift are Ankita,Rahul and Amit.
--users and user_card is connected with user_name and payments and user_card is is connected with card_number



/*Q(2)COMPANY WANTS TO KNOW THE BANK SHARE AND THE TYPE OF CARD IN PAYMENTS,RETURN THE QUERY IN PERCENTAGE OF TOTAL
ROUNDED UPTO TWO DECIMAL PLACE.*/
--SOLUTION
SELECT t1.bank,t1.card_type,ROUND(sum(t2.amount)::NUMERIC*100/(SELECT sum(t2.amount) amount
FROM user_card t1
INNER JOIN payments t2
ON t1.card_number=t2.card_number
),2) percentage
--The inner bracket with select statement uses subquery.
FROM user_card t1
INNER JOIN payments t2
ON t1.card_number=t2.card_number
GROUP BY t1.bank,t1.card_type
ORDER BY percentage DESC
--This query uses subquery.
--This can be done with help of CTE which could be musch more readable
WITH total_amt AS(SELECT sum(t2.amount) amount
FROM user_card t1
INNER JOIN payments t2
ON t1.card_number=t2.card_number)

SELECT t1.bank,t1.card_type,ROUND(sum(t2.amount)::NUMERIC*100/(SELECT amount FROM total_amt),2) percentage
FROM user_card t1
INNER JOIN payments t2
ON t1.card_number=t2.card_number
--user_card and payments have card_number feature common which is used to link the two tables together.
GROUP BY t1.bank,t1.card_type
ORDER BY percentage DESC
--Here we can conclude that most of the user uses the ICICI credit card followed by HDFC debit card
--We can target those card holders which have CBI debit or PNB credit card as they have less percentage.



/*Q(3)REPORT THE TOTAL AMOUNT OF PAYMNET,BANKS AND TYPE OF CARD.*/
--SOLUTION
SELECT t3.name,SUM(t2.amount) amount ,t1.bank,t1.card_type
FROM user_card t1
INNER JOIN payments t2
ON t1.card_number=t2.card_number
INNER JOIN users t3
ON t1.user_name=t3.user_name
GROUP BY t1.bank,t1.card_type,t3.name
ORDER BY t3.name

/*Q(4)REPROT THE TOTAL SPEND BY EACH USER IN YEAR 2021 AND 2022.*/
--SOLUTION
SELECT t3.name,
SUM(CASE 
	WHEN EXTRACT(YEAR FROM t2.date_of_pay)=2021 THEN t2.amount 
END) year_2021,
SUM(CASE 
	WHEN EXTRACT(YEAR FROM t2.date_of_pay)=2022 THEN t2.amount
END) year_2022
--Case statement is used to separate the payments based on dates.
FROM user_card t1
INNER JOIN payments t2
ON t1.card_number=t2.card_number
INNER JOIN users t3
ON t1.user_name=t3.user_name
--users and user_card is connected with user_name and payments and user_card is is connected with card_number
GROUP BY t3.name
ORDER BY t3.name
--Now we can analyze which is our top customer in which year using modification in orderby statement



/*Q(5) COMPANY WANTS TO ANALYZE ITS USERS BASED ON THE MATRIC music_time_per_rupee IT IS DEFINED AS 
MINUTES OF TOTAL MUSIC PLAYED/TOTAL PAY  OF THE USER WHICH REFLECTS TOWARD THE COST PER TIME SPEND BY USED ON THE APP*/
--SOLUTION
WITH total_length AS(SELECT t1.user_name,t1.name,SUM(t2.length) total_len
FROM users t1
INNER JOIN users_songs_played t3
ON t1.user_name=t3.user_name
INNER JOIN songs t2
ON t3.song_id=t2.song_id
GROUP BY t1.user_name,t1.name),
--This common table expression calculates the total length of songs played in minute aggregated on user
total_amount AS(SELECT t3.name,t3.user_name,SUM(t2.amount) amount
FROM user_card t1
INNER JOIN payments t2
ON t1.card_number=t2.card_number
INNER JOIN users t3
ON t1.user_name=t3.user_name
GROUP BY t3.user_name,t3.name
ORDER BY t3.name)
--This common table expression calculates the total amount spend in inr. aggregated on user
SELECT total_length.name,ROUND((total_amount.amount/total_length.total_len)::NUMERIC,2) music_time_per_rupee
FROM total_length
INNER JOIN total_amount
ON total_length.user_name=total_amount.user_name
ORDER BY music_time_per_rupee


/*Q(6)FIND OUR ALL THE USERS AND THEIR MOBILE NUMBERS BELONGS TO BIHAR AND MADHYAPRADESH*/
--SOLUTION
SELECT name,state,mobile_number
FROM users
WHERE STATE IN ('Bihar','Madhyapradesh')


/*Q(7)COUNT THE NUMBER OF SONGS,AVERAGE LENGTH ,MINIMUM LENGTH AND MAXIMUM LENGTH OF EACH PLAYLIST*/
--SOLUTION
SELECT t1.playlist_id,COUNT(t2.length) count_of_songs,AVG(t2.length) avg_length,MAX(t2.length) max_length
--aggregate functions are used.
FROM playlist_songs t1
INNER JOIN songs t2
ON t1.song_id=t2.song_id
GROUP BY t1.playlist_id
--songs and playlist_songs are connected by the column song_id.

/*Q(8) OUTPUT THE CUMULATIVE COUNT OF SONGS PLAYED BY EACH USER IN YEAR 2021*/
--SOLUTION
SELECT t1.user_name,t1.name,t2.song_id,COUNT(t2.song_id) number_of_time_played
FROM users t1
INNER JOIN users_songs_played t2
 ON t1.user_name=t2.user_name
WHERE EXTRACT(YEAR FROM t2.date_of_play)='2021'
GROUP BY t1.user_name,t1.name,t2.song_id



/*Q(9) FIND THE AMOUNTS PAID BY EACH USER AGAINST THE MAIXIUM AMOUNT PAID BY THE USER
FIND THE OFFSET BWEEN EACH PAYMENT AND THE MAXIMUM PAYMENT.*/
--SOLUTION

SELECT t1.user_name,t2.amount,
MAX(t2.amount) OVER(PARTITION BY t1.user_name),MAX(t2.amount) OVER(PARTITION BY t1.user_name)-t2.amount offset_amt
--WINDOW FUNCTION IS USED TO FIND OUT THE MAXIMUM OF THE AMOUNT SPEND BY THE USER.
FROM user_card t1
INNER JOIN payments t2
ON t1.card_number=t2.card_number
INNER JOIN users t3
ON t1.user_name=t3.user_name
ORDER BY t1.user_name
--users and user_card is connected with user_name and payments and user_card is is connected with card_number


/*Q(10)FIND THE RANK OF THE MUSIC DIRECTORS BASED ON THE MAXIMUM NUMBER OF SONGS PLAYED*/
--SOLUTION
SELECT t1.name,
DENSE_RANK() OVER (ORDER BY count(t3.song_id) DESC)
FROM music_director t1
INNER JOIN music_director_songs t2
ON t1.director_id=t2.director_id
INNER JOIN users_songs_played t3
ON t2.song_id=t3.song_id
GROUP BY t1.name



