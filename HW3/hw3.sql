-- 1
SELECT
    Name, AvgRating, ReleaseDate
FROM
    movie
WHERE
    YEAR(ReleaseDate) >= YEAR(CURRENT_DATE()) - 10
ORDER BY ReleaseDate , AvgRating
LIMIT 20;

-- 2
-- new table allows us to save pairs of directors and movies
CREATE TABLE directors (
    directorID INT,
    movieID INT,
    CONSTRAINT dir_dir_fk FOREIGN KEY (directorID)
        REFERENCES person (PersonId),
    CONSTRAINT dir_mov_fk FOREIGN KEY (movieID)
        REFERENCES movie (MovieId)
);

-- 3
SELECT
    p.name,
    TIMESTAMPDIFF(YEAR,
        p.DateOfBirth,
        CURRENT_TIMESTAMP()) AS age
FROM
    person p,
    movieactor ma,
    movie m
WHERE
    p.personid = ma.actorid
        AND p.isActor = 1
        AND m.movieid = ma.movieid
        AND TIMESTAMPDIFF(YEAR,
        p.DateOfBirth,
        CURRENT_TIMESTAMP()) BETWEEN 20 AND 30
        AND ma.hasminorrole = 1
        AND p.gender = 1;

-- 4
-- attached file 4.csv

-- 5
-- attached file 5.csv

-- 6
-- attached file 6.csv

-- 7
delimiter //
create trigger avg_rating after insert on userreview
for each row
begin
	update movie set AvgRating=(select avg(rating) from userreview where movieID=new.movieID) where movieID=new.movieID;
end
//
delimiter ;
