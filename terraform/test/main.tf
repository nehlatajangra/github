module "new-bucket" {
    source = "../"
    bucket_name="new-bucket-instance"
    name="neha-bucket"
    Environment="dev"
    acl="private"
}
