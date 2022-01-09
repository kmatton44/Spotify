//
//  UserTopItems.swift
//  SpotifyClone
//
//  Created by KanoaMatton on 12/10/21.
//

import Foundation

struct UserTopItems: Codable {
    
    let items: [TopItems]
    
}

struct TopItems: Codable {
    
    let id: String
    let name: String
    let images: [TopImages]
    
}

struct TopImages: Codable {
    let url: String
}

/*
 
 {
     href = "https://api.spotify.com/v1/me/top/artists?limit=5&offset=0";
     items =     (
                 {
             "external_urls" =             {
                 spotify = "https://open.spotify.com/artist/4O15NlyKLIASxsJ0PrXPfz";
             };
             followers =             {
                 href = "<null>";
                 total = 12456302;
             };
             genres =             (
                 "melodic rap",
                 "philly rap",
                 rap,
                 trap
             );
             href = "https://api.spotify.com/v1/artists/4O15NlyKLIASxsJ0PrXPfz";
             id = 4O15NlyKLIASxsJ0PrXPfz;
             images =             (
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
             popularity = 89;
             type = artist;
             uri = "spotify:artist:4O15NlyKLIASxsJ0PrXPfz";
         },
                 {
             "external_urls" =             {
                 spotify = "https://open.spotify.com/artist/45TgXXqMDdF8BkjA83OM7z";
             };
             followers =             {
                 href = "<null>";
                 total = 2583608;
             };
             genres =             (
                 "florida rap"
             );
             href = "https://api.spotify.com/v1/artists/45TgXXqMDdF8BkjA83OM7z";
             id = 45TgXXqMDdF8BkjA83OM7z;
             images =             (
                                 {
                     height = 640;
                     url = "https://i.scdn.co/image/ab6761610000e5eb69dc893d0ea9e44a34f97cc9";
                     width = 640;
                 },
                                 {
                     height = 320;
                     url = "https://i.scdn.co/image/ab6761610000517469dc893d0ea9e44a34f97cc9";
                     width = 320;
                 },
                                 {
                     height = 160;
                     url = "https://i.scdn.co/image/ab6761610000f17869dc893d0ea9e44a34f97cc9";
                     width = 160;
                 }
             );
             name = "Rod Wave";
             popularity = 80;
             type = artist;
             uri = "spotify:artist:45TgXXqMDdF8BkjA83OM7z";
         },
                 {
             "external_urls" =             {
                 spotify = "https://open.spotify.com/artist/7wlFDEWiM5OoIAt8RSli8b";
             };
             followers =             {
                 href = "<null>";
                 total = 7872302;
             };
             genres =             (
                 "baton rouge rap",
                 trap
             );
             href = "https://api.spotify.com/v1/artists/7wlFDEWiM5OoIAt8RSli8b";
             id = 7wlFDEWiM5OoIAt8RSli8b;
             images =             (
                                 {
                     height = 640;
                     url = "https://i.scdn.co/image/ab6761610000e5ebd3377606c57e58a68da3647e";
                     width = 640;
                 },
                                 {
                     height = 320;
                     url = "https://i.scdn.co/image/ab67616100005174d3377606c57e58a68da3647e";
                     width = 320;
                 },
                                 {
                     height = 160;
                     url = "https://i.scdn.co/image/ab6761610000f178d3377606c57e58a68da3647e";
                     width = 160;
                 }
             );
             name = "YoungBoy Never Broke Again";
             popularity = 86;
             type = artist;
             uri = "spotify:artist:7wlFDEWiM5OoIAt8RSli8b";
         },
                 {
             "external_urls" =             {
                 spotify = "https://open.spotify.com/artist/6AgTAQt8XS6jRWi4sX7w49";
             };
             followers =             {
                 href = "<null>";
                 total = 5978029;
             };
             genres =             (
                 "chicago rap"
             );
             href = "https://api.spotify.com/v1/artists/6AgTAQt8XS6jRWi4sX7w49";
             id = 6AgTAQt8XS6jRWi4sX7w49;
             images =             (
                                 {
                     height = 640;
                     url = "https://i.scdn.co/image/ab6761610000e5ebdec41838906c58af1c29c9da";
                     width = 640;
                 },
                                 {
                     height = 320;
                     url = "https://i.scdn.co/image/ab67616100005174dec41838906c58af1c29c9da";
                     width = 320;
                 },
                                 {
                     height = 160;
                     url = "https://i.scdn.co/image/ab6761610000f178dec41838906c58af1c29c9da";
                     width = 160;
                 }
             );
             name = "Polo G";
             popularity = 91;
             type = artist;
             uri = "spotify:artist:6AgTAQt8XS6jRWi4sX7w49";
         },
                 {
             "external_urls" =             {
                 spotify = "https://open.spotify.com/artist/2tIP7SsRs7vjIcLrU85W8J";
             };
             followers =             {
                 href = "<null>";
                 total = 2979096;
             };
             genres =             (
                 "australian hip hop"
             );
             href = "https://api.spotify.com/v1/artists/2tIP7SsRs7vjIcLrU85W8J";
             id = 2tIP7SsRs7vjIcLrU85W8J;
             images =             (
                                 {
                     height = 640;
                     url = "https://i.scdn.co/image/ab6761610000e5eb70783ea42c106f3f325f53af";
                     width = 640;
                 },
                                 {
                     height = 320;
                     url = "https://i.scdn.co/image/ab6761610000517470783ea42c106f3f325f53af";
                     width = 320;
                 },
                                 {
                     height = 160;
                     url = "https://i.scdn.co/image/ab6761610000f17870783ea42c106f3f325f53af";
                     width = 160;
                 }
             );
             name = "The Kid LAROI";
             popularity = 90;
             type = artist;
             uri = "spotify:artist:2tIP7SsRs7vjIcLrU85W8J";
         }
     );
     limit = 5;
     next = "https://api.spotify.com/v1/me/top/artists?limit=5&offset=5";
     offset = 0;
     previous = "<null>";
     total = 50;
 }
 
 
 
 */
