#' Read xvg file
#'
#' And cleanup and parse data
#'
#' @param str :: filepath to the xvg file
#'
#' @return cleaned data  :: tibble
#' @export
read_xvg <- function(str) {
  Peptides::readXVG(str) %>%
    tidyr::pivot_longer(
      cols = c(-Time),
      names_pattern = "r_(\\d+) (.)",
      names_to = c("r_id", ".value")
    ) %>%
    dplyr::rename_with(tolower) %>%
    dplyr::mutate(across(.fns = parse_number))
}

