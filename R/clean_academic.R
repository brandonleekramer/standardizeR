#' Compute descriptive statistics for the numeric columns of a data frame.
#' @param df The data frame to summarise.
#' @param institution Institution column you are standardizing.
#' @return A data frame with descriptive statistics. If you are only interested in certain columns
#' you can add these columns.
#' @import dplyr
#' @import data.table
#' @import maditr
#' @import tidyr
#' @importFrom magrittr %>%
#' @export
#' @examples
#' \dontrun{
#' describe(dataset)
#' describe(dataset, col1, col2)
#' }

clean_academic <- function(df, institution){
  # pulls in government strings to recode 
  #academic_df <- readr::read_csv("data-raw/academic_data.csv")
  
  institution <- enquo(institution)
  df <- df %>%
    dplyr::mutate(institution = tolower(!!institution),
                  institution = trimws(institution)) %>%
    tidyr::separate(institution, ("institution"), "\\(", extra = "drop") %>%
    dplyr::mutate(institution = str_replace_all(institution, "\\b(united states|united states of america)\\b", "u.s."),
                  institution = ifelse(test = str_detect(
                    string = institution,
                    pattern = paste0("\\b(?i)(",academic_df$original_string,")\\b")),
                    yes = academic_df$cleaned_string, no = institution))
  df
}

# TO DO: 
# Finish dictionary and convert to .rda
# add in `to_lower` parameter
# add in `start_str_only` parameter
# add in `end_str_only` parameter
# add in `finish_with_caps` parameter 
# add in `abbreviations` parameter
# ask hipo_labs about updated their dataset and including it in our package 
# 


















