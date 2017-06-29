#' @title substitute region names
#'
#' @description mapping regions given geojson file
#' @param string array with nonmatch values
#' @param replace regions replacement
#' @param dataset data set with regions and values to be matched
#' @param datacol column values
#' @export
#' @return NULL

subst<-function(string,replace,dataset,datacol){
  mgsub(string,replace,dataset[,datacol])
}
