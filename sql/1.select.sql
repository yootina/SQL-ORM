-- Movie.objects.all()
SELECT * FROM movies_movie;

-- User.objects.all()
SELECT * FROM movies_user;

-- Movie.objects.all().order_by('-year')
SELECT * FROM movies_movie
ORDER BY year DESC;
-- 기본적으로 오름차순이니 내림차순은 DESC; 입력

