library(tuber)
library(tidyverse)
library(lubridate)
library(stringi)
library(wordcloud)
library(gridExtra)
library(googleAuthR)

# Youtube Authentication #

yt_oauth("874248587347-8gdgaapljjqk45ie899pqernknlhtjiq.apps.googleusercontent.com", "2g7jtm2lwzCKFpGjNwmUXmGf")


# = Download and prepare data = #

# = Channel stats = #
chstat = get_channel_stats("UC6CV_32l8omBfcliOOQnIew")


# = Videos = #
videos = yt_search(term="", type="video", channel_id = "UC6CV_32l8omBfcliOOQnIew")
videos = videos %>%
  mutate(date = as.Date(publishedAt)) %>%
  filter(date > "2016-07-20") %>%
  arrange(date)

# = Comments = #
comments = lapply(as.character(videos$video_id), function(x){
  get_comment_threads(c(video_id = x), max_results = 1000)
})


# = Prep the data = #
# = Video Stat Table = #
videostats = lapply(as.character(videos$video_id), function(x){
  get_stats(video_id = x)
})
videostats = do.call(rbind.data.frame, videostats)
videostats$title = videos$title
videostats$date = videos$date
videostats = select(videostats, date, title, viewCount, likeCount, dislikeCount, commentCount) %>%
  as.tibble() %>%
  mutate(viewCount = as.numeric(as.character(viewCount)),
         likeCount = as.numeric(as.character(likeCount)),
         dislikeCount = as.numeric(as.character(dislikeCount)),
         commentCount = as.numeric(as.character(commentCount)))

# = General Stat Table = #
genstat = data.frame(Channel="Dead Dogs", Subcriptions=chstat$statistics$subscriberCount,
                     Views = chstat$statistics$viewCount,
                     Videos = chstat$statistics$videoCount, Likes = sum(videostats$likeCount),
                     Dislikes = sum(videostats$dislikeCount), Comments = sum(videostats$commentCount))

# = videostats Plot = #
p1 = ggplot(data = videostats[-1, ]) + geom_point(aes(x = viewCount, y = likeCount))
p2 = ggplot(data = videostats[-1, ]) + geom_point(aes(x = viewCount, y = dislikeCount))
p3 = ggplot(data = videostats[-1, ]) + geom_point(aes(x = viewCount, y = commentCount))
grid.arrange(p1, p2, p3, ncol = 2)

# = Comments TS = #
comments_ts = lapply(comments, function(x){
  as.Date(x$publishedAt)
})
comments_ts = tibble(date = as.Date(Reduce(c, comments_ts))) %>%
  group_by(date) %>% count()
ggplot(data = comments_ts) + geom_line(aes(x = date, y = n)) +
  geom_smooth(aes(x = date, y = n), se = FALSE) + ggtitle("Comments by day")+
  geom_vline(xintercept = as.numeric(as.Date("2017-11-08")), linetype = 2,color = "red")+
  geom_vline(xintercept = as.numeric(as.Date("2017-04-28")), linetype = 2,color = "red")

