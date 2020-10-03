#' Compute descriptive statistics for the numeric columns of a data frame.
#' @param df The data frame to summarise.
#' @param institution Institution column you are standardizing.
#' @return A data frame with descriptive statistics. If you are only interested in certain columns
#' you can add these columns.
#' @import dplyr mutate
#' @importFrom stringr str_replace_all str_detect
#' @importFrom tidyr separate
#' @importFrom magrittr %>%
#' @export
#' @examples
#' \dontrun{
#' describe(dataset)
#' describe(dataset, col1, col2)
#' }

standardize_gov <- function(df, institution){
  
  # pulls in government strings to recode 
  #gov_df <- load(file = "data/gov_strings.rda")
  data(gov_strings)
  #gov_df <- readr::read_csv("data-raw/gov_strings.csv") %>% select(-exclude_from_final)
  
  institution <- enquo(institution)
  df <- df %>%
    dplyr::mutate(institution = tolower(!!institution),
                  institution = trimws(institution)) %>%
    tidyr::separate(institution, ("institution"), "\\(", extra = "drop") %>%
    # standardize variations in u.s.
    dplyr::mutate(institution = stringr::str_replace_all(institution, 
                  "\\b(united states|united states of america|usa|u.s.a.)\\b", "u.s."),
    # standardize department 
                  institution = stringr::str_replace_all(institution, 
                  "\\b(dept|dept.)\\b", "department"),
                  institution = ifelse(test = stringr::str_detect(string = institution,
                  pattern = paste0("\\b(?i)(",gov_strings$original_string,")\\b")),
                  yes = gov_strings$cleaned_string, no = institution))
  df
}

# TO DO: 
# Finish dictionary and convert to .rda
# add in `to_lower` parameter
# add in `start_str_only` parameter
# add in `end_str_only` parameter
# add in `finish_with_caps` parameter 
# add in `abbreviations` parameter
# add in `specific` and `general` options based on different datasets 











