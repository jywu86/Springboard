SELECT DATE_TRUNC('day',created_at) AS day,
       COUNT(*) AS all_users,
       COUNT(CASE WHEN activated_at IS NOT NULL THEN user_id ELSE NULL END) AS activated_users
  FROM tutorial.yammer_users 
 WHERE created_at >= '2014-06-01'
   AND created_at < '2014-09-01'
 GROUP BY 1
 ORDER BY 1





COUNT(CASE WHEN activated_at IS NOT NULL THEN user_id ELSE NULL END) AS activated_users








 1. Decline in number of email promotions
 2. Loss of accounts? 
 3. Looks like German and French accounts are all gone after 7/28/2018. 


 SELECT event_name,
  COUNT(DISTINCT CASE WHEN location IN ('United States', 'Australia', 'Canada', 'United Kingdom') THEN user_id ELSE NULL END) AS english,
  COUNT(DISTINCT CASE WHEN location NOT IN ('United States', 'Australia', 'Canada', 'United Kingdom') THEN user_id ELSE NULL END) AS non-english
  FROM tutorial.yammer_events
  WHERE event_name = 'search_autocomplete' OR event_name = 'search_run' OR event_name = 'search_click_result_x'
  GROUP BY event_name
  ORDER BY user_id, occurred_at