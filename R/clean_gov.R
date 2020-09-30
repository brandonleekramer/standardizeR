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

clean_gov <- function(df, institution){
  govData <- readr::read_csv("data-raw/government_data.csv")
  institution <- enquo(institution)
  df <- df %>%
    #as.data.table() %>%
    ## this code will be implemented below
    dplyr::mutate(institution = tolower(!!institution),
           institution = trimws(institution)) %>%
    tidyr::separate(institution, ("institution"), "\\(", extra = "drop") %>%
    dplyr::mutate(institution = str_replace_all(institution, "\\b(united states|united states of america)\\b", "u.s."),
           institution = ifelse(test = str_detect(string = institution,
                                                  pattern = paste0("\\b(?i)(",govData$original_string,")\\b")),
                                yes = govData$cleaned_string, no = institution))
  rm(govData)
  df
}
