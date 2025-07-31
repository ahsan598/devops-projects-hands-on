# 🐳 Docker Labs – Personal DevOps Practice

Welcome to my **Docker Labs** – a hands-on collection of containerization projects.
 
Each lab is a self-contained environment using docker and docker compose, built to sharpen real-world DevOps skills.

---

### 📦 Prerequisites

- Docker installed: [Get Docker](https://docs.docker.com/get-docker/)
- Docker Compose v2+


### 🚀 Running Any Lab

Ex:
```bash
cd 01-nginx-static
docker-compose up --build
```


### 🎯 Objective

- Build and break things while learning Docker deeply
- Create reference labs for re-use in future projects
- Track growth in containerization, networking, and orchestration
- Document learnings for personal reflection and sharing


## 🧠 Key Skills Being Built

- Writing optimized and layered `dockerfiles`
- Containerizing real applications (Node, PHP, Python, etc.)
- Using `docker-compose` for multi-service setups
- Managing volumes, environment configs, and networks
- Building clean, production-ish images
- Troubleshooting and debugging container behavior


### 🧪 Approach

- Each folder is a **self-contained docker lab**
- Real applications or backend services are used (no "hello world" only)
- Minimal dependencies — focus on what's essential to learn
- All labs runnable locally with just docker/docker compose



### 🎯 Philosophy

- **Learn by doing** → break things → fix them → document
- **Build real, not perfect** → messy is fine as long as it teaches
- **Everything is versioned** → folders show progressive complexity
- **Readme-first thinking** → explain setups like I’m teaching someone else



### 📒 Learnings (So Far)

- Docker networking works differently across compose vs single-container
- Multi-stage builds drastically reduce final image size
- Mounting local volumes makes live dev smoother, but caching gets tricky
- FastAPI + PostgreSQL + Docker Compose is a killer combo for prototyping APIs
- PHP apps with NGINX are simple but need good volume setup for live reloads
