SELECT B.TEAM_NAME ����, A.PLAYER_NAME ������, A.BACK_NO ��ѹ�
FROM (SELECT TEAM_ID, PLAYER_NAME, BACK_NO
FROM PLAYER
WHERE POSITION = 'MF') A
, TEAM B
WHERE B.TEAM_ID = A.TEAM_ID
ORDER BY ������;

SELECT PLAYER_NAME ������, POSITION ������
      ,BACK_NO ��ѹ�, HEIGHT Ű
FROM (SELECT PLAYER_NAME, POSITION, BACK_NO, HEIGHT
FROM PLAYER
WHERE HEIGHT IS NOT NULL
ORDER BY HEIGHT DESC)
WHERE ROWNUM <=5;

SELECT A.TEAM_ID ���ڵ�, B.TEAM_NAME ����
      , ROUND (AVG(A.HEIGHT), 3) ���Ű
    FROM PLAYER A, TEAM B
   WHERE B.TEAM_ID = A.TEAM_ID
GROUP BY A.TEAM_ID, B.TEAM_NAME
  HAVING AVG (A.HEIGHT) < (SELECT AVG (X.HEIGHT)
                            FROM PLAYER X
                          WHERE X.TEAM_ID IN (SELECT TEAM_ID
                                                FROM TEAM
                                              WHERE TEAM_NAME = '�Ｚ�������'));
                                              

SELECT PLAYER_NAME, POSITION, BACK_NO, TEAM_ID, TEAM_NAME
FROM V_PLAYER_TEAM
WHERE PLAYER_NAME LIKE 'Ȳ%';

SELECT TEAM_ID ���ڵ�, PLAYER_NAME ������, POSITION ������
     ,BACK_NO ��ѹ�, HEIGHT Ű
   FROM PLAYER
  WHERE TEAM_ID = 'K02'
UNION
SELECT TEAM_ID ���ڵ�, PLAYER_NAME ������, POSITION ������
     ,BACK_NO ��ѹ�, HEIGHT Ű
    FROM PLAYER
WHERE TEAM_ID = 'K07';

SELECT TEAM_ID ���ڵ�, PLAYER_NAME ������, POSITION ������
     ,BACK_NO ��ѹ�, HEIGHT Ű
   FROM PLAYER
  WHERE TEAM_ID = 'K02'
UNION
SELECT TEAM_ID ���ڵ�, PLAYER_NAME ������, POSITION ������
     ,BACK_NO ��ѹ�, HEIGHT Ű
    FROM PLAYER
WHERE TEAM_ID = 'GK';

SELECT DISTINCT
       TEAM_ID ���ڵ�, PLAYER_NAME ������, POSITION ������
       ,BACK_NO ��ѹ�, HEIGHT Ű
    FROM PLAYER
   WHERE TEAM_ID = 'K02'
      OR POSITION = 'GK';

SELECT TEAM_ID ���ڵ�, PLAYER_NAME ������, POSITION ������
      ,BACK_NO ��ѹ�, HEIGHT Ű
    FROM PLAYER
   WHERE TEAM_ID = 'K02'
UNION ALL
SELECT TEAM_ID ���ڵ� , PLAYER_NAME ������, POSITION ������
      ,BACK_NO ��ѹ�, HEIGHT Ű
    FROM PLAYER
   WHERE POSITION = 'GK';
   
SELECT ���ڵ�, ������ , ������, ��ѹ�, Ű, COUNT (*) �ߺ���
    FROM (SELECT TEAM_ID ���ڵ�,PLAYER_NAME ������
                 ,POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
            FROM PLAYER
           WHERE TEAM_ID = 'K02'
         UNION ALL
         SELECT TEAM_ID ���ڵ�, PLAYER_NAME ������
               , POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
          FROM PLAYER
        WHERE POSITION = 'GK')
GROUP BY ���ڵ�, ������, ������, ��ѹ� ,Ű
  HAVING COUNT (*) > 1;
  
SELECT 'P' �����ڵ�, POSITION ������, ROUND(AVG (HEIGHT), 3) ���Ű
     FROM PLAYER
GROUP BY POSITION
UNION ALL
SELECT  'T' �����ڵ�, TEAM_ID ����, ROUND (AVG (HEIGHT), 3) ���Ű
    FROM PLAYER
GROUP BY TEAM_ID
ORDER BY 1;

SELECT  TEAM_ID ���ڵ�, PLAYER_NAME ������, POSITION ������
       ,BACK_NO ��ѹ�, HEIGHT Ű
    FROM PLAYER
   WHERE TEAM_ID = 'K02'
MINUS
SELECT  TEAM_ID ���ڵ�, PLAYER_NAME ������, POSITION ������
       ,BACK_NO ��ѹ�, HEIGHT Ű
    FROM PLAYER
   WHERE POSITION = 'MF'
ORDER BY 1,2,3,4,5;

