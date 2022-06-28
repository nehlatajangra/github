
output "name" {
  value = "${module.new-bucket.bucket_id}"
}
output "ac" {
  value = "${module.new-bucket.acl}"
}