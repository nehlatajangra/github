module "new-bucket" {
    source = "../../module/bucket"
    bucket_name="new-bucket-instance"
    name="neha-bucket"
    Environment="dev"
    acl="private"
}
