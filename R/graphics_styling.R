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
#'
#' @examples
#' library(surveyexplorer)
#'
#' #add "+ dezim_style to ggplot2 graphs
#' surveyexplorer::matrix_table(berlinbears, dplyr::starts_with('p_')) +
#' dezim_style()
#'
#' #use dezim_colors for functions that take colors
#'  surveyexplorer::matrix_freq(berlinbears, dplyr::starts_with('p_')) +
#'  dezim_style() + ggplot2::scale_fill_manual(values = dezim::dezim_colors)
#'
#'
#'
#' @return No return, a theme to add to ggplot2 graphs
#' @export
#'
dezim_style <- function(title_size = 10.5, sub_title_size = 9, x_axis_title_size = 10,
                        y_axis_title_size = 10, x_axis_text_size = 9,
                        y_axis_text_size = 9, legend_text_size = 9){


    #sysfonts required to check for Calibri and add if it exists
    #rlang::check_installed("sysfonts")


    list_of_fonts <- as.data.frame(sysfonts::font_files())
    if(any(grepl("Calibri.ttf", list_of_fonts, ignore.case = TRUE))){
      Calibri <- list_of_fonts[list_of_fonts$file == "calibri.ttf",]
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
                                color = "#154a39",
                                family = "Calibri"),
      plot.subtitle = element_text(size = sub_title_size,
                                   color = "#154a39",
                                   family = 'Calibri'),
      plot.caption = element_text(color = "#154a39",
                                  family = 'Calibri'),

      #Axis text
      axis.title.x = element_text(size = x_axis_title_size, color = "#4d4d4d",
                                  family = 'Calibri'),
      axis.text.x = element_text(size = x_axis_text_size, color = "#4d4d4d",
                                 family = 'Calibri'),
      axis.title.y = element_text(size = y_axis_title_size, color = "#4d4d4d",
                                  family = 'Calibri'),
      axis.text.y = element_text(size = y_axis_text_size, color = "#4d4d4d",
                                 family = 'Calibri'),



      ### Legend ###
      legend.text= element_text(color = "#4d4d4d",
                                size = legend_text_size,
                                family = "Calibri"),
      legend.title = element_text(color = "#4d4d4d",
                                  family = 'Calibri'),
      legend.background = element_rect(fill = '#EAEDEC',
                                       color = NA),
      legend.key = element_rect(fill = "#EAEDEC"),
      legend.position = "bottom",

      ### Design ###
      plot.background = element_rect(fill = '#EAEDEC',
                                     colour = "#154a39"),
      axis.ticks = element_line(color = "#4d4d4d"),
      panel.grid.major=element_line(color="#D3D3D3", linewidth = .5/2.141959),
      panel.grid.minor=element_line(color = "#D3D3D3", linewidth = .5/2.141959))


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



