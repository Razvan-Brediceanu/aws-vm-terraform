# aws-vm-terraform

A small project to learn Terraform by managing an existing AWS EC2 instance.
Instead of creating a new VM, I imported one I already had and brought it under
Terraform control.

## What's in here

- `main.tf` – provider setup, the EC2 instance, and the `import` block
- `variables.tf` – inputs with descriptions and validation
- `outputs.tf` – instance ID and IPs
- `eip.tf` – optional Elastic IP
- `docker.tf` – optional Docker install script (user_data)
- `terraform.tfvars.example` – copy to `terraform.tfvars` and fill in your values

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
terraform apply
```

Check the plan before applying. It should say **import**, not replace. If
Terraform wants to replace the instance, the config doesn't match the real one.

## Elastic IP and Docker

I set both of these up while learning, then destroyed them because Elastic IPs
cost money even when idle. The files are still here as a reference.

## What I learned

- Importing is stricter than creating: the config has to match reality or
  Terraform will try to rebuild the resource.
- Always read the plan. It's the only thing between you and deleting a real server.
- State files and `.tfvars` contain sensitive stuff, so they stay out of git.
- Tear things down when you're done. Idle resources still bill.

## Cleanup

```bash
terraform destroy
```

Note: the root volume survives destroy (`delete_on_termination = false`), so
delete it manually if you don't need it.
