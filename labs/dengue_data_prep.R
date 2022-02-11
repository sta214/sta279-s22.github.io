dengue_original <- read.csv("dengue_original.csv")

### Do some data cleaning
dengue <- dengue_original %>%
  select(SiteNo, Sex, Age, DayDisease, Vomiting, Abdo, Muco, Skin,
         Temp, BMI, Height, Weight, Flush, Rash, WBC, HCT, PLT, 
         NS1_TRIP, Lab_Confirmed_Dengue) %>%
  rename(SiteNumber = SiteNo, 
         DiseaseDay = DayDisease,
         Abdominal = Abdo,
         Mucosal = Muco,
         Temperature = Temp, 
         RapidTest = NS1_TRIP,
         Dengue = Lab_Confirmed_Dengue) %>%
  mutate(Vomiting = as.factor(2 - Vomiting),
         Abdominal = as.factor(2 - Abdominal),
         Mucosal = as.factor(2 - Mucosal),
         Skin = as.factor(2 - Skin),
         Flush = as.factor(2 - Flush),
         Rash = as.factor(2 - Rash),
         RapidTest = ifelse(RapidTest == 1, "positive", "negative"),
         Dengue = 2 - Dengue,
         Sex = ifelse(Sex == 1, "male", "female")) %>% 
  drop_na() %>%
  select(SiteNumber,
         Sex, Age, DiseaseDay, 
         Vomiting, Abdominal, Temperature,
         BMI, WBC, HCT, PLT, 
         RapidTest, Dengue)

write_csv(dengue, "dengue.csv")
