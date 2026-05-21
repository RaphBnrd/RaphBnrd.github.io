---
layout: page
permalink: /code/
title: code
description: List of code packages, repositories and GitHub profiles.
nav: true
nav_order: 5
---

<!-- PACKAGES -->

{% if site.data.packages.python_packages %}

## Packages

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for package in site.data.packages.python_packages %}
    {% include repository/package.liquid package=package %}
  {% endfor %}
</div>
{% endif %}


<!-- GITHUB REPOSITORIES -->

{% if site.data.repositories.github_repos %}

---

## Main Repositories

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for repo in site.data.repositories.github_repos %}
    {% include repository/repo.liquid repository=repo %}
  {% endfor %}
</div>
{% endif %}


<!-- USERS AND TROPHIES -->

{% if site.data.repositories.github_users %}

---

## Profile

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for user in site.data.repositories.github_users %}
    {% include repository/repo_user_simple.liquid
      username=user.username
      bio=user.bio
      website=user.website
    %}
  {% endfor %}
</div>


<!-- ## GitHub users

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for user in site.data.repositories.github_users %}
    {% include repository/repo_user.liquid username=user %}
  {% endfor %}
</div>

{% if site.repo_trophies.enabled %}

---

{% for user in site.data.repositories.github_users %}
{% if site.data.repositories.github_users.size > 1 %}

  <h4>{{ user }}</h4>
  {% endif %}
  <div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% include repository/repo_trophies.liquid username=user %}
  </div>

---

{% endfor %}
{% endif %} -->

{% endif %}