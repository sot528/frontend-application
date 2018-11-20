#!/usr/bin/env bash

yarn build
aws s3 cp .nuxt/dist/ s3://$DIST_S3_BUCKET_NAME/d/nuxt/dist --recursive
aws s3 cp app/static/favicon.ico s3://$DIST_S3_BUCKET_NAME/d/nuxt/dist/
aws s3 cp app/static/OGP_1200×630.png s3://$DIST_S3_BUCKET_NAME/d/nuxt/dist/
aws s3 cp app/static/icon_user_noimg.png s3://$DIST_S3_BUCKET_NAME/d/nuxt/dist/
aws s3 cp app/static/touch-icon.png s3://$DIST_S3_BUCKET_NAME/d/nuxt/dist/
aws s3 cp app/static/header_logo_original.png s3://$DIST_S3_BUCKET_NAME/d/nuxt/dist/

aws s3 cp app/static/topic/topic_business.png s3://$DIST_S3_BUCKET_NAME/d/nuxt/dist/topic/
aws s3 cp app/static/topic/topic_crypto.png s3://$DIST_S3_BUCKET_NAME/d/nuxt/dist/topic/
aws s3 cp app/static/topic/topic_gosyuin.png s3://$DIST_S3_BUCKET_NAME/d/nuxt/dist/topic/
aws s3 cp app/static/topic/topic_gourmet.png s3://$DIST_S3_BUCKET_NAME/d/nuxt/dist/topic/
aws s3 cp app/static/topic/topic_illustration-comic.png s3://$DIST_S3_BUCKET_NAME/d/nuxt/dist/topic/
yarn sls:deploy
