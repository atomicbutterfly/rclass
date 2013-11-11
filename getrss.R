library(XML)
con = url("http://www.routledge.com/articles/")

html3 <- htmlTreeParse("http://www.routledge.com/articles/", useInternalNodes=T)
xpathSApply(html3, '//class="listitem"', xmlValue)

#htmlCode = readLines(con)
close(con)
htmlCode
