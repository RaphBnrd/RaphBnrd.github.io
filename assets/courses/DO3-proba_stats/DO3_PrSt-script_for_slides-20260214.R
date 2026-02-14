library(tidyverse)
library(ggplot2)
library(zoo)

rm(list = ls())
main_folder = dirname(rstudioapi::getActiveDocumentContext()$path)

save_outputs = TRUE

# ADAPT THE FOLLOWING PATHS TO YOUR OWN FOLDER STRUCTURE
folder_ch2 = file.path(main_folder, "Chapitre2-Variables_aleatoires/figures") # Containing the climatic data and the figures for chapter 2
folder_ch5 = file.path(main_folder, "Chapitre5-Statistique_inferentielle/figures") # For the bootstrap figure


# Chapter 2 ---------------------------------------------------------------

# * * * IMPORT DATA * * *

# Global Monthly Averages (1850 – Recent) available at https://berkeleyearth.org/data/
# https://berkeley-earth-temperature.s3.us-west-1.amazonaws.com/Global/Land_and_Ocean_complete.txt

data_path = file.path(folder_ch2,
                      "Global_Surface_Temperature-1850_2024-Land_and_Ocean_complete.txt")

# Headers
print(read.table(data_path, skip=83, nrows=3, sep = "\t"))

# Data
data = read.table(data_path, skip = 86, sep = "", header = FALSE, fill = TRUE, strip.white = TRUE)
colnames(data) = c("Year", "Month", "Monthly_Anomaly", "Monthly_Unc", "Annual_Anomaly", "Annual_Unc", 
                   "Five_year_Anomaly", "Five_year_Unc", "Ten_year_Anomaly", "Ten_year_Unc", 
                   "Twenty_year_Anomaly", "Twenty_year_Unc")

# Convert everything as numeric
data = data %>% mutate(across(everything(), as.numeric))

data$t = data$Year + (data$Month - 0.5)/12

# Timeseries
p = ggplot() +
  geom_line(aes(x = t, y = Monthly_Anomaly, color = "Moyenne mensuelle"), data = data) + 
  geom_line(aes(x = Year, y = Monthly_Anomaly, color = "Moyenne annuelle"), size = 1, 
            data = data %>% group_by(Year) %>% summarize(Monthly_Anomaly = mean(Monthly_Anomaly))) +
  scale_color_manual(values = c("Moyenne mensuelle" = "grey", "Moyenne annuelle" = "tomato")) +
  labs(title = "Anomalie des températures globales de surface (1850 - 2024)",
       x = "Année", y = "Anomalie de température (°C)") +
  theme_minimal() + theme(legend.position = "top") + 
  guides(color = guide_legend(title = NULL))

print(p)

if (save_outputs) {
  ggsave(filename = file.path(folder_ch2, "sea_surface_temperature-timeseries.pdf"), 
         plot = p, width = 7, height = 4)
}


# * * * HISTOGRAMS * * *

color_B = "#609C60"

# Histogram of anomalies

all_bin_widths = c(0.5, 0.2, 0.05)

for (bin_width in all_bin_widths) {
  
  p = ggplot(data, aes(x = Monthly_Anomaly)) +
    geom_histogram(binwidth = bin_width, fill = "skyblue", color = "black", alpha = 0.7) +
    labs(#title = "Anomalies mensuelles de température globale de surface (1850 - 2024)",
         subtitle = paste0("Histogramme (largeur des barres = ",bin_width, "°C)"),
         x = "Anomalie de température mensuelle (°C)", y = "Nombre de mois") +
    theme_minimal()
  
  print(p)
  
  if (save_outputs) {
    ggsave(filename = file.path(folder_ch2, paste0("sea_surface_temperature-histogram-binwidth-", bin_width, ".pdf")), 
           plot = p, width = 5, height = 4)
  }
}

# With event B between x = 0 and 1 (binwidth = last element of all_bin_widths)

p = ggplot(data, aes(x = Monthly_Anomaly)) +
  geom_histogram(binwidth = all_bin_widths[length(all_bin_widths)], fill = "skyblue", color = "black", alpha = 0.7) +
  geom_histogram(
    data = subset(data, Monthly_Anomaly >= 0 & Monthly_Anomaly < 1),
    aes(x = Monthly_Anomaly),
    binwidth = all_bin_widths[length(all_bin_widths)], fill = color_B, color = "black", alpha = 0.7
  ) +
  annotate("text", x = 0.5, y = 100, label = "B", color = color_B, size = 7, vjust = -0.5) +
  labs(#title = "Anomalies mensuelles de température globale de surface (1850 - 2024)",
       #subtitle = paste0("Histogramme (largeur des barres = ",bin_width, "°C)"),
       x = "Anomalie de température mensuelle (°C)", y = "Nombre de mois") +
  theme_minimal()

print(p)

if (save_outputs) {
  ggsave(filename = file.path(folder_ch2, paste0("sea_surface_temperature-histogram-binwidth-", bin_width, "-B.pdf")), 
         plot = p, width = 5, height = 4)
}

# With density

norm_subset = dim(subset(data, Monthly_Anomaly >= 0 & Monthly_Anomaly < 1))[1] / dim(data)[1] # proportion of data in the subset (event B)

p = ggplot(data, aes(x = Monthly_Anomaly)) +
  geom_histogram(binwidth = all_bin_widths[length(all_bin_widths)], fill = "skyblue", 
                 color = "black", alpha = 0.7, aes(y = ..density..)) +
  labs(#title = "Anomalies mensuelles de température globale de surface (1850 - 2024)",
    #subtitle = paste0("Histogramme (largeur des barres = ",bin_width, "°C)"),
    x = "Anomalie de température mensuelle (°C)", y = "Densité") +
  theme_minimal()

p_without_B = p +
  geom_density(color = "blue", size = 2)

print(p_without_B)

if (save_outputs) {
  ggsave(filename = file.path(folder_ch2, paste0("sea_surface_temperature-histogram-binwidth-", bin_width, "-with_density.pdf")), 
         plot = p_without_B, width = 5, height = 4)
}

# With density and B

p_with_B = p +
  geom_histogram(
    data = subset(data, Monthly_Anomaly >= 0 & Monthly_Anomaly < 1),
    aes(x = Monthly_Anomaly, y = ..density.. * norm_subset),
    binwidth = all_bin_widths[length(all_bin_widths)], fill = color_B, color = "black", alpha = 0.7
  ) +
  annotate("text", x = 0.5, y = 0.5, label = "B", color = color_B, size = 7, vjust = -0.5) +
  geom_density(color = "blue", size = 2)

print(p_with_B)

if (save_outputs) {
  ggsave(filename = file.path(folder_ch2, paste0("sea_surface_temperature-histogram-binwidth-", bin_width, "-B-with_density.pdf")), 
         plot = p_with_B, width = 5, height = 4)
}



# Chapter 5 ---------------------------------------------------------------

set.seed(123)

# Parameters
p <- 0.3 # Probability for Bernoulli
n_values <- c(10, 50, 200, 1000) # Different sample sizes
n_boot <- 1000 # Number of bootstrap samples
n_tot = 50000

# Function to perform bootstrap and return means
bootstrap_means <- function(n, p, n_boot, n_tot) {
  # Generate original sample of size n_tot
  all_samples <- rbinom(n_tot, size = 1, prob = p)
  # Subsample n elements n_boot times
  boot_means = c()
  for (i in 1:n_boot) {
    this_sample = sample(all_samples, n)
    boot_means = c(boot_means, mean(this_sample))
  }
  return(boot_means)
}

# Collect bootstrap results for each n
results <- data.frame()
for (n in n_values) {
  boot_means <- bootstrap_means(n, p, n_boot, n_tot)
  temp <- data.frame(
    mean = boot_means,
    n = factor(n, levels = n_values)
  )
  results <- rbind(results, temp)
}

# Plot distributions
fig <- results %>%
  mutate(n_str = factor(paste("Taille des échantillons n =", n), 
                        levels = paste("Taille des échantillons n =", n_values))) %>%
  ggplot(aes(x = mean, fill = n)) +
  geom_histogram(alpha = 0.6, position = "identity", bins = 30) +
  facet_wrap(~ n_str) +
  geom_vline(xintercept = p, linetype = "dashed", color = "red") +
  geom_text(aes(x = p, label = "p", y = 300), color = "red", angle = 0, vjust = -0.5, hjust = -0.5) +
  labs(#title = bquote("Distribution empirique de " ~ hat(p) ~ " pour " ~ .(n_boot) ~ " rééchantillonnages"),
    #subtitle = paste0("Parmi ", n_tot, " individus suivant une loi de Bernoulli de paramètre p = ", p),
    x = expression(hat(p)), y = "Nombre d'échantillons") +
  theme_minimal() + theme(legend.position = "none")

# Export figure
if (save_outputs) {
  ggsave(file.path(folder_ch5, "bootstrap_estimator_distributions.pdf"), 
         plot = fig, width = 6, height = 4)
}


