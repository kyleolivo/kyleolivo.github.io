---
permalink: /portfolio/postpique/
title: "PostPique"
layout: single
author_profile: false
---

{% assign project = site.data.portfolio.projects | where: "title", "PostPique" | first %}

<div class="project-header">
  <div class="project-hero">
    {% if project.image %}
      <img src="{{ project.image }}" alt="{{ project.title }}" class="project-hero-image app-hero-image">
    {% else %}
      <div class="project-placeholder">
        <i class="fas fa-image"></i>
        <span>{{ project.title }}</span>
      </div>
    {% endif %}
  </div>
  <div class="project-info">
    <h1 class="project-title">{{ project.title }}</h1>
    <div class="project-meta">
      <span class="project-date">
        <i class="far fa-calendar-alt"></i>
        Completed {{ project.completion_date | date: "%B %Y" }}
      </span>
      <span class="project-category">
        <i class="fas fa-tag"></i>
        {{ project.category }}
      </span>
    </div>
    <div class="project-technologies">
      {% for tech in project.technologies %}
        <span class="tech-tag">{{ tech }}</span>
      {% endfor %}
    </div>
  </div>
</div>

<div class="project-content">
  <div class="project-description">
    <h2>About this project</h2>
    <p>{{ project.long_description }}</p>
  </div>

  <div class="project-links">
    <h2>Project Links</h2>
    <div class="project-links-list">
      {% assign project_site = project.links | where: "label", "Project Site" | first %}
      {% assign github = project.links | where: "label", "GitHub" | first %}
      {% assign app_store = project.links | where: "label", "App Store" | first %}
      
      {% if project_site %}
        <a href="{{ project_site.url }}" target="_blank" rel="noopener noreferrer" class="project-link">
          <i class="fas fa-globe"></i>
          Project Site
        </a>
      {% endif %}
      
      {% if github %}
        <a href="{{ github.url }}" target="_blank" rel="noopener noreferrer" class="project-link">
          <i class="fab fa-github"></i>
          GitHub
        </a>
      {% endif %}
      
      {% if app_store %}
        <a href="{{ app_store.url }}" target="_blank" rel="noopener noreferrer" class="project-link">
          <i class="fab fa-app-store"></i>
          App Store
        </a>
      {% endif %}
    </div>
  </div>
</div>

<style>
.project-header {
  margin-bottom: 3rem;
}

.project-hero {
  margin-bottom: 2rem;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}

.project-hero-image {
  width: 100%;
  height: 400px;
  object-fit: cover;
  object-position: bottom;
  transform: scale(1.5);
  transform-origin: bottom;
}

/* Special styling for app hero images */
.app-hero-image {
  object-fit: contain;
  background: #f8f9fa;
  padding: 2rem;
}

.project-placeholder {
  width: 100%;
  height: 400px;
  background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  color: #586069;
  font-size: 1.25rem;
  text-align: center;
  padding: 2rem;
}

.project-placeholder i {
  font-size: 4rem;
  margin-bottom: 1rem;
  opacity: 0.6;
}

.project-placeholder span {
  font-weight: 600;
}

.project-info {
  text-align: center;
}

.project-title {
  font-size: 2.5rem;
  font-weight: 700;
  margin: 0 0 1rem 0;
  color: #24292e;
}

.project-meta {
  display: flex;
  justify-content: center;
  gap: 2rem;
  margin-bottom: 1.5rem;
  color: #586069;
  font-size: 1rem;
}

.project-date,
.project-category {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.project-technologies {
  display: flex;
  justify-content: center;
  gap: 0.75rem;
  flex-wrap: wrap;
}

.tech-tag {
  background: #f6f8fa;
  border: 1px solid #e1e4e8;
  border-radius: 20px;
  padding: 0.5rem 1rem;
  font-size: 0.875rem;
  color: #24292e;
  font-weight: 500;
}

.project-content {
  max-width: 800px;
  margin: 0 auto;
}

.project-description h2 {
  color: #24292e;
  margin-bottom: 1rem;
  font-size: 1.5rem;
}

.project-description p {
  color: #586069;
  line-height: 1.7;
  font-size: 1.1rem;
  margin-bottom: 2rem;
}

.project-links h2 {
  color: #24292e;
  margin-bottom: 1rem;
  font-size: 1.5rem;
}

.project-links-list {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.project-link {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  color: #0366d6;
  text-decoration: none !important;
  font-size: 1rem;
  font-weight: 500;
  transition: color 0.2s ease;
}

.project-link:hover {
  color: #0256cc !important;
  text-decoration: none !important;
}

.project-link:focus,
.project-link:visited {
  text-decoration: none !important;
}

@media (max-width: 768px) {
  .project-title {
    font-size: 2rem;
  }
  
  .project-meta {
    flex-direction: column;
    gap: 0.5rem;
  }
  
  .project-hero-image,
  .project-placeholder {
    height: 250px;
  }
}
</style>

