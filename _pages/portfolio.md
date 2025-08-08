---
permalink: /portfolio/
title: "Portfolio"
---

<div class="portfolio-grid">
  {% for project in site.data.portfolio.projects %}
    <div class="portfolio-item" data-project="{{ project.title }}">
      <div class="portfolio-item-image">
        <a href="/portfolio/{{ project.title | slugify }}/">
          {% if project.image %}
            <img src="{{ project.image }}" alt="{{ project.title }}" class="portfolio-thumbnail {% if project.title == 'DrawScale' %}drawscale-thumbnail{% endif %} {% if project.title == 'Fog & Fern' or project.title == 'PostPique' %}app-thumbnail{% endif %}">
          {% else %}
            <div class="portfolio-placeholder">
              <i class="fas fa-image"></i>
              <span>{{ project.title }}</span>
            </div>
          {% endif %}
        </a>
      </div>
      <div class="portfolio-item-content">
        <h3 class="portfolio-item-title">
          <a href="/portfolio/{{ project.title | slugify }}/">{{ project.title }}</a>
        </h3>
        <p class="portfolio-item-description">{{ project.short_description }}</p>
        <div class="portfolio-item-meta">
          <span class="portfolio-item-date">
            <i class="far fa-calendar-alt"></i>
            {{ project.completion_date | date: "%B %Y" }}
          </span>
          <span class="portfolio-item-category">
            <i class="fas fa-tag"></i>
            {{ project.category }}
          </span>
        </div>
        <div class="portfolio-item-links">
          {% for link in project.links %}
            <a href="{{ link.url }}" target="_blank" rel="noopener noreferrer" class="portfolio-link-icon" title="{{ link.label }}">
              {% if link.label == "Project Site" %}
                <i class="fas fa-globe"></i>
              {% else %}
                <i class="{{ link.icon }}"></i>
              {% endif %}
            </a>
          {% endfor %}
        </div>
      </div>
    </div>
  {% endfor %}
</div>

<style>
.portfolio-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
  gap: 2rem;
  margin-top: 2rem;
}

.portfolio-item {
  border: 1px solid #e1e4e8;
  border-radius: 8px;
  overflow: hidden;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  background: white;
  display: flex;
  flex-direction: column;
}

.portfolio-item:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 25px rgba(0,0,0,0.1);
}

.portfolio-item-image {
  position: relative;
  overflow: hidden;
  height: 400px;
  flex-shrink: 0;
}

.portfolio-thumbnail {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.3s ease;
}

/* Focus on top portion for Fog & Fern */
.portfolio-item[data-project="Fog & Fern"] .portfolio-thumbnail {
  object-position: top;
  transform: scale(1.5);
  transform-origin: top;
}

/* Focus on bottom portion for PostPique */
.portfolio-item[data-project="PostPique"] .portfolio-thumbnail {
  object-position: bottom;
  transform: scale(1.5);
  transform-origin: bottom;
}

/* Focus on top portion for DrawScale */
.portfolio-item[data-project="DrawScale"] .portfolio-thumbnail {
  object-position: top;
  transform: scale(1.5);
  transform-origin: top;
}

/* Special styling for DrawScale image */
.drawscale-thumbnail {
  object-fit: contain;
  background: #f8f9fa;
  padding: 1rem;
}

/* Special styling for Fog & Fern and PostPique images */
.app-thumbnail {
  object-fit: contain;
  background: #f8f9fa;
  padding: 1rem;
}

.portfolio-item:hover .portfolio-thumbnail {
  transform: scale(1.6);
}

.portfolio-placeholder {
  width: 100%;
  height: 100%;
  background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  color: #586069;
  font-size: 0.875rem;
  text-align: center;
  padding: 1rem;
}

.portfolio-placeholder i {
  font-size: 2rem;
  margin-bottom: 0.5rem;
  opacity: 0.6;
}

.portfolio-placeholder span {
  font-weight: 500;
}

.portfolio-item-content {
  padding: 1.5rem;
  display: flex;
  flex-direction: column;
  flex: 1;
}

.portfolio-item-title {
  margin: 0 0 0.5rem 0;
  font-size: 1.25rem;
  font-weight: 600;
}

.portfolio-item-title a {
  color: #24292e;
  text-decoration: none;
}

.portfolio-item-title a:hover {
  color: #0366d6;
}

.portfolio-item-description {
  color: #586069;
  margin: 0 0 1rem 0;
  line-height: 1.5;
  flex: 1;
}

.portfolio-item-meta {
  display: flex;
  gap: 1rem;
  margin-bottom: 1rem;
  font-size: 0.875rem;
  color: #586069;
}

.portfolio-item-date,
.portfolio-item-category {
  display: flex;
  align-items: center;
  gap: 0.25rem;
}

.portfolio-item-links {
  display: flex;
  justify-content: flex-end;
  gap: 1rem;
  flex-wrap: nowrap;
  margin-top: auto;
}

.portfolio-link-icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 2.5rem;
  height: 2.5rem;
  background: #f6f8fa;
  border: 1px solid #e1e4e8;
  border-radius: 50%;
  color: #586069;
  text-decoration: none !important;
  font-size: 1rem;
  transition: all 0.2s ease;
}

.portfolio-link-icon:hover {
  background: #0366d6;
  color: white;
  border-color: #0366d6;
  text-decoration: none !important;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(3, 102, 214, 0.3);
}

.portfolio-link-icon:focus {
  text-decoration: none !important;
  outline: none;
}

.portfolio-link-icon:visited {
  text-decoration: none !important;
}

@media (max-width: 768px) {
  .portfolio-grid {
    grid-template-columns: 1fr;
    gap: 1.5rem;
  }
  
  .portfolio-item-image {
    height: 300px;
  }
  
  .portfolio-item-content {
    padding: 1rem;
  }
  
  .portfolio-item-links {
    justify-content: center;
  }
}
</style>
