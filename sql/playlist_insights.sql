-- Identify which playlist contains the most tracks.

SELECT
	p.Name AS playlist_name,
	COUNT (pt.TrackId) AS number_of_tracks
FROM PlaylistTrack pt
JOIN Playlist p
	ON pt.PlaylistId = p.PlaylistId
GROUP BY playlist_name
ORDER BY number_of_tracks DESC;

-- Determine which playlist has the highest total duration (in milliseconds).

SELECT
	pt.PlaylistId, 
	p.Name AS playlist_name,
	SUM(t.Milliseconds) AS total_duration
FROM PlaylistTrack pt
JOIN Track t
	ON pt.TrackId = t.TrackId
JOIN Playlist p
	ON pt.PlaylistId = p.PlaylistId
GROUP BY playlist_name 
ORDER BY total_duration DESC;