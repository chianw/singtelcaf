# Test repository for  SingTel CAF
This is a sample code where Terraform assumes the identity of an application given specific permissions in Microsoft Graph API to be able to perform the following tasks:
- create a new security group
- assigns existing users as owner and member of the group
- creates a new service principal with a secret and assigns it as a member of the new group created
- assigns a built-in Azure AD role to the group
- creates an admin unit and puts the group into the admin unit

To run the code, replace client_id , client_secret and tenant_id in providers.tf with the correct values in your environment.

The permissions required by the service principal identity assumed by TF are below

![tf-app-permissions.png](https://github.com/chianw/singtelcaf/blob/main/tf-app-permissions.png)
