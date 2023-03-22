output "text_file" {
  value = file("${path.module}/foo.txt")
}

output "result" {
  value = local.result
}

output "tags" {
  value = local.tags
}

output "random_pet_name" {
  value = random_pet.main.id
}
