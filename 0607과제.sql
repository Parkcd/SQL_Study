SELECT player_name 선수명, POSITION 위치, HEIGHT 키, WEIGHT 몸무게
FROM player;

SELECT player_name "선수 명", POSITION 위치, HEIGHT 키, WEIGHT 몸무게
FROM player;

SELECT player_name 선수명, HEIGHT - WEIGHT AS "키-몸무게"
FROM player;

SELECT player_name 선수명, ROUND (WEIGHT / ((HEIGHT / 100) * (HEIGHT / 100)), 2) BMI비만지수
FROM PLAYER;

SELECT player_name || '선수,' || HEIGHT || ' cm, ' || WEIGHT || ' kg' 체격정보
FROM PLAYER;