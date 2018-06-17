# ftp-grunt on Kubernetes

# Create the secret

    cp ftp-credentials.env{.template,}

Edit ftp-credentials.env, then create the secret

    kubectl create secret generic ftp-credentials --from-env-file=ftp-credentials.env

# Select files / folders

Create a paths list according to the main readme, then

    kubectl create configmap ftp-paths-list --from-file=paths=paths-list.txt

# Run the job

    cp job.yml{.template,}

Edit job.yml as needed, then run the job

    kubectl create -f job.yml
