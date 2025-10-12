---
layout: page
title: Mapping Plant Species
description: Estimating spatio-temporal trends of plant species using Opportunistic Citizen science data
img: assets/img/projects/dactylorhiza_brennensis_crop5:7.jpeg
importance: 1
category: work
related_publications: true
---

This project is my PhD thesis work at Université de Montpellier (France), in [Inria](https://inria.fr/en)/[LIRMM](https://www.lirmm.fr/lirmm-en/) team. It started in October 2024 under the supervision of [Alexis Joly](https://sites.google.com/view/alexis-joly-inria/home/), [Maximilien Servajean](https://maximiliense.github.io/), and [Christophe Botella](http://christophebotella.fr/).

The current directions are described below. `I'm open to suggestions and collaborations, feel free to contact me!`


## Summary

Monitoring **species distributions** is critical for understanding ecological dynamics and informing conservation efforts, especially in the context of current **global changes**. Although **opportunistic data** from **citizen science** programs offer extensive spatial and temporal coverage, they are affected by substantial sampling and detection biases. This PhD thesis proposes a method for estimating species distributions and their temporal trends from presence-only data using **hierarchical site-occupancy models** that account for both types of bias. We explore the use of deep learning to fit these models efficiently and flexibly. We plan to apply this framework to **real-world datasets, such as Pl@ntNet**, and further investigate model extensions that incorporate more complex observer behaviors and detection processes using various neural network architectures. We will use these models to assess **trends** in plant species in terms of coverage, population changes and range shifts. Furthermore, one of the objectives of this PhD is to study the **factors that influence these trends** such as land use changes, climate change, and pollution.


## Part 1: Deep Occupancy Models for Presence-Only Data

Opportunistic citizen science datasets are prone to **various biases**, including **sampling bias** (spatio-temporal variations in sampling effort) and **detection bias** (variations in detectability or reporting across species). 
These phenomena are also evident in the Pl@ntNet dataset, with an increasing number of observations over the years and a higher number of records during spring.

<div style="display: flex; flex-direction: column; align-items: center; gap: 8px;">
    <!-- Top row: map + scale + spider -->
    <div style="display: flex; align-items: center; gap: 8px;">
        <!-- Map -->
        <img src="/assets/img/projects/nbr_obs_plantnet-map.gif" 
             alt="Map" 
             style="max-height: 300px; width: auto; display: block; border-radius: 0; margin-right: 0;">
        <!-- Scale -->
        <img src="/assets/img/projects/nbr_obs_plantnet-map-scale.png" 
             alt="Map scale" 
             style="max-height: 230px; width: auto; display: block; border-radius: 0;">
        <!-- Spider -->
        <img src="/assets/img/projects/nbr_obs_plantnet-spider.gif" 
             alt="Spider" 
             style="max-height: 300px; width: auto; display: block; border-radius: 8px; margin-left: 50px;">
    </div>
    <!-- Legend -->
    <div style="text-align: center; font-size: 0.95em;">
        <em>Number of observations per month in Pl@ntNet</em>
    </div>
</div> <br>
 
To address these issues and estimate species distributions using large-scale opportunistic presence-only data, we propose to use **hierarchical occupancy models** that explicitly account for imperfect detection while also correcting for sampling biases.

Occupancy models are **identifiable** when the number of sites and visits is sufficiently large. However, this identifiability becomes less clear with **finite datasets**, especially when **detection probabilities are low**. 
We will conduct experiments on simulated data to assess model identifiability and the accuracy of estimates across various scenarios, including different numbers of sites and visits, detection probabilities, and sampling biases.

Furthermore, we propose using **deep learning** to fit these models in order to address the following challenges:

- **Scalability:** Maximum likelihood estimation or Bayesian inference can be very slow on large datasets, as computing on full likelihoods (their gradients/higher-order derivatives) or performing MCMC sampling grows computationally expensive. Deep learning frameworks allow for stochastic optimization methods (e.g., SGD, Adam) and parallelization, significantly speeding up computations.

- **Flexibility (or expressivity):** Classical estimation methods often require models with few parameters. Neural networks allow for relaxing this constraint and modeling more complex relationships.


## Part 2: Estimating Temporal Trends using Opportunistic Data

This section focuses on estimating **temporal trends** in species distributions using opportunistic presence-only data from citizen science programs. 
We will first apply **traditional methods** (e.g., Frescalo, Telfer) for estimating temporal trends. 
Next, we will investigate whether **occupancy models** can be used to estimate temporal trends and evaluate whether **deep learning** can improve the efficiency of model fitting.

## Other ideas

Building on the previous methodological developments, we aim to explore several additional topics related to plant ecology:
- Investigate **drivers** of plant species distributions and their temporal changes (e.g., land use, climate, pollution).
- Study rapid phenomena, such as **extreme climate events**, **invasive species**, or **sudden population declines**.

We would also like to explore observer bias in citizen science datasets:
- Study observer histories to better understand their behavior, providing insights into:
    - characterizing participants in citizen science initiatives (e.g., changes in the **pool of observers** over time), 
    - how individual observers evolve through their contributions (e.g., **specialization**, increasing expertise, learning trajectories in species identification), 
    - broader patterns in **human views on biodiversity** (e.g., which species are more frequently recorded or overlooked).
