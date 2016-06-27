# Table of Contents

* [Impact of transformation of the operating area](#Changes)
* [Import Data to PostgreSQL](#Import_Data)  



#  Impact of transformation of the operating area<a id="Changes"></a>

## Create matrix with start-end-relationship

1. Create hexagon shapefile in QGIS (see wiki article *Create Hexagons with QGIS*) with required size and import it into PostgreSQL database
2. Set hexagon ID for start and end for each trip and export the result grouped by hexagon id´s as csv with [Hexagon_Matrix_Start_End.sql](PostgreSQL/Nearest_Neighbour.sql). Modify table name of hexagons and schema if necessary!
3. Import csv to R and create matrix with [Hexagon_Matrix_Start_End.R](R/Hexagon_Matrix_Start_End.R)
4. 

## Calculate shortest distance between grid points and vehicles
1. Create grid points in QGIS
2. Select nearest neighbour for each grid point and calculate distance: [Nearest_Neighbour.sql](PostgreSQL/Nearest_Neighbour.sql)

Hint: is a classical nearest neighbour problem, but running it as bulk on a whole table is a bit tricky and furthermore timeconsuming (adjust config settings, see [Wiki] (https://github.com/martindotlindner/carsharing/wiki/Performance-Optimization-of-PostgreSQL)!)

Further details:

* a useful link to understand the query: https://blog.cartodb.com/lateral-joins/
* a similiar problem in stackoverflow: http://stackoverflow.com/questions/34517386/unique-assignment-of-closest-points-between-two-tables
* the query: [Nearest_Neighbour.sql](PostgreSQL/Nearest_Neighbour.sql)

 