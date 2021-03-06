## Copyright (C) 2013 Bitergia
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
##
## This file is a part of the vizgrimoire R package
##
## Authors:
##   Jesus M. Gonzalez-Barahona <jgb@bitergia.com>
##
##
## MLSTZ class
##
## Class for dealing with regions that have associated values
##

setClass(Class="Regions",
         contains = "data.frame"
         )


##
## Initialize by getting a data frame
##
## .df: data frame. $region: names of regions (strings)
##          . other columns: parameters for each region
##
setMethod(f="initialize",
          signature="Regions",
          definition=function(.Object, df){
              cat("~~~ Region: initializator ~~~ \n")
              as(.Object, "data.frame") <- df
              return(.Object)
          }
          )

setMethod(f="PlotShares",
          signature="Regions",
          definition=function(.Object, file.prefix) {
              PlotSharesAll (paste(c(file.prefix, "tz-region-messages"),
                                   collapse=''),
                             as.data.frame(.Object), "messages")
              PlotSharesAll (paste(c(file.prefix, "tz-region-posters"),
                                   collapse=''),
                             as.data.frame(.Object), "posters")
          }
          )

##
## Create a JSON file out of a Regions object
##
## Parameters:
##  - filename: name of the JSON file to write
##
setMethod(
    f="JSON",
    signature="Regions",
    definition=function(.Object, filename) {
        sink(filename)
        cat(toJSON(list(regions=as.data.frame(.Object))))
        sink()
    }
    )

setMethod (
    f="show",
    signature="Regions",
    definition=function(object) {
        print(object)
    }
    )

##
## Create a CSV file out of a Regions object
##
## Parameters:
##  - filename: name of the CSV file to write
##
setMethod(
    f="CSV",
    signature="Regions",
    definition=function(.Object, filename) {
        write.csv(.Object, file = filename)
    }
    )

