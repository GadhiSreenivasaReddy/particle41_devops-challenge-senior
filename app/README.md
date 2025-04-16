The instructions provided outline two methods for working with a Docker image:

1. **Pull the image from Docker Hub**:
   Run the following command to directly pull the pre-built image:
   ```
   docker pull gadhisreenivasareddy/simpletimeservice:v1
   ```
    ```
   docker run -d -p 9593:5000 gadhisreenivasareddy/simpletimeservice:v1
   ```
    ```
      http://localhost:9593/
    ```

2. **Build the image locally**:
   Use the following steps:
   - Navigate into the directory:
     ```
     cd ./app
     ```
   - Build the Docker image locally with a chosen name and tag:
     ```
     docker build -t SimpleTimeService:v1 .
     ```
   - Run the Docker container locally with a newly created docker image:
      ```
      docker run -d -p 9593:5000 SimpleTimeService:v1 .
      ```
      ```
        http://localhost:9593/
      ```