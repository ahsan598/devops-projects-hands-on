# Jenkins CI/CD Pipeline for Deploying Static Website


### 🎯 Objective
This project sets up a CI/CD pipeline using Jenkins to automate the deployment of a static website. The pipeline integrates GitHub, SonarQube, and Docker, and runs on an AWS EC2 instance.


### ⚙️ Tools & Technologies
- **Jenkins** – CI/CD automation
- **GitHub** – Source code repository
- **SonarQube** – Code quality analysis
- **Docker** – Containerization
- **AWS EC2** – Hosting Jenkins and deployed app


### 🔁 Workflow Overview
- Developer pushes code to GitHub
- Jenkins triggers build via webhook
- SonarQube analyzes code
- Docker image is built
- Image is deployed on EC2


![Project Diagram](https://github.com/ahsan598/deploying-website-using-jenkins/blob/main/jenkins-deploy-static-site.png)

---

### 🛠️ Step-by-Step Implementation

1. **Jenkins Setup on EC2**
```sh
# Install Java
sudo yum update -y
sudo yum install java-1.8.0-openjdk-devel -y

# Install Jenkins
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
```


2. **Docker Installation**
```sh
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
```


3. **SonarQube Setup**
```sh
docker pull sonarqube
docker run -d --name sonarqube -p 9000:9000 sonarqube
```
> Access at: `http://<EC2-IP>:9000`
>
> Generate token and configure project


4. **GitHub Repository Setup**
- Create and clone your repo:
    ```sh
    git clone https://github.com/your-username/your-repo.git
    cd your-repo
    ```

- Add:
  - **Dockerfile**
  - **Jenkinsfile**
  - Website source code (HTML/CSS/etc.) 


5. **Jenkins Configuration**
- GitHub Integration
  - Install **GitHub Integration Plugin**
  - Add **Webhook** in GitHub:
    ```sh
    http://<jenkins-ip>:8080/github-webhook/
    ```
- Create Pipeline Job
  - Create "**Pipeline**" job
  - In Pipeline Script, use your `Jenkinsfile` from the repo


6. **Dockerizing the App**
- Sample Dockerfile (in repo):
```sh
FROM nginx:alpine
COPY . /usr/share/nginx/html
```

- Build Docker Image (in Jenkinsfile):
```sh
docker build -t static-website .
```


7. **SonarQube Quality Gate**
- Use sonar-scanner in the **Jenkinsfile**
- Include token and project key from SonarQube
  Example:
    ```groovy
    withSonarQubeEnv('MySonarQube') {
        sh 'sonar-scanner'
    }
    ```


8. **Deployment to EC2**
Ensure:
   - EC2 has Docker
   - Security group allows traffic on required port (e.g., **8081**)

Deploy in Jenkinsfile:
```sh
docker run -d -p 8081:80 static-website
```


### ✅ Summary
This Jenkins-based CI/CD pipeline automates:
- Pulling code from GitHub
- Code quality analysis with SonarQube
- Docker image creation
- Deployment to EC2 instance

It's a simple, reproducible setup for deploying any static website using modern DevOps practices.
