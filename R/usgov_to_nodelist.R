#' Extract nodelist and website from edgelist of United States federal government.
#' @param df The A-Z Government index as an edgelist.
#' @return A nodelist of the unique institutions in the A-Z Government index.
#' @import dplyr rename arrange 
#' @importFrom magrittr %>%
#' @export
#' @examples
#' \dontrun{
#' describe(dataset)
#' describe(dataset, col1, col2)
#' }


usgov_to_nodelist <- function(edgelist){
  
  # extract 
  vertices <- data.frame(id = unique(c(as.character(edgelist$from), 
                                         as.character(edgelist$to))))
  vertices <- vertices %>%
    dplyr::arrange(id)
  
  vertices

}

 