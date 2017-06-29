#' @title unmatched regionnames
#'
#' @description mapping regions given geojson file
#' @param dataset data set with regions and values to be matched
#' @param datacol column values
#' @param geofile a geosjon file
#' @param filecol territory column to match
#' @export
#' @return NULL
regnames<-function(dataset,datacol,geofile,filecol){
  dataset[which(!toupper(dataset[,datacol])%in%geofile@data[,filecol]),]
}
