SELECT eid, fname, lname
FROM Editor;

SELECT DISTINCT c.name
FROM Customer AS c, Orders AS o, Order_book AS ob, Book AS b
WHERE c.cid = o.cid AND o.oid = ob.oid AND ob.isbn = b.isbn AND btype = 'Novel'
ORDER BY name DESC;

SELECT DISTINCT p.name, p.address
FROM Publisher AS p, Book AS b
WHERE p.pid = b.pid AND b.btype = 'Textbook';

SELECT DISTINCT a.aid, a.fname, a.lname, COUNT(*)
FROM Author AS a, Written_by AS w, Book AS b
WHERE a.aid = w.aid AND w.isbn = b.isbn AND b.btype = 'Novel'
GROUP BY a.aid
HAVING COUNT(*) > 2;

SELECT a.fname, a.lname
FROM  Author AS a, Written_by AS w, Book AS b
WHERE a.aid = w.aid AND w.isbn = b.isbn AND b.title = 'Fundamentals of Database Systems'; 

SELECT b.title, b.btype, b.isbn
FROM  Author AS a, Written_by AS w, Book AS b
WHERE a.aid = w.aid AND w.isbn = b.isbn AND a.fname = 'Jeff' AND a.lname = 'Smith';

SELECT DISTINCT p.pid, p.name, p.phone
FROM Publisher AS p, Book as b
WHERE p.pid = b.pid AND b.btype = 'Novel'
GROUP BY p.pid
HAVING COUNT(*) > 2;

SELECT MAX(price)
FROM  Author AS a, Written_by AS w, Book AS b
WHERE a.aid = w.aid AND w.isbn = b.isbn AND a.fname = 'Jeff' AND a.lname = 'Smith';

SELECT DISTINCT e.eid, COUNT(*)
FROM Editor AS e, Edited_by AS eb, Book AS b
WHERE e.eid = eb.eid AND eb.isbn = b.isbn
GROUP BY e.eid
HAVING COUNT(*) > 2;


SELECT o.oid, o.order_date
FROM Customer AS c, Orders AS o
WHERE c.cid = o.cid AND c.name = 'Alice Kay'
ORDER BY o.oid DESC;

SELECT DISTINCT b.isbn, b.title, b.price
FROM Customer AS c, Orders AS o, Order_book AS ob, Book AS b
WHERE c.cid = o.cid AND o.oid = ob.oid AND ob.isbn = b.isbn AND c.name = 'Alice Kay'
ORDER BY b.title ASC;

SELECT o.oid, o.order_date
FROM Orders AS o, Order_book AS ob, Book AS b
WHERE o.oid = ob.oid AND ob.isbn = b.isbn AND b.title = 'Fundamentals of Database Systems';


SELECT COUNT(*)
FROM Orders AS o
WHERE o.order_date < '2019-08-11';

SELECT c.cid, c.name, COUNT(*)
FROM  Customer AS c, Orders AS o
WHERE c.cid = o.cid
GROUP BY c.cid
HAVING COUNT(*) > 2;

SELECT b1.title, b1.price
FROM Book AS b1
JOIN (SELECT MAX(price) AS mprice FROM Book) AS b2
ON mprice = b1.price;



