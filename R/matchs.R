#' @title match region names
#'
#' @description mapping regions given geojson file
#' @param dataset data set with regions and values to be matched
#' @param datacol column values
#' @param geofile a geosjon file
#' @param filecol territory column to match
#' @export
#' @return NULL

matchs<-function(dataset,datacol,geofile,filecol){
  dataset[match(geofile@data[,filecol],toupper(distr)),datacol]
}
