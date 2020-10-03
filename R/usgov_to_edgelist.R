#' Convert structure of United States federal government to a weighted edgelist.
#' @param df The A-Z Government index as a data frame.
#' @return An edgelist of the A-Z Government with multiple hierarchical relations between branch, agency, subagency, and unique instititions.
#' @import dplyr mutate select group_by rename count filter count 
#' @importFrom tidyr drop_na
#' @importFrom magrittr %>%
#' @export
#' @examples
#' \dontrun{
#' describe(dataset)
#' describe(dataset, col1, col2)
#' }


usgov_to_edgelist <- function(df){
  
  # branch to agency (when agency <> NA)
  branch_agency <- df %>%
    tidyr::drop_na(agency) %>%
    dplyr::select(branch, agency) %>%
    dplyr::rename(from = branch, to = agency) %>%
    dplyr::group_by(from, to) %>%
    dplyr::count() %>% 
    dplyr::rename(weight = n)
  
  # branch to subagency (when agency <> NA)
  # only medpac and macpac
  branch_subagency <- df %>%
    dplyr::filter(is.na(agency)) %>%
    tidyr::drop_na(subagency) %>%
    dplyr::select(branch, institution) %>%
    dplyr::rename(from = branch, to = institution) %>%
    dplyr::group_by(from, to) %>%
    dplyr::count() %>% 
    dplyr::rename(weight = n)
  
  # agency to subagency (when agency <> NA & subagency <> NA)
  agency_subagency <- df %>%
    tidyr::drop_na(agency, subagency) %>%
    dplyr::select(agency, subagency) %>%
    dplyr::rename(from = agency, to = subagency) %>%
    dplyr::group_by(from, to) %>%
    dplyr::count() %>% 
    dplyr::rename(weight = n)
  
  # branch to institution (when agency = NA)
  branch_institution <- df %>%
    dplyr::filter(is.na(agency)) %>%
    dplyr::select(branch, institution) %>%
    dplyr::rename(from = branch, to = institution) %>%
    dplyr::group_by(from, to) %>%
    dplyr::count() %>% 
    dplyr::rename(weight = n)
  
  # agency to institution (when agency <> NA & subagency = NA)
  agency_institution <- df %>%
    tidyr::drop_na(agency) %>%
    dplyr::filter(is.na(subagency)) %>%
    dplyr::select(agency, institution) %>%
    dplyr::rename(from = agency, to = institution) %>%
    dplyr::group_by(from, to) %>%
    dplyr::count() %>% 
    dplyr::rename(weight = n)
  
  # subagency to institution
  subagency_institution <- df %>%
    tidyr::drop_na(subagency) %>%
    dplyr::select(subagency, institution) %>%
    dplyr::rename(from = subagency, to = institution) %>%
    dplyr::group_by(from, to) %>%
    dplyr::count() %>% 
    dplyr::rename(weight = n)
  
  # bind dfs together 
  usgov_edgelist <- dplyr::bind_rows(branch_agency, branch_subagency, 
                                     agency_subagency, branch_institution, 
                                     agency_institution, subagency_institution)
  usgov_edgelist
  
}
