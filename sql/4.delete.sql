-- # 데이터 삭제하기
-- actor = Actor.objects.get(id=2) #원하는 데이터 찾고
-- actor.delete() # 삭제하기
DELETE FROM movies_actor
WHERE id=1;

SELECT * FROM movies_actor;

