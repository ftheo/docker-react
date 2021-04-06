To deploy to Google App Egnine
gcloud config configurations list
gcloud config configurations activate k8-learning

gcloud app deploy


To run production locally

docker build .
docker run -p 3000:80 -it <the container>


# TO delete
gcloud config configurations delete k8-learning
Stop the instances in google app engine ui


# See instances of the service
gcloud app instances list
# Connect to one

