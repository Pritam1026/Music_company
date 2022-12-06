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




/*Q(3)*/










