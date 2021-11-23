


# preface

minio is an open source storage client that uses aws s3 compatible apis for storage and retrieval. it could be used as a cloud alternative.

it can be used to store images, logs, videos and other files. max storage size right now is 5TB





to deploy a minio service locally make sure you have docker installed in your systema and run docker-compose up -d from within the same folder where the docker-compose.yml file is placed

the docker compose file contains two environment files that set the default admin       
MINIO_ROOT_USER: minio
MINIO_ROOT_PASSWORD: minio123

and also maps the ports to your local computer ports.


Now in order to do operations ( like view and provide access to the bucket) install the minio client mc.

this can be installed from brew with 
```brew install mc```

now the mc commands will be available.
first thing we need to do is create a user with which we can access the minio instance

```mc alias set <ALIAS> <YOUR-S3-ENDPOINT> [YOUR-ACCESS-KEY] [YOUR-SECRET-KEY] [--api API-SIGNATURE]

with the above format

here alias will be used whenever we want to access that particular instance with that particular user ( basically switching accounts and accessing stuff )
```mc alias set minio_deployment http://localhost user_username user_password

now to create a new user:

```mc admin user add minio_deployment new_user new_user_pass

now set the policy for the user with 

```mc admin policy set minio_deployment readwrite user=new_user

you can list service space for minio with 

```mc ls minio_deployment

to create a new bucket use the mb command
the format is mc mb alias/bucket_name

```mc mb minio_deployment/test_bucket




