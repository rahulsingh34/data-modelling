WITH deduped AS (
	SELECT
		*,
		ROW_NUMBER() OVER(PARTITION BY game_id, player_id) AS row_num
	FROM
		game_details
)
SELECT
	*
FROM
	deduped
WHERE
	row_num = 1
