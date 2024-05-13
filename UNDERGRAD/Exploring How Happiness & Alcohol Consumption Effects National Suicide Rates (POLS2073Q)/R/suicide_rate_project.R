# Load the plm package
library(plm)
library(ggplot2)
library(car)
library(ggrepel)
library(stargazer)

# Load CSV file using read.csv()
df <- read.csv("happiness_data.csv")

# I collected my data from two sources:
  # Kaggle
  # The Organization for Economic Cooperation and Development

# Variables:
# Suicide Rate
# Suicide rates are defined as the deaths deliberately initiated and performed 
# by a person in the full knowledge or expectation of its fatal outcome. 
# Comparability of data between countries is affected by a number of reporting 
# criteria, including how a person's intention of killing themselves is 
# ascertained, who is responsible for completing the death certificate, whether 
# a forensic investigation is carried out, and the provisions for confidentiality 
# of the cause of death. Caution is required therefore in interpreting variations 
# across countries. The rates have been directly age-standardised to the 2010 
# OECD population to remove variations arising from differences in age structures 
# across countries and over time. The original source of the data is the WHO 
# Mortality Database. This indicator is presented as a total and per gender and 
# is measured in terms of deaths per 100 000 inhabitants (total), per 100 000 
# men and per 100 000 women.

# Healthcare Spending:
# Health spending measures the final consumption of health care goods and services 
# (i.e. current health expenditure) including personal health care (curative care,
# rehabilitative care, long-term care, ancillary services and medical goods) and 
# collective services (prevention and public health services as well as health 
# administration), but excluding spending on investments. Health care is financed 
# through a mix of financing arrangements including government spending and 
# compulsory health insurance (“Government/compulsory”) as well as voluntary 
# health insurance and private funds such as households’ out-of-pocket payments, 
# NGOs and private corporations (“Voluntary”). This indicator is presented as a 
# total and by type of financing (“Government/compulsory”, “Voluntary”, 
# “Out-of-pocket”) and is measured as a share of GDP, as a share of total health 
# spending and in USD per capita (using economy-wide PPPs).

# Social Support:
# Social support indicates the share of people who report having friends or 
# relatives whom they can count on in times of trouble. Individuals who say they 
# have family and friends they can count on to help them in times of trouble are 
# consistently more likely to be satisfied with their personal health, and 
# research has linked social isolation and loneliness to higher risks for a variety 
# of physical and mental conditions including high blood pressure, heart disease, 
# obesity, a weakened immune system, anxiety, depression, cognitive decline and 
# Alzheimer's disease. Due to small sample sizes, country averages for horizontal 
# inequalities (by age, gender and education) are pooled between 2010-20 to 
# improve the accuracy of the estimates. The survey sample is ex ante designed to 
# be nationally representative of the population aged 15 or over (including rural 
# areas). This indicator is measured as a percentage of survey respondents. 
# Education: Indicators sourced from the Gallup World Poll correspond to: 
# completed elementary education or less (up to eight years of basic education) 
# for “primary” level; completed some secondary education up to three years 
# tertiary education (9 to 15 years of education) for “secondary” level; and 
# completed four years of education beyond “high school” and/or received a four-year 
# college degree for “tertiary” level. Age: Young people are those aged 15 to 29; 
# middle-aged people are those aged 30 to 49, and older people are those aged 50 
# and over.

# Life Ladder:
# This is called the Cantril ladder: it asks respondents to think of a ladder, 
# with the best possible life for them being a 10 and the worst possible life 
# being a 0. They are then asked to rate their own current lives on that 0 to 10 
# scale.

# Generosity:
# The perceived generosity of people in the country.

# Alcohol Consumption:
# Alcohol consumption is defined as annual sales of pure alcohol in litres per 
# person aged 15 years and older. Alcohol use is associated with numerous harmful 
# health and social consequences, including an increased risk of a range of cancers, 
# stroke and liver cirrhosis. Alcohol also contributes to death and disability 
# through accidents and injuries, assault, violence, homicide and suicide. 
# This indicator is measured in litres per capita (people aged 15 years and older).

# -------------------------------------------------------------------------------------------
unique(df$LOCATION)
unique(df$TIME)
# -------------------------------------------------------------------------------------------
# COLOR CODED SCATTER PLOTS BEFORE OUTLIER REMOVAL

# Scatter plot for Social Support and Suicide Rate
ggplot(data = df, aes(x = social_support, y = suicide_rate, color = LOCATION)) + 
  geom_point() + 
  ggtitle("Relationship between Social Support and Suicide Rate") +
  labs(x = "Social Support", y = "Suicide Rate") 

# Scatter plot for Healthcare Spending and Suicide Rate
ggplot(data = df, aes(x = healthcare_spending, y = suicide_rate, color = LOCATION)) + 
  geom_point() + 
  ggtitle("Relationship between Healthcare Spending and Suicide Rate") +
  labs(x = "Healthcare Spending", y = "Suicide Rate") 

# Scatter plot for Life Ladder and Suicide Rate
ggplot(data = df, aes(x = Life.Ladder, y = suicide_rate, color = LOCATION)) + 
  geom_point() + 
  ggtitle("Relationship between Life Ladder and Suicide Rate") +
  labs(x = "Life Ladder", y = "Suicide Rate") 

# Scatter plot for Log GDP per capita and Suicide Rate
ggplot(data = df, aes(x = Log.GDP.per.capita, y = suicide_rate, color = LOCATION)) + 
  geom_point() + 
  ggtitle("Relationship between Log GDP per capita and Suicide Rate") +
  labs(x = "Log GDP per capita", y = "Suicide Rate") 

# Scatter plot for Generosity and Suicide Rate
ggplot(data = df, aes(x = Generosity, y = suicide_rate, color = LOCATION)) + 
  geom_point() + 
  ggtitle("Relationship between Generosity and Suicide Rate") +
  labs(x = "Generosity", y = "Suicide Rate") 

# Scatter plot for Alcohol Consumption and Suicide Rate
ggplot(data = df, aes(x = alcohol_consumption, y = suicide_rate, color = LOCATION)) + 
  geom_point() + 
  ggtitle("Relationship between Alcohol Consumption and Suicide Rate") +
  labs(x = "Alcohol Consumption", y = "Suicide Rate")

# -------------------------------------------------------------------------------------------
# OUTLIER DETECTION

# Remove rows corresponding to TUR, ZAF, GRC
df <- subset(df, LOCATION != "TUR" & LOCATION != "ZAF" & LOCATION != "GRC" & LOCATION != "MEX")

# -------------------------------------------------------------------------------------------
# COLOR CODED SCATTER PLOTS AFTER OUTLIER REMOVAL

# Scatter plot for Social Support and Suicide Rate
ggplot(data = df, aes(x = social_support, y = suicide_rate, color = LOCATION)) + 
  geom_point() + 
  ggtitle("Relationship between Social Support and Suicide Rate") +
  labs(x = "Social Support", y = "Suicide Rate") 

# Scatter plot for Healthcare Spending and Suicide Rate
ggplot(data = df, aes(x = healthcare_spending, y = suicide_rate, color = LOCATION)) + 
  geom_point() + 
  ggtitle("Relationship between Healthcare Spending and Suicide Rate") +
  labs(x = "Healthcare Spending", y = "Suicide Rate") 

# Scatter plot for Life Ladder and Suicide Rate
ggplot(data = df, aes(x = Life.Ladder, y = suicide_rate, color = LOCATION)) + 
  geom_point() + 
  ggtitle("Relationship between Life Ladder and Suicide Rate") +
  labs(x = "Life Ladder", y = "Suicide Rate") 

# Scatter plot for Log GDP per capita and Suicide Rate
ggplot(data = df, aes(x = Log.GDP.per.capita, y = suicide_rate, color = LOCATION)) + 
  geom_point() + 
  ggtitle("Relationship between Log GDP per capita and Suicide Rate") +
  labs(x = "Log GDP per capita", y = "Suicide Rate") 

# Scatter plot for Generosity and Suicide Rate
ggplot(data = df, aes(x = Generosity, y = suicide_rate, color = LOCATION)) + 
  geom_point() + 
  ggtitle("Relationship between Generosity and Suicide Rate") +
  labs(x = "Generosity", y = "Suicide Rate") 

# Scatter plot for Alcohol Consumption and Suicide Rate
ggplot(data = df, aes(x = alcohol_consumption, y = suicide_rate, color = LOCATION)) + 
  geom_point() + 
  ggtitle("Relationship between Alcohol Consumption and Suicide Rate") +
  labs(x = "Alcohol Consumption", y = "Suicide Rate")

# -------------------------------------------------------------------------------------------
# NORMAL SCATTER PLOTS

# Plot scatter plots for each variable against suicide_rate
ggplot(data = df, aes(x = social_support, y = suicide_rate)) + 
  geom_point() + 
  ggtitle("Relationship between Social Support and Suicide Rate")

ggplot(data = df, aes(x = healthcare_spending, y = suicide_rate)) + 
  geom_point() + 
  ggtitle("Relationship between Healthcare Spending and Suicide Rate")

ggplot(data = df, aes(x = Life.Ladder, y = suicide_rate)) + 
  geom_point() + 
  ggtitle("Relationship between Life Ladder and Suicide Rate")

ggplot(data = df, aes(x = Log.GDP.per.capita, y = suicide_rate)) + 
  geom_point() + 
  ggtitle("Relationship between Log GDP per capita and Suicide Rate")

ggplot(data = df, aes(x = Generosity, y = suicide_rate)) + 
  geom_point() + 
  ggtitle("Relationship between Generosity and Suicide Rate")

ggplot(data = df, aes(x = alcohol_consumption, y = suicide_rate)) + 
  geom_point() + 
  ggtitle("Relationship between Alcohol Consumption and Suicide Rate")

# -------------------------------------------------------------------------------------------
# FIRST MODEL
# TWO WAY FIXED EFFECTS

# Create a panel data frame using the 'plm.data()' function
panel_data <- pdata.frame(df, index=c("LOCATION","TIME"))


# Run the fixed effects model using the 'plm()' function
suicide_model1 <- plm(suicide_rate ~ Life.Ladder + alcohol_consumption,
                      data=panel_data,
                      model="within",
                      effect="twoways")

# View the model summary
summary(suicide_model1)

# -------------------------------------------------------------------------------------------
# CHECKING CORRELATION BETWEEN VARIABLES

cor(df[,c("social_support", "healthcare_spending", "Life.Ladder", "alcohol_consumption")])
# -------------------------------------------------------------------------------------------
# MODEL 2
# TWO WAY FIXED EFFECTS

# Create a panel data frame using the 'plm.data()' function
panel_data <- pdata.frame(df, index=c("LOCATION","TIME"))


# Run the fixed effects model using the 'plm()' function
suicide_model2 <- plm(suicide_rate ~ Life.Ladder + alcohol_consumption + 
                        healthcare_spending + Generosity,
                      data=panel_data, model="within",
                      effect="twoways")

# View the model summary
summary(suicide_model2)

# -------------------------------------------------------------------------------------------
# TABLE FOR BOTH MODELS

# Create a table of the model summary
stargazer(suicide_model1, suicide_model2, type="text")
# -------------------------------------------------------------------------------------------
# POST REGRESSION ANALYSIS

# Plot residuals vs fitted values
# Extract residuals and fitted values
residuals <- residuals(suicide_model1)
fitted <- fitted(suicide_model1)

# Plot residuals against fitted values
ggplot(data = data.frame(fitted, residuals), aes(x = fitted, y = residuals)) +
  geom_point() +
  ggtitle("Residuals vs Fitted Values") +
  xlab("Fitted Values") +
  ylab("Residuals")

# Plot residuals vs fitted values
# Extract residuals and fitted values
residuals <- residuals(suicide_model2)
fitted <- fitted(suicide_model2)

# Plot residuals against fitted values
ggplot(data = data.frame(fitted, residuals), aes(x = fitted, y = residuals)) +
  geom_point() +
  ggtitle("Residuals vs Fitted Values") +
  xlab("Fitted Values") +
  ylab("Residuals")



