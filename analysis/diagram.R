# radians <- seq(0, 6*pi, length.out = 600)
# df <- data.frame(
#   x = cos(radians) + seq(0, 6, length.out = 600),
#   y = sin(radians)
# )

# plot(df$x, df$y, type = 'l')

conflicted::conflict_prefer(name = "filter", winner = "dplyr")
n <- 600

# acknowledgements
# https://twitter.com/CSchmert/status/1224333501840928770?s=20

offset <- seq(from = 0, to = 2, length = n)


loop <- tibble(
  theta = seq(
    from = 0,
    to = 5 * pi,
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

points <- c(0, 2 * pi / 3, 4 * pi / 3) %>% c(., . + 2 * pi, . + 4 * pi) %>%
  map_df(fetchpoints)


lines <- tibble(
  y = c(0, cos(2 * pi / 3), -cos(2 * pi / 3)),
  label = c(
    "code::registration",
    "automated tests",
    "code that makes tests pass"
  )
)


point_size <- 5
alpha_workflow <- 0.3
alpha_progress <- 0.8


library(tidyverse)
loop %>%
  ggplot(aes(x = x, y = y)) +
  geom_path(alpha = 0.4) +
  geom_hline(yintercept = lines$y,
             alpha = alpha_workflow,
             linetype = "dotted") +
  theme_void() +
  geom_point(data = points,
             size = point_size,
             aes(x = x, y = y),
             alpha = alpha_workflow) +
  geom_text(data = lines %>% mutate(y = y + 0.1),
            aes(
              x = c(-pi / 6, 0, pi / 3),
              y = y,
              label = label
            ),
            alpha = alpha_workflow) +
  geom_point(data = slice(loop, 1, nrow(loop)),
             size = point_size,
             alpha = alpha_workflow) +
  geom_path(data = loop %>% filter(theta < 2 * pi / 3),
            alpha = alpha_progress) +
  geom_point(
    data = loop %>% filter(theta < (2 * pi / 3)) %>% slice(1, nrow(.)),
    alpha = alpha_progress,
    size = point_size
  )
