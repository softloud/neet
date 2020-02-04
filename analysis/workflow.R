#' Worfklow
#'
#' Draw an image of a testing workflow and where the user is up to in the
#' process.
#'
#' This was adapted from code snippets posted in this
#' [thread](https://twitter.com/CSchmert/status/1224333501840928770?s=20).

# acknowledgements
# https://twitter.com/CSchmert/status/1224333501840928770?s=20
# radians <- seq(0, 6*pi, length.out = 600)
# df <- data.frame(
#   x = cos(radians) + seq(0, 6, length.out = 600),
#   y = sin(radians)
# )
# plot(df$x, df$y, type = 'l')

#'
#' @export

workflow <- function(progress = 0) {
  conflicted::conflict_prefer(name = "filter", winner = "dplyr")
  n <- 600


  offset <- seq(from = 0,
                to = 1,
                length = n)


  loop <- tibble(
    theta = seq(
      from = 0,
      to = 6 * pi,
      length = n
    ),
    x = -cos(theta) + offset,
    y = sin(theta)
  ) %>%
    mutate(progress = row_number())

  fetchpoints <- function(cut_off) {
    loop %>%
      filter(theta <= cut_off) %>%
      slice(nrow(.))
  }

  points <-
    c(0, 2 * pi / 3, 4 * pi / 3) %>% c(., . + 2 * pi, . + 4 * pi, 6 * pi) %>%
    map_df(fetchpoints) %>%
    mutate(label = c("code::registration",
                     "tests",
                     "code") %>% rep(3))

  neet_labels <- c("one neet", "all neets", "and the rest")

  neets <- points %>%
    filter(label == "tests") %>%
    mutate(test = neet_labels,
           test = fct_relevel(neet_labels))


  point_size <- 7
  alpha_workflow <- 0.3
  alpha_progress <- 0.5

  workflow <-
    loop %>%
    ggplot(aes(x = x, y = y)) +
    geom_path(alpha = alpha_workflow, colour = "grey") +
    theme_void() +
    geom_point(
      data = points,
      size = point_size,
      alpha = alpha_workflow,
      aes(x = x, y = y, colour = label)
    ) +
    geom_point(
      data = slice(loop, 1, nrow(loop)),
      size = point_size,
      colour = "darkgreen",
      alpha = alpha_workflow
    ) +
    hrbrthemes::scale_color_ipsum("workflow") +
    geom_point(data = neets, aes(shape = test)) +
    labs(x = "code::proof to doneness workflow with code::registration")


  if (progress == 0) {
    workflow
  } else
  {
      cut_off <- points[progress, ] %>% pluck("theta")

      workflow +
        geom_path(
          data = loop %>% filter(theta < cut_off),
          colour = "darkblue",
          alpha = alpha_progress
        ) +
        geom_point(
          data = loop %>% filter(theta < cut_off) %>% slice(1, nrow(.)),
          colour = "darkblue",
          alpha = alpha_progress,
          size = point_size
        )
  }
}
