SELECT player_name ������, POSITION ��ġ, HEIGHT Ű, WEIGHT ������
FROM player;

SELECT player_name "���� ��", POSITION ��ġ, HEIGHT Ű, WEIGHT ������
FROM player;

SELECT player_name ������, HEIGHT - WEIGHT AS "Ű-������"
FROM player;

SELECT player_name ������, ROUND (WEIGHT / ((HEIGHT / 100) * (HEIGHT / 100)), 2) BMI������
FROM PLAYER;

SELECT player_name || '����,' || HEIGHT || ' cm, ' || WEIGHT || ' kg' ü������
FROM PLAYER;