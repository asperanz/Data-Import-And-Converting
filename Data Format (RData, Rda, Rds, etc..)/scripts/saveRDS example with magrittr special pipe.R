playlists_videos_hist_cum <- playlists_videos_hist %>%
  dplyr::filter(video_id %in% c("YyS7cqFRUvI","29laglX3M1g")) %>%
  dplyr::group_by(video_id) %>% 
  dplyr::mutate(video_cum_views = cumsum(video_daily_views)) %>% 
  dplyr::relocate(video_cum_views, .after = video_daily_views) %T>% # magrittr special pipe
  base::saveRDS(file = here("Development", "Data Retrieval (DT)", "data", "dda_playlists_videos_hist_cum.rds"))