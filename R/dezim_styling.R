#' DeZIM Graphics Style
#'
#' @param title_size Size of title
#' @param sub_title_size Size of subtitle
#' @param x_axis_title_size size of x axis title
#' @param y_axis_title_size size of y axis title
#' @param x_axis_text_size size of x axis text
#' @param y_axis_text_size size of y axis text
#' @param legend_text_size Size of text in legend
#' @import ggplot2
#' @importFrom sysfonts font_files font_add
#' @importFrom grDevices rgb
#'
#' @examples
#' library(ggplot2)
#' mtcars$gear <- as.factor(mtcars$gear)
#'
#' p1 <- ggplot(mtcars) +
#' geom_point(aes(x = wt, y = mpg, colour = gear)) +
#' labs(
#' title = "Fuel economy declines as weight increases",
#'  subtitle = "(1973-74)",
#'   x = "Weight (1000 lbs)",
#'   y = "Fuel economy (mpg)",
#'   colour = "Gears"
#'   )
#'
#' #Default graph
#'  p1
#'
#'  \dontrun{
#'  #Examples are not run since test machine does not have Calibri installed
#' #use `+ dezim_style()` to apply theme
#'  p1 +
#'  dezim_style()
#'
#' #use `dezim_colors` for fill/colors
#'  p1 +
#'  dezim_style() +
#'  scale_color_manual(values = dezim_colors)
#' }
#'
#'
#'
#' @return No return, a theme to add to ggplot2 graphs
#' @export
#'
dezim_style <- function(title_size = 9, sub_title_size = 9, x_axis_title_size = 9,
                        y_axis_title_size = 9, x_axis_text_size = 9,
                        y_axis_text_size = 9, legend_text_size = 9){


    #sysfonts required to check for Calibri and add if it exists
    #rlang::check_installed("sysfonts")


  #"#1E5F46"
  #"#F2F4EF"
  #"#4B4B4B"
  #"#B3B3B3"

  green_rgb <- rgb(30, 95, 70, maxColorValue = 255)
  green5p_rgb <- rgb(242, 244, 239, maxColorValue = 255)
  text_rgb <- rgb(75, 75, 75, maxColorValue = 255)
  grey_rgb <-rgb(179, 179, 179, maxColorValue = 255)

    list_of_fonts <- as.data.frame(sysfonts::font_files())
    if(any(grepl("Calibri.ttf", list_of_fonts, ignore.case = TRUE))){

      Calibri <- try(list_of_fonts[list_of_fonts$file == "calibri.ttf",])
      if(NROW(Calibri) == 0){
        Calibri <-list_of_fonts[list_of_fonts$file == "Calibri.ttf",]
      }
      sysfonts::font_add(family = Calibri[,3],
                         regular = list.files(path = Calibri$path,
                                              pattern = Calibri[,2],
                                              full.names = TRUE))
    } else{
      stop("The Calibri font is not installed on your machine, please install it and try again")
    }



    ggplot2::theme(
      ### Text ###
      #154a39
      #4d4d4d
      #Title
      plot.title = element_text(size = title_size,
                                color = green_rgb,
                                family = "Calibri"),
      plot.subtitle = element_text(size = sub_title_size,
                                   color = green_rgb,
                                   family = 'Calibri'),
      plot.caption = element_text(color = green_rgb,
                                  family = 'Calibri'),

      #Axis text
      axis.title.x = element_text(size = x_axis_title_size, color = text_rgb,
                                  family = 'Calibri'),
      axis.text.x = element_text(size = x_axis_text_size, color = text_rgb,
                                 family = 'Calibri'),
      axis.title.y = element_text(size = y_axis_title_size, color = text_rgb,
                                  family = 'Calibri'),
      axis.text.y = element_text(size = y_axis_text_size, color = text_rgb,
                                 family = 'Calibri'),



      ### Legend ###
      legend.text= element_text(color = text_rgb,
                                size = legend_text_size,
                                family = "Calibri"),
      legend.title = element_text(color = text_rgb,
                                  family = 'Calibri'),
      legend.background = element_rect(fill = 'white',
                                       color = NA),
      legend.key = element_rect(fill = 'white'),
      legend.position = "bottom",

      ### Design ###
      plot.background = element_rect(fill = 'white'),
      panel.background = element_rect(fill = green5p_rgb),
      axis.ticks = element_blank(),
      panel.grid.major=element_line(color=grey_rgb, linewidth = .5/2.141959),
      panel.grid.minor=element_line(color = grey_rgb, linewidth = .5/2.141959))
}



#' Vector of colors for DeZIM Plots
#'
#' @format ## `dezim_colors`
#' A vector of colors to be used with fill/color functions for DeZIM graphs
#' \describe{
#'   \item{color}{Colors found in DeZIM style guide}
#'   ...
#' }
"dezim_colors"







