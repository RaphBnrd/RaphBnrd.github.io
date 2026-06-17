---
layout: page
title: 🧑‍💻 🐍 🕵️ # 💻 🔍
description: Python package for occupancy modeling (survey with imperfect detection) suited for deep learning
img: assets/img/projects/logo_occupycy_crop5_7.png
image_source: "Generated with ChatGPT"
importance: -3
category: work
related_publications: false
---

[OccuPYcy](https://github.com/RaphBnrd/OccuPYcy) is an open-source Python package for **site-occupancy modeling** with imperfect detection—optimized for deep learning and large-scale, heterogeneous datasets.

- Built on PyTorch for flexibility and scalability
- Supports linear, non-linear, and neural network models for occupancy and detection
- Designed for citizen science and opportunistic data with major sampling and detection biases

You can find the GitHub repository and documentation below. It includes installation instructions, usage examples, and a detailed description of the package's features and capabilities. Feel free to explore, use, and contribute!

`The package is nearly cooked and will be released soon! 🧑‍🍳` 
*Expected launch: middle of July 2026.*

<div align="center">
  <img src="/assets/img/projects/ratatouille.gif" 
        alt="Ratatouille" 
        style="max-width: 300px; width: 100%; height: auto; display: block; border-radius: 15px;">
</div>

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for package in site.data.packages.python_packages %}
    {% if package.name == "OccuPYcy" %}
      {% include repository/package.liquid package=package %}
    {% endif %}
  {% endfor %}
</div>

