# Build a Compose File For a Multi-Container Project

- Building a basic compose file for a Drupal content management system website and uses a mariadb database running behind it.
- Adding a themes template so we can change the template of the site.
- I have created a `docker-compose file` and a `Dockerfile` for this project.
1. `docker-compose file` - Defines the services that make up your app in so they can be run together in an isolated environment.
2. `Dockerfile` - Defines your app’s environment with a so it can be reproduced anywhere.

### Project Overview:
##### Before applying theme to drupal
![Project Diagram](https://github.com/ahsan598/docker-compose/blob/main/before-theme-applied.jpg)
##### After applying theme to drupal
![Project Diagram](https://github.com/ahsan598/docker-compose/blob/main/after-theme-applied.jpg) 


## Dockerfile

- First I need to build a custom Dockerfile in this directory, with docker image `drupal:10`
- Then RUN apt package manager command to install git: `apt-get update && apt-get install -y git`
- Here we are doing a clean-up cache which was created after apt install with `rm -rf /var/lib/apt/lists/*`
- Then change working directory for the themes template `WORKDIR /var/www/html/themes`
- Then I use particular git repo to clone the theme with:
`RUN git clone --branch 8.x-4.x --single-branch --depth 1 https://git.drupalcode.org/project/bootstrap.git`
- We need to change permissions on files and don't want to use another image layer to do that (it creates size bloat).
This drupal container runs as www-data user but the build actually runs as root, so often we have to do things like `chown` to change file owners to the proper user: `chown -R www-data:www-data bootstrap`
- Then, just to be safe, change the working directory back to its default (from drupal image) at `/var/www/html`
- Docker Hub documentation to figure out the right environment and volume settings to store Drupal unique data

## Compose File

- We're going to build a custom image in this compose file for drupal service.
- Rename image to `custom-drupal` as we want to make a new image based on the official `drupal:10`.
- We want to build the default Dockerfile in this directory by adding `build: .` to the `drupal` service.
- When we add a build + image value to a compose service,
it knows to use the image name to write to in our image cache, rather then pull from Docker Hub.
- For the `mariadb:10.9` service, also add a volume for `drupal-data:/var/lib/mysql/data` so the database will persist across Compose restarts.

## Start Containers, Configure Drupal

- Start containers like `docker compose up`, configure Drupal web install.
- After site comes up, click on `Appearance` in top bar, and notice a new theme called`Bootstrap` is there. That's the one we added with our custom Dockerfile.
- Click `Install and set as default`.
Then click `Back to site` (in top left) and the site interface should look different.
You've successfully installed and activated a new theme in your own custom image without installing anything on your host other than Docker!
- If we exit (ctrl-c) and then `docker-compose down` it will delete containers,
but not the volumes, so on next `docker-compose up` everything will be as it was.




##### Learned from the course Docker Mastery: with Kubernetes + Sawrn by @bretfisher, Udemy