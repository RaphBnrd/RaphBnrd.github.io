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

[OccuPYcy](https://github.com/RaphBnrd/OccuPYcy) is an open-source Python package for **site-occupancy modeling** with imperfect detection—optimized for deep learning and large-scale, messy datasets.

- Built on PyTorch for flexibility and scalability
- Supports linear, non-linear, and neural network models for occupancy and detection
- Designed for citizen science and opportunistic data with major sampling and detection biases

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for package in site.data.packages.python_packages %}
    {% if package.name == "OccuPYcy" %}
      {% include repository/package.liquid package=package %}
    {% endif %}
  {% endfor %}
</div>

