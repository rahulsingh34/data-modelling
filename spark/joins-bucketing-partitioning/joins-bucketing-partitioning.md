- match_details
  - a row for every players performance in a match
- matches
  - a row for every match 
- medals_matches_players 
  - a row for every medal type a player gets in a match
- medals
  - a row for every medal type 

Your goal is to make the following things happen:

- Build a Spark job that
  - Disabled automatic broadcast join with `spark.conf.set("spark.sql.autoBroadcastJoinThreshold", "-1")`
  - Explicitly broadcast JOINs `medals` and `maps`
  - Bucket join `match_details`, `matches`, and `medal_matches_players` on `match_id` with `16` buckets
  - With the aggregated data set
    - Try different `.sortWithinPartitions` to see which has the smallest data size (hint: playlists and maps are both very low cardinality)