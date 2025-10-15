---
layout: page
title: 🌿 🌍 📉
description: PhD project - Estimating spatio-temporal trends of plant species using Opportunistic Citizen science data
img: assets/img/projects/dactylorhiza_brennensis_crop5:7.jpeg
image_source: "Dactylorhiza brennensis by MATIGNON Théo - <a href='https://obsindre.fr/index.php?module=observation&action=detail&idobs=990734'>Indre Nature</a>"
importance: -3
category: work
related_publications: true
---

This project is my PhD thesis work at Université de Montpellier (France), in [Inria](https://inria.fr/en)/[LIRMM](https://www.lirmm.fr/lirmm-en/) team. It started in October 2024 under the supervision of [Alexis Joly](https://sites.google.com/view/alexis-joly-inria/home/), [Maximilien Servajean](https://maximiliense.github.io/), and [Christophe Botella](http://christophebotella.fr/).

The current directions are described below. \\
`I'm open to suggestions and collaborations, feel free to contact me!`


## Summary

Monitoring **species distributions** is critical for understanding ecological dynamics and informing conservation efforts, especially in the context of current **global changes**. Although **opportunistic data** from **citizen science** programs offer extensive spatial and temporal coverage, they are affected by substantial sampling and detection biases. This PhD thesis proposes a method for estimating species distributions and their temporal trends from presence-only data using **hierarchical site-occupancy models** that account for both types of bias. We explore the use of deep learning to fit these models efficiently and flexibly. We plan to apply this framework to **real-world datasets, such as Pl@ntNet**, and further investigate model extensions that incorporate more complex observer behaviors and detection processes using various neural network architectures. We will use these models to assess **trends** in plant species in terms of coverage, population changes and range shifts. Furthermore, one of the objectives of this PhD is to study the **factors that influence these trends** such as land use changes, climate change, and pollution.


<div style="display: flex; flex-direction: column; align-items: center; gap: 8px;">
  <!-- Top row: map + scale + spider -->
    <div style="display: flex; flex-wrap: wrap; justify-content: center; align-items: flex-start; gap: clamp(0px, 5vw, 200px); width: 100%;">
        <!-- Map + Scale wrapper -->
        <div style="display: flex; align-items: flex-start; gap: 4px;">
        <!-- Map -->
        <div style="display: inline-block; position: relative;">
            <img src="/assets/img/projects/nbr_obs_plantnet-map.gif" 
                 alt="Map" 
                 style="max-width: 300px; width: 100%; height: auto; display: block; border-radius: 0;">
            <!-- Scale -->
            <img src="/assets/img/projects/nbr_obs_plantnet-map-scale.png" 
                 alt="Map scale" 
                 style="height: 70%; width: auto; display: block; border-radius: 0; position: absolute; top: 15%; left: 100%;">
        </div>
        </div>
        <!-- Spider -->
        <img src="/assets/img/projects/nbr_obs_plantnet-spider.gif" 
             alt="Spider" 
             style="flex: 1 1 250px; max-width: 270px; height: 90%; display: block; border-radius: 8px;">
    </div>
    <!-- Legend -->
    <div style="text-align: center; font-size: 0.95em;">
        <em>Number of occurrences per month in a subset of validated Pl@ntNet observations</em>
    </div>
</div> <br>
 