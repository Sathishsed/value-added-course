# Importing Dataset
Housing <- read.csv("Housing.csv", stringsAsFactors = FALSE)

# Viewing Dataset
View(Housing)

# Datatypes Check
str(Housing)

# Datatype Conversion
Housing$basement <- as.factor(Housing$basement)
Housing$parking <- as.factor(Housing$parking)
Housing$furnishingstatus <- as.factor(Housing$furnishingstatus)
Housing$price <- as.factor(Housing$price)

# Datatypes Recheck
str(Housing)

# Express Table for people furnishingstatus
prop.table(table(Housing$furnishingstatus))

# Importing Library
library(ggplot2)


# housing furniturestatus bar graph
ggplot(Housing, aes(x = furnishingstatus)) + theme_classic() + 
  geom_bar() + 
  labs(y = "Housing", title = "Housing furniturestatus")


# basement wise furniturestatus
ggplot(Housing, aes(x = basement, fill = furnishingstatus)) + theme_light() + 
  geom_bar() + 
  labs(y = "Housing", 
       title = "Housing furniturestatus wrt basement")


ggplot(Housing, aes(x = parking, fill = furnishingstatus)) + theme_light() + 
  geom_bar() + 
  labs(y = " Housing", 
       title = "Housing wrt parking & furnishingstatus")


# Plot for basement wrt parking
ggplot(Housing, aes(x = basement, fill = furnishingstatus)) + theme_light() + 
  facet_grid(~parking) + geom_bar() + 
  labs(y = "Housing", 
       title = "Housing wrt basement & parking")


# Pie chart
ggplot(Housing, aes(x = "", fill = furnishingstatus)) + 
  geom_bar(position = "fill") + 
  facet_grid(~parking) + coord_polar(theta = "y")


# Plot for bedrooms & furnishingstatus distribution
ggplot(Housing, aes(x = bedrooms)) + theme_bw() + 
  geom_histogram(binwidth = 5) + 
  labs(y = "Housing", x = "bedrooms", 
       title = "Housing bedrooms & furnishingstatus distribution")


# Box Plot of housing wrt bedrooms
ggplot(Housing, aes(x = furnishingstatus, y = bedrooms)) + theme_bw() + 
  geom_boxplot() + 
  labs(y = "bedrooms", x = "furnishingstatus", 
       title = "Housing wrt bedrooms")


# Density plot
ggplot(Housing, aes(x = bedrooms, fill = furnishingstatus)) + theme_bw() + 
  facet_wrap(basement~parking) + geom_density(alpha = 0.5) + 
  labs(y = "bedrooms", x = "furnishingstatus", 
       title = "Housing wrt bedrooms, parking and basement")