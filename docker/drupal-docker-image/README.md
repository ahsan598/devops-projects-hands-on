# 📘 README: Drupal + MariaDB with Custom Bootstrap Theme (Docker Compose Project)


### 🧠 Project Objective

This project sets up a Drupal 10 website with a MariaDB backend using Docker Compose. It also demonstrates how to install and activate a custom Drupal theme (Bootstrap) via a custom Docker image built from a Dockerfile.

It serves as a practical example of using Docker for CMS development, focusing on container orchestration, image customization, and persistent data handling without host-level modifications.

> ⚙️ Tools used: Docker, Docker Compose, Git, Drupal, MariaDB


### 🚀 Steps I Followed
1. 📦 Dockerfile - Custom Drupal Image with Bootstrap Theme

> ✅ Best Practice: Keeping layers minimal, cleaning cache, avoiding unnecessary layers (like extra RUN commands), setting correct file permissions, and not installing directly on host.

2. 🧩 docker-compose.yml - Multi-Service App

> ✅ Best Practice:
> - Used volumes for Drupal data and database to persist across restarts.
> - `depends_on` helps with service startup order (though not health-check based).
> - Built `drupal` image from local Dockerfile, tagged as custom-drupal.


### Theme Overview:
**Before applying theme to drupal**
![before-theme-apply](https://github.com/ahsan598/devops-labs/blob/main/docker/drupal-docker-image/screenshots/before-theme-applied.jpg)

**After applying theme to drupal**
![after-theme-apply](https://github.com/ahsan598/devops-labs/blob/main/docker/drupal-docker-image/screenshots/after-theme-applied.jpg) 


### 🛠️ How to Run the Project

```sh
# 1. Build and start the containers
docker compose up -d

# 2. Access the site in your browser
http://localhost:8080

# 3. Follow Drupal's installation wizard (select MariaDB and provide credentials used in docker-compose)

# 4. After setup, go to Appearance > Bootstrap > Install and set as default

# 5. Done! The theme is now applied.

# 6. If you stop the containers:
docker compose down

# This will stop and remove containers, but preserve volumes (data persists)
```


### 📚 What I Learned

- Building custom images using Dockerfile
- Multi-container orchestration with docker-compose
- How to persist data using Docker volumes
- Installing and applying a Drupal theme from git
- Clean image building practices


### ✍️ Notes to Self

- This lab is for my personal DevOps self-learning journey.
- Keep files minimal and clean
- Focus on reusability, clarity, and understanding over production-readiness.

### 🔁 Future Improvements / To-Dos

- Add `healthcheck` to services
- Use `.env` file for sensitive config (like DB creds)
- Mount theme as a volume for faster iteration (dev mode)
- Explore drush (Drupal CLI) usage in container


---

### 🙌 Credit
Learned via **Docker Mastery: with Kubernetes + Swarm by @bretfisher** on Udemy.
