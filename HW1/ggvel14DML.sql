-- DML for homework  1 by giorgi gvelesiani

-- 2
insert into country(id, name_co, iso) values
	(995,"საქართველო","GEO"),
    (49,"გერმანია","DEU"),
    (33,"საფრანგეთი","FRA"),
    (420,"ჩეხეთი","CZE"),
    (39,"იტალია","ITA");
    
insert into city(id,country,name_ci,phone) values
	(32, 995, "თბილისი", "+995 32"),
    (331 , 995, "ქუთაისი", "+995 331"),
    (222, 995, "ბათუმი", "+995 222"),
    (30, 49, "ბერლინი", "+49 30"),
    (89, 49, "მიუნხენი", "+49 89"),
    (420 , 420, "პრაღა", "+420"),
    (1, 33, "პარიზი", "+33 1"),
    (4, 33, "მარსელი", "+33 4"),
    (44, 33, "ლიონი", "+33 4"),
    (6, 39, "რომი", "+39 6"),
    (55, 39, "ფლორენცია", "+39 55"),
    (41, 39, "ვენეცია", "+39 41");
    
insert into hotel(city, name_ho, address, stars) values
    (32,"კოპალა", "ძველი თბილისი ჩეხოვის #8", 4),
	(32,"მეიდანი", "ძველი თბილისი გრიშაშვილის #19", 3),
	(32,"შერატონ მეტეხი პალასი", "თელავის ქუჩა #20", 5),
	(331,"გარდენ ჰაუსი", "თამარ მეფის ქუჩა #98", 3),
	(331,"მაგნოლია პარადისო", "დავით და კონსტანტინეს ქუჩა #13", 3),
	(331, "ედელვაისი", "ნინოშვილის ქუჩა #145", 3), 
	(222,"ორბი რეზიდენსი", "კობალაძის ქუჩა #2", 3),
	(222,"ალექსი", "მელიქიშვილის ქუჩა #102", 3),
	(222,"მწვანე კონცხი", "ბაღის ქუჩა #1", 2),
	(30, "Adlon Kempinski", "Unter den Linden #77", 4 ),
	(30, "Hilton", "Mohrenstrasse #30", 4 ),
	(89, "Sofitel Munich Bayerpost", "Bayerstrasse #12", 4 ),
	(89, "Vier Jahreszeiten Kempinski", "Maximilianstrasse #17", 5 ),
	(1, "Plaza Athenee", "25 Avenue Montaigne", 5 ),
	(1, "Georgette", "36 Rue du Grenier Saint-Lazare", 3 ),
	(1, "Maison Souquet", "10 Rue de Bruxelles", 4 ),
	(4,"Villa Monticelli", "96 Rue du Commandant Rolland", 5 ),
	(4, "Dieu", "1 Place Daviel", 5 ),
	(44, "Lyon Bellecour", "20 Quai Dr Gailleton", 4 ),
	(44, "Cour des Loges", "6 Rue du Boeuf", 4 ),
	(420, "Four Seasons", "Veleslavinova 1098/2a", 5 ),
	(420, "Corinthia", "Kongresova 1655/1", 4 ),
	(420, "Maximilian", "Hastalska 752/14", 5 ),
	(6, "The Fifteen Keys", "Via Urbana 6/7", 3 ),
	(6, "Artemide", "Via Nazionale 22", 5 ),
	(41, "Locanda Vivaldi", "Riva degli Schiavoni 4152/4153", 4 ),
	(41, "Metropole", "Riva degli Schiavoni 4149", 5 ),
	(41,"Palazzina Grassi", "Ramo Grassi 3247", 4 ),
	(55, "Villa Cora", "Viale Machiavelli 18", 5 ),
	(55, "Santa Maria Novella", "Piazza di Santa Maria Novella 1", 4 );

-- 3
insert into clients(idnum,name_cl,lastName,gender,birthDate,phone,email) values
	("00000000001","შოთა", "ღვინეფაძე","M", str_to_date('15.02.1979','%d.%m.%Y'),"538112233","s.gvinepadze@freeuni.edu.ge"),
    ("00000000002","გიორგი", "ბოჭორიშვილი","M", str_to_date('15.02.1989','%d.%m.%Y'),"538638300","g.bochorishvili@freeuni.edu.ge"),
    ("00000000003", "ზაზა", "გამეზარდაშვილი","M", str_to_date('15.02.1969','%d.%m.%Y'),"538772291", "z.gamezardashvili@freeuni.edu.ge"),
    ("00000000004", "ოთარ","მელია","M",str_to_date('15.12.1974','%d.%m.%Y'),"538123456","o.melia@freeuni.edu.ge"),
    ("00000000005","ზაზა","გელაშვილი","M",str_to_date('15.02.1978','%d.%m.%Y'),"538562439","z.gelashvili@freeuni.edu.ge"),
    ("00000000006", "ნიტა", "გონგაძე","F", str_to_date('21.02.1997','%d.%m.%Y'),"538370327","ngong15@freeuni.edu.ge"),
    ("00000000007", "მიეილ", "მირაშვილი","M", str_to_date('15.02.1990','%d.%m.%Y'), "538459876","m.mirashvili@freeuni.edu.ge"),
    ("00000000008", "გიორგი", "ბიჩინაშვილი","M", str_to_date('15.02.1991','%d.%m.%Y'), "538562435","g.bichinashvili@freeuni.edu.ge"),
    ("00000000009", "იორამ", "გორდაძე","M", str_to_date('15.02.1988','%d.%m.%Y'), "538243985", "i.gordadze@freeuni.edu.ge"),
    ("00000000010", "ზაზა","ოსმანოვი","M",str_to_date('15.02.1959','%d.%m.%Y'), "538629573", "z.osmanov@freeuni.edu.ge");

select * from clients;
-- 4    
insert into booking(hotel, guest, startDate, endDate) values
	(3, 1, str_to_date('01.01.2016','%d.%m.%Y'), str_to_date('21.01.2016','%d.%m.%Y')),
    (1, 2, str_to_date('14.02.2016','%d.%m.%Y'), str_to_date('17.02.2016','%d.%m.%Y')),
    (17, 3, str_to_date('21.02.2016','%d.%m.%Y'), str_to_date('18.02.2016','%d.%m.%Y')),
    (11, 4, str_to_date('22.02.2016','%d.%m.%Y'), str_to_date('19.02.2016','%d.%m.%Y')),
    (11, 5, str_to_date('03.03.2016','%d.%m.%Y'), str_to_date('16.03.2016','%d.%m.%Y')),
    (28, 6, str_to_date('10.03.2016','%d.%m.%Y'), str_to_date('17.03.2016','%d.%m.%Y')),
    (5, 7, str_to_date('27.03.2016','%d.%m.%Y'), str_to_date('18.03.2016','%d.%m.%Y')),
    (17, 8, str_to_date('07.04.2016','%d.%m.%Y'), str_to_date('19.04.2016','%d.%m.%Y')),
    (17, 9, str_to_date('18.04.2016','%d.%m.%Y'), str_to_date('16.05.2016','%d.%m.%Y')),
    (13, 10, str_to_date('19.04.2016','%d.%m.%Y'), str_to_date('17.05.2016','%d.%m.%Y')),
    (15, 10, str_to_date('20.05.2016','%d.%m.%Y'), str_to_date('23.05.2016','%d.%m.%Y')),
    (9, 2, str_to_date('05.06.2016','%d.%m.%Y'), str_to_date('19.06.2016','%d.%m.%Y')),
    (27, 9, str_to_date('16.07.2016','%d.%m.%Y'), str_to_date('16.08.2016','%d.%m.%Y')),
    (16, 9, str_to_date('04.08.2016','%d.%m.%Y'), str_to_date('17.08.2016','%d.%m.%Y')),
    (20, 1, str_to_date('10.08.2016','%d.%m.%Y'), str_to_date('18.08.2016','%d.%m.%Y')),
    (20, 7, str_to_date('20.08.2016','%d.%m.%Y'), str_to_date('21.08.2016','%d.%m.%Y')),
    (5, 7, str_to_date('15.10.2016','%d.%m.%Y'), str_to_date('16.10.2016','%d.%m.%Y')),
    (11, 8, str_to_date('01.11.2016','%d.%m.%Y'), str_to_date('17.11.2016','%d.%m.%Y')),
    (7, 9, str_to_date('01.11.2016','%d.%m.%Y'), str_to_date('18.11.2016','%d.%m.%Y')),
    (9, 4, str_to_date('15.12.2016','%d.%m.%Y'), str_to_date('19.12.2016','%d.%m.%Y'));

-- 5    
select co.name_co, co.iso, ci.name_ci, ci.phone, ho.name_ho, ho.address from country co,city ci, hotel ho
	where  ho.city=ci.id and ci.country=co.id order by co.name_co asc; 

-- 6    
select co.name_co, co.iso, ci.name_ci, ci.phone, ho.name_ho, ho.address, count(*) as num_of_visits from 
	country co,city ci, hotel ho, booking bo where bo.hotel=ho.id and ho.city=ci.id and ci.country=co.id 
		group by bo.hotel order by co.name_co asc; 
 
-- 7 
select co.name_co, ci.name_ci, ho.name_ho, count(bo.hotel) as num_of_visits from country co,city ci, hotel ho, 
	booking bo where bo.hotel=ho.id and ho.city=ci.id and ci.country=co.id group by bo.hotel having 
    count(bo.hotel)=(select max(bla) from (select count(hotel) as bla from booking group by hotel) s);

-- 8
select c.idnum, c.name_cl, c.lastName, c.birthDate, count(b.guest) as num_of_visits from booking b, clients c where 
	b.guest=c.id group by b.guest having count(b.guest)=(select max(bla) from (select count(guest) as bla from
    booking group by guest) s);
