library(tidyverse)
library(janitor)
library(purrr)
library(tuber)

captions <- list_caption_tracks(part = "snippet", video_id = "rZfCO3Jxb5E", lang = "en",
                    id = NULL, simplify = TRUE)

related_videos <- get_related_videos(video_id = "rZfCO3Jxb5E", max_results = 50)

comment_threads <- get_comment_threads(filter = c(video_id = "YyS7cqFRUvI"), max_results = 101)

get_comments(filter = NULL, part = "snippet", max_results = 100,
             text_format = "html", page_token = NULL, simplify = TRUE)

comments <- get_comments(filter = 
               c(comment_id = "z13dh13j5rr0wbmzq04cifrhtuypwl4hsdk, 
             z13dh13j5rr0wbmzq04cifrhtuypwl4hsdk"))

channel_activities <- list_channel_activities(filter = c(channel_id = "UC6CV_32l8omBfcliOOQnIew"),  
                        published_before = "2016-12-31T00:00:00Z",
                        part = "snippet") 
                        #published_after = "2015-01-01T00:00:00Z"

playlist_items <- get_playlist_items(filter = 
                     c(playlist_id = "PLhIw1_0YGPETy5UGqmewQzcmeBZhU69db"),
                   max_results = 51)

list_regions()

videocats <- list_videocats(c(region_code = "IT"))

playlists <- tuber::get_playlists(filter = c(channel_id = "UC6CV_32l8omBfcliOOQnIew"), part = "contentDetails", simplify = TRUE)

channel_sections <- list_channel_sections(c(channel_id = "UC6CV_32l8omBfcliOOQnIew"))

videos <- list_videos(part = "snippet", max_results = 50)

subscriptions <- get_subscriptions(filter = c(channel_id = "UC6CV_32l8omBfcliOOQnIew"), part = "snippet")

video_details <- get_video_details(video_id = "rZfCO3Jxb5E", part = "statistics")

guidecats <- list_guidecats(c(region_code = "US"))

list_langs()

yt_search <- yt_search(term = "Dead Dogs", published_after = "2015-01-01T00:00:00Z") %>% 
  filter(channelId == "UC6CV_32l8omBfcliOOQnIew")