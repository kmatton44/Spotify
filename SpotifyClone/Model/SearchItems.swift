//
//  SearchItems.swift
//  SpotifyClone
//
//  Created by KanoaMatton on 12/16/21.
//

import Foundation

struct SearchItems: Codable {
    
    let albums: SearchAlbums
    let artists: SearchArtists
    let tracks: SearchTracks
    
}

// MARK: ALBUM
struct SearchAlbums: Codable {
    
    let items: [SearchAlbumItems]
    
}

struct SearchAlbumItems: Codable {
    let images: [SearchAlbumImages]
    let id: String
    let name: String
    let release_date: String
    let total_tracks: Int
}

struct SearchAlbumImages: Codable {
    let url: String
}

// MARK: ARTIST
struct SearchArtists: Codable {
    let items: [SearchArtistItems]
}

struct SearchArtistItems: Codable {
    let images: [SearchArtistImages]
    let name: String
    let id: String
    let popularity: Int
}

struct SearchArtistImages: Codable {
    let url: String
}



// MARK: TRACK
struct SearchTracks: Codable {
    let items: [SearchTrackItems]

}

struct SearchTrackItems: Codable {
    let name: String
    let id: String
    let album: SearchTrackAlbum
}

struct SearchTrackAlbum: Codable {
    let images: [SearchTrackImages]
}

struct SearchTrackImages: Codable {
    let url: String
}


/*
 
 {
     albums =     {
         href = "https://api.spotify.com/v1/search?query=Uzi&type=album&locale=en-us&offset=0&limit=1";
         items =         (
                         {
                 "album_type" = album;
                 artists =                 (
                                         {
                         "external_urls" =                         {
                             spotify = "https://open.spotify.com/artist/4O15NlyKLIASxsJ0PrXPfz";
                         };
                         href = "https://api.spotify.com/v1/artists/4O15NlyKLIASxsJ0PrXPfz";
                         id = 4O15NlyKLIASxsJ0PrXPfz;
                         name = "Lil Uzi Vert";
                         type = artist;
                         uri = "spotify:artist:4O15NlyKLIASxsJ0PrXPfz";
                     }
                 );
                 "external_urls" =                 {
                     spotify = "https://open.spotify.com/album/7mgdTKTCdfnLoa1HXHvLYM";
                 };
                 href = "https://api.spotify.com/v1/albums/7mgdTKTCdfnLoa1HXHvLYM";
                 id = 7mgdTKTCdfnLoa1HXHvLYM;
                 images =                 (
                                         {
                         height = 640;
                         url = "https://i.scdn.co/image/ab67616d0000b2738be07181aa935225a6f25d56";
                         width = 640;
                     },
                                         {
                         height = 300;
                         url = "https://i.scdn.co/image/ab67616d00001e028be07181aa935225a6f25d56";
                         width = 300;
                     },
                                         {
                         height = 64;
                         url = "https://i.scdn.co/image/ab67616d000048518be07181aa935225a6f25d56";
                         width = 64;
                     }
                 );
                 name = "Lil Uzi Vert vs. The World";
                 "release_date" = "2016-05-27";
                 "release_date_precision" = day;
                 "total_tracks" = 9;
                 type = album;
                 uri = "spotify:album:7mgdTKTCdfnLoa1HXHvLYM";
             }
         );
         limit = 1;
         next = "https://api.spotify.com/v1/search?query=Uzi&type=album&locale=en-us&offset=1&limit=1";
         offset = 0;
         previous = "<null>";
         total = 3023;
     };
     artists =     {
         href = "https://api.spotify.com/v1/search?query=Uzi&type=artist&locale=en-us&offset=0&limit=1";
         items =         (
                         {
                 "external_urls" =                 {
                     spotify = "https://open.spotify.com/artist/4O15NlyKLIASxsJ0PrXPfz";
                 };
                 followers =                 {
                     href = "<null>";
                     total = 12506536;
                 };
                 genres =                 (
                     "melodic rap",
                     "philly rap",
                     rap,
                     trap
                 );
                 href = "https://api.spotify.com/v1/artists/4O15NlyKLIASxsJ0PrXPfz";
                 id = 4O15NlyKLIASxsJ0PrXPfz;
                 images =                 (
                                         {
                         height = 640;
                         url = "https://i.scdn.co/image/ab6761610000e5eb879835ea4e3a0f0b8cf1c7b4";
                         width = 640;
                     },
                                         {
                         height = 320;
                         url = "https://i.scdn.co/image/ab67616100005174879835ea4e3a0f0b8cf1c7b4";
                         width = 320;
                     },
                                         {
                         height = 160;
                         url = "https://i.scdn.co/image/ab6761610000f178879835ea4e3a0f0b8cf1c7b4";
                         width = 160;
                     }
                 );
                 name = "Lil Uzi Vert";
                 popularity = 90;
                 type = artist;
                 uri = "spotify:artist:4O15NlyKLIASxsJ0PrXPfz";
             }
         );
         limit = 1;
         next = "https://api.spotify.com/v1/search?query=Uzi&type=artist&locale=en-us&offset=1&limit=1";
         offset = 0;
         previous = "<null>";
         total = 767;
     };
     tracks =     {
         href = "https://api.spotify.com/v1/search?query=Uzi&type=track&locale=en-us&offset=0&limit=1";
         items =         (
                         {
                 album =                 {
                     "album_type" = album;
                     artists =                     (
                                                 {
                             "external_urls" =                             {
                                 spotify = "https://open.spotify.com/artist/699OTQXzgjhIYAHMy9RyPD";
                             };
                             href = "https://api.spotify.com/v1/artists/699OTQXzgjhIYAHMy9RyPD";
                             id = 699OTQXzgjhIYAHMy9RyPD;
                             name = "Playboi Carti";
                             type = artist;
                             uri = "spotify:artist:699OTQXzgjhIYAHMy9RyPD";
                         }
                     );
                     "external_urls" =                     {
                         spotify = "https://open.spotify.com/album/7dAm8ShwJLFm9SaJ6Yc58O";
                     };
                     href = "https://api.spotify.com/v1/albums/7dAm8ShwJLFm9SaJ6Yc58O";
                     id = 7dAm8ShwJLFm9SaJ6Yc58O;
                     images =                     (
                                                 {
                             height = 640;
                             url = "https://i.scdn.co/image/ab67616d0000b273a1e867d40e7bb29ced5c0194";
                             width = 640;
                         },
                                                 {
                             height = 300;
                             url = "https://i.scdn.co/image/ab67616d00001e02a1e867d40e7bb29ced5c0194";
                             width = 300;
                         },
                                                 {
                             height = 64;
                             url = "https://i.scdn.co/image/ab67616d00004851a1e867d40e7bb29ced5c0194";
                             width = 64;
                         }
                     );
                     name = "Die Lit";
                     "release_date" = "2018-05-11";
                     "release_date_precision" = day;
                     "total_tracks" = 19;
                     type = album;
                     uri = "spotify:album:7dAm8ShwJLFm9SaJ6Yc58O";
                 };
                 artists =                 (
                                         {
                         "external_urls" =                         {
                             spotify = "https://open.spotify.com/artist/699OTQXzgjhIYAHMy9RyPD";
                         };
                         href = "https://api.spotify.com/v1/artists/699OTQXzgjhIYAHMy9RyPD";
                         id = 699OTQXzgjhIYAHMy9RyPD;
                         name = "Playboi Carti";
                         type = artist;
                         uri = "spotify:artist:699OTQXzgjhIYAHMy9RyPD";
                     },
                                         {
                         "external_urls" =                         {
                             spotify = "https://open.spotify.com/artist/4O15NlyKLIASxsJ0PrXPfz";
                         };
                         href = "https://api.spotify.com/v1/artists/4O15NlyKLIASxsJ0PrXPfz";
                         id = 4O15NlyKLIASxsJ0PrXPfz;
                         name = "Lil Uzi Vert";
                         type = artist;
                         uri = "spotify:artist:4O15NlyKLIASxsJ0PrXPfz";
                     }
                 );
                 "disc_number" = 1;
                 "duration_ms" = 153800;
                 explicit = 1;
                 "external_ids" =                 {
                     isrc = USUM71804149;
                 };
                 "external_urls" =                 {
                     spotify = "https://open.spotify.com/track/2BJSMvOGABRxokHKB0OI8i";
                 };
                 href = "https://api.spotify.com/v1/tracks/2BJSMvOGABRxokHKB0OI8i";
                 id = 2BJSMvOGABRxokHKB0OI8i;
                 "is_local" = 0;
                 name = "Shoota (feat. Lil Uzi Vert)";
                 popularity = 83;
                 "preview_url" = "<null>";
                 "track_number" = 6;
                 type = track;
                 uri = "spotify:track:2BJSMvOGABRxokHKB0OI8i";
             }
         );
         limit = 1;
         next = "https://api.spotify.com/v1/search?query=Uzi&type=track&locale=en-us&offset=1&limit=1";
         offset = 0;
         previous = "<null>";
         total = 10001;
     };
 }
 
 
 
 */
