#' @title plot mapregions
#'
#' @description mapping regions given geojson file
#' @param geofile geojon file with coordinates
#' @param territory regions
#' @param labels column values to be set in labels
#' @param measure column value to measure
#' @param fill type of label: 1-abrev, 2-full, 3- None
#' @param main main title
#' @param mapcol colores
#' @param xlimit x limit
#' @param yllimit y limit
#' @export
#' @return NULL

regmap<-function(
  geofile,
  territory,
  labels,
  measure,
  fill,
  main,
  mapcol,
  xlimit,
  ylimit
){
  sp.label <- function(geofile, label) {
    list("sp.text", coordinates(geofile), cex=0.5,label)
  }

  numb.sp.label <- function(geofile) {
    sp.label(geofile,list(
      abrev=paste(substr(territory,1,3), labels, sep="-"),
      full=territory,
      none=rep("",length(territory))
    )
    )
  }
  make.numb.sp.label <- function(geofile,fill) {
    do.call("list", c(numb.sp.label(geofile)[1:3],list(numb.sp.label(geofile)[[4]][[fill]])))
  }
  spplot(
    geofile,
    zcol=measure,
    main=main,
    col.regions =colorRampPalette(mapcol)(length(territory)+16),
    sp.layout = make.numb.sp.label(geofile,fill),
    scales=list(draw=T),
    col="grey",
    edge.col="grey",
    colorkey=TRUE,
    xlim = apply(coordinates(geofile),2,range)[,1]+xlimit,
    ylim = apply(coordinates(geofile),2,range)[,2]+ylimit
  )
}
