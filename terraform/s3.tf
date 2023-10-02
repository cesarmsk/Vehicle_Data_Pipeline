# S3 bucket for raw data storage
resource "aws_s3_bucket" "data_lake" {
  bucket = "s3-vehicles-bucket"
}

