# List all customers (name + email), ordered alphabetically (no extra information)
SELECT last_name, email FROM customers
ORDER BY last_name

# List tracks (Name + Composer) of the Classical playlist
SELECT tracks.name, tracks.composer
FROM playlist_tracks
JOIN tracks ON tracks.id = playlist_tracks.track_id
JOIN playlists ON playlists.id = playlist_tracks.playlist_id
WHERE playlists.name = 'Classical'

# List the 10 artists mostly listed in all playlists
SELECT artists.name, COUNT(*) AS c
FROM artists
JOIN albums ON albums.artist_id = artists.id
JOIN tracks ON tracks.album_id = albums.id
JOIN playlist_tracks ON tracks.id = playlist_tracks.track_id
GROUP BY artists.name
ORDER BY c DESC
LIMIT 10

# List the tracks which have been purchased at least twice, ordered by number of purchases
SELECT tracks.name, tracks.composer, COUNT(*) AS c
FROM tracks
JOIN invoice_lines ON tracks.id = invoice_lines.track_id
GROUP BY tracks.name
HAVING c > 1
ORDER BY c DESC
