# s3 = Aws::S3::Resource.new(
#  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY_ID']),
#  region: 'us-west-1'
# )
# S3_BUCKET = s3.bucket(ENV['S3_BUCKET'])

# obj =S3_BUCKET.object("1/F14.jpg")
# obj.upload_file('/Users/sammydallal/desktop/F14.jpg', acl:'public-read')

# puts obj.public_url