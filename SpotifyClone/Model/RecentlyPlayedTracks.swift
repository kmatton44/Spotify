//
//  RecentlyPlayedTracks.swift
//  SpotifyClone
//
//  Created by KanoaMatton on 12/7/21.
//

import Foundation

struct RecentlyPlayedTracks: Codable {
    
    let cursors: [String: String]
    let items: [Items]
    //let href: String
    
}

struct Items: Codable {
    let played_at: String
    let track: Track
}

struct Track: Codable {
    let album: Album
    let artists: [TrackArtists]
    let disc_number: Int
    let duration_ms: Int
    //let explicit: String
    let name: String
    let preview_url: String
}

struct Album: Codable {
    let name: String
    let album_type: String
    let artists: [AlbumArtists]
    let images: [AlbumImages]
}

struct AlbumImages: Codable {
    let url: String
}

struct AlbumArtists: Codable {
    let name: String
}

struct TrackArtists: Codable {
    let name: String
}



/*
 
 {
     cursors =     {
         after = 1638905307217;
         before = 1638905307217;
     };
     href = "https://api.spotify.com/v1/me/player/recently-played?limit=1";
     items =     (
                 {
             context = "<null>";
             "played_at" = "2021-12-07T19:28:27.217Z";
            track =             {
                 album =                 {
                     "album_type" = album;
                     artists =                     (
                                                 {
                             "external_urls" =                             {
                                 spotify = "https://open.spotify.com/artist/5K4W6rqBFWDnAN6FQUkS6x";
                             };
                             href = "https://api.spotify.com/v1/artists/5K4W6rqBFWDnAN6FQUkS6x";
                             id = 5K4W6rqBFWDnAN6FQUkS6x;
                             name = "Kanye West";
                             type = artist;
                             uri = "spotify:artist:5K4W6rqBFWDnAN6FQUkS6x";
                         }
                     );
                     "external_urls" =                     {
                         spotify = "https://open.spotify.com/album/4Uv86qWpGTxf7fU7lG5X6F";
                     };
                     href = "https://api.spotify.com/v1/albums/4Uv86qWpGTxf7fU7lG5X6F";
                     id = 4Uv86qWpGTxf7fU7lG5X6F;
                     images =                     (
                                                 {
                             height = 640;
                             url = "https://i.scdn.co/image/ab67616d0000b27325b055377757b3cdd6f26b78";
                             width = 640;
                         },
                                                 {
                             height = 300;
                             url = "https://i.scdn.co/image/ab67616d00001e0225b055377757b3cdd6f26b78";
                             width = 300;
                         },
                                                 {
                             height = 64;
                             url = "https://i.scdn.co/image/ab67616d0000485125b055377757b3cdd6f26b78";
                             width = 64;
                         }
                     );
                     name = "The College Dropout";
                     "release_date" = "2004-02-10";
                     "release_date_precision" = day;
                     "total_tracks" = 21;
                     type = album;
                     uri = "spotify:album:4Uv86qWpGTxf7fU7lG5X6F";
                 };   <---ALBUM CLOSURE
                 artists =                 (
                                         {
                         "external_urls" =                         {
                             spotify = "https://open.spotify.com/artist/5K4W6rqBFWDnAN6FQUkS6x";
                         };
                         href = "https://api.spotify.com/v1/artists/5K4W6rqBFWDnAN6FQUkS6x";
                         id = 5K4W6rqBFWDnAN6FQUkS6x;
                         name = "Kanye West";
                         type = artist;
                         uri = "spotify:artist:5K4W6rqBFWDnAN6FQUkS6x";
                     }
                 );
                 "disc_number" = 1;
                 "duration_ms" = 193733;
                 explicit = 1;
                 "external_ids" =                 {
                     isrc = USDJ20400014;
                 };
                 "external_urls" =                 {
                     spotify = "https://open.spotify.com/track/5g1vtHqi9uV7xtYeCcFOBx";
                 };
                 href = "https://api.spotify.com/v1/tracks/5g1vtHqi9uV7xtYeCcFOBx";
                 id = 5g1vtHqi9uV7xtYeCcFOBx;
                 "is_local" = 0;
                 name = "Jesus Walks";
                 popularity = 69;
                 "preview_url" = "https://p.scdn.co/mp3-preview/96eaccd9c45656290287c1b56cb22839b9eb76df?cid=10315558775948abb624ec5aabc658b7";
                 "track_number" = 7;
                 type = track;
                 uri = "spotify:track:5g1vtHqi9uV7xtYeCcFOBx";
             };
         }
     );
     limit = 1;
     next = "https://api.spotify.com/v1/me/player/recently-played?before=1638905307217&limit=1";
 }
 
 
 */
