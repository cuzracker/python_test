-- ## 신용카드 등록과 구매이력 유무를 0과 1이라는 플래그로 나타내는 쿼리 ##
SELECT m.user_id
	 , m.card_number
	 , COUNT(p.user_id) AS purchase_count
	 , CASE WHEN m.card_number IS NOT NULL THEN 1 ELSE 0 END AS has_card
	 , SIGN(COUNT(p.user_id)) AS has_purchased
FROM mst_users_with_card_number AS m
LEFT OUTER JOIN purchase_log AS p
	ON m.user_id = p.user_id
GROUP BY m.user_id, m.card_number
ORDER BY m.user_id, m.card_number;