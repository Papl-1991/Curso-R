library("datasets")
require(graphics)

# View(swiss) #New York Air Quality Measurements
# pairs(airquality, panel = panel.smooth, main = "airquality data")

# https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/swiss.html

pairs(swiss, panel = panel.smooth, main = "swiss data",
      col = 3 + (swiss$Catholic > 50))

summary(lm(Fertility ~ . , data = swiss))
