library("datasets")
require(graphics)

# View(swiss) #New York Air Quality Measurements
# pairs(airquality, panel = panel.smooth, main = "airquality data")

# https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/swiss.html

# http://www-hsc.usc.edu/~eckel/biostat2/labs/lab8.pdf
# https://www.coursehero.com/file/11781745/Assignment-1/

# https://opr.princeton.edu/archive/pefp/switz.aspx
# https://opr.princeton.edu/archive/pefp/sw1888.aspx

pairs(swiss, panel = panel.smooth, main = "swiss data",
      col = 3 + (swiss$Catholic > 50))

summary(lm(Fertility ~ . , data = swiss))
