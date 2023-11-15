-- WHERE 특정한 조건을 넣을 때

-- User.objects.filter(age=41)
SELECT * FROM movies_user
WHERE age=41;

-- Movie.objects.filter(year__gt=2000)
-- > django LOOKUP 함수
SELECT * FROM movies_movie
WHERE year > 2000;

-- Movie.objects.filter(year__gt=2000, year__lt=2010)
SELECT * FROM movies_movie
WHERE year > 2000 AND year < 2010;

-- Movie.objects.filter (Q(year__lt=2000)|Q(year__gt=2000))
SELECT * FROM movies_movie
WHERE year < 2000 OR year > 2010;

-- User.objects.exclude(age__gt=30)
SELECT * FROM movies_user
WHERE NOT age > 30;


-- Movie.objects.aggregate(Min('year'))
SELECT MIN(year) FROM movies_movie;
-- Movie.objects.aggregate(Max('year'))
SELECT MAX(year) FROM movies_movie;

-- Score.objects.filter(movie_id=1).aggregate(Min('value'),Max('value'))
SELECT MAX(value), MIN(value) FROM movies_score
WHERE movie_id=1;

-- Movie.objects.count() (모든 조건)
SELECT COUNT(*) FROM movies_movie;

-- Movie.objects.filter(year__gt=2000).count()
SELECT COUNT(*) FROM movies_movie
WHERE year > 2000;

-- User.objects.values('country').distinct().count() (중복값제거)
SELECT COUNT(DISTINCT country) FROM movies_user;


-- Sum
-- User.objects.aggregate(Sum('age'))
SELECT SUM(age) FROM movies_user;

-- 10번 영화에 달린 평점의 합 구하기
-- Score.objects.filter(movie_id=10).aggregate(Sum('value'))
SELECT SUM(value) FROM movies_score
WHERE movie_id=10;

-- AVG
-- 영화들의 평균 개봉연도
-- Movie.objects.aggregate(Avg('year'))
SELECT AVG(year) FROM movies_movie;

-- 10번 영화의 평균평점
-- Score.objects.filter(movie_id=10).aggregate(Avg('value'))
SELECT AVG(year) FROM movies_score
WHERE movie_id=10;


-- LIKE (문자열 일치/포함 정보) 
--      %: 문자열이 없거나 한개, 여러개 가지는 경우 (*)

-- Movie.objects.filter(title__contains='the') #__contains 포함하다
SELECT * FROM movies_movie
WHERE title LIKE '%the%';


-- -- Movie.objects.filter(title__startswith='the') #__startswith 시작하다
SELECT * FROM movies_movie
WHERE title LIKE 'the%';


-- Movie.objects.filter(title__endswith='on.') # __endswith 끝나는
SELECT * FROM movies_movie
WHERE title LIKE '%on.';

-- g로 시작하고 d로 끝나는 단어(빈 문자열도 탐지)
-- # 현재 django에서 사용하는 ORM 문법에서는 정규표현식을 사용해야된다.
SELECT * FROM movies_movie
WHERE title LIKE '%g__d%';

-- 포함이 되어있는 정보 출력
Movie.objects.filter(year__in=[2000,2001,2002])
SELECT * FROM movies_movie
WHERE year IN (2000,2001,2002);

-- User.objects.filter(age__range=[20,29])
SELECT age FROM movies_user
WHERE age BETWEEN 20 AND 29;
