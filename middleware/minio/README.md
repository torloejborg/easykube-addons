# MinIO

https://min.io/

This addon provides a single non replicated minio storage server for testing and development purposes.

MinIO is compatible with Amazon S3, and thus is useful for locally developing software that uses our in-house Hitachi S3 storage solution.

When installed, you can access these URL's

* https://minio-ui.localtest.me - The Admin console where buckets are configured

* https://minio.localtest.me - The API endpoint you will use in your software.

### Usage

To begin, log into the console with the credentials **admin** / **adminadmin**

From the console, configure a bucket, and an access key and secret. That should be pretty much cover everything to get started. 