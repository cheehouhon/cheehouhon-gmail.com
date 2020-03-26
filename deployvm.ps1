###########################
###INSTANTIATE VARIABLES###
###########################

# Sets the vsphere to connect to
$vcenter_server = 'CHANGE ME TO THE NAME OF THE VCENTER'

# Sets the resource pool name 
$vm_resource_pool = 'CHANGE ME TO THE NAME OF THE RESOURCE POOL'

# Sets the data store name 
$vm_datastore = 'CHANGE ME TO THE NAME OF THE DATA STORE'

# Sets the Template name (THE VM TEMPLATE FOR CLONING)
$vm_template = 'CHANGE ME TO THE NAME OF THE VM TEMPLATE'

###########################
#########EXECUTION#########
###########################

# Asking for user credentials to login to vsphere
Write-Output ""
$user_name = Read-Host 'Username for vCenter?: '
$user_pass = Read-Host 'Password for vCenter?: '

# Log into vCenter
Connect-viserver $vcenter_server -user $user_name -password $user_pass

# Creating VMs, you can change 'computer' to any of the name you want for prefix
# change $vm_quantity from 1..20 to 1..x amount for the quantity of machines you want to create, this example is 20, and will create computer_1, computer_2 to computer_20
ForEach ($vm_quantity in 1..20) {New-VM -Name computer_$vm_quantity -VMHost $vm_host -Template $vm_template -ResourcePool $vm_resource_pool -Datastore $vm_datastore  -RunAsync}
