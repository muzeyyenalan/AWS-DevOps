# Hands-on ECS-01 : Deploying a docker image located in ECR with ECS  Fargate

Purpose of the this hands-on training is to give basic understanding of how to use AWS Elastic Container Service (ECS) and how to deploy docker images using ECS Fargate

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- create and configure AWS ECR from the AWS Management Console.

- demonstrate how to build a docker image with Dockerfile.

- learn AWS Fargate concept

- deploy docker image with AWS ECS Fargate

## Outline

- Part 1 - Launching a Docker Machine Instance 

- Part 2 - Creating Repositories on AWS ECR and ECR operations  

- Part 3 - Creating Elastic Load Balancer for ECS

- Part 4 - Creating ECS Clusters 

- Part 5 - Creating ECS Task Definitions 

- Part 6 - Creating ECS Service

- Part 7 - Cleaning

-/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/-

## Part 1 Launching a Docker Machine Instance 

### Step 1: lauching an Docker Compose instance 

- Launch a Compose enabled Docker machine on Amazon Linux 2 AMI with security group allowing HTTP and SSH connections using the terraform file. 

- Make SSH Connection to the Docker instance with VSCode.

### Step 2: Preparing the essential files for Docker Compose instance 

- connect to the Docker Compose instance "with VSCode" and open folders of EC2 and upload applications file.

 ```bash
wget https://github.com/awsdevopsteam/jenkins-first-project/raw/master/to-do-app-nodejs.tar
 ```
- Extract the `to-do-app-nodejs.tar` file 

```bash
tar -xvf to-do-app-nodejs.tar
ls 
```

- You will see "to-do-app-nodejs.tar" and "to-do-app-nodejs". 

- Enter the "/to-do-app-nodejs/" directory. And create "Dockerfile" via vi editor or with VScode right click on to-do-app-nodejs foleder and create file.

```bash
cd to-do-app-nodejs/
vi Dockerfile

press "i" to edit.
```

- Paste a following content into Dockerfile

```dockerfile
FROM node:12-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "/app/src/index.js"]
```
- Press "ESC" and ":wq " to save.

-/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/-

## Part 2 - Creating Repositories on AWS ECR and ECR operations  

### Step 1 - Creating Repositories on AWS ECR

- Go to the `Amazon Elastic Container Registry` service 

- Click on `Repositories` on ECR section,

- Click on `Create Repository`

- Enter a repository name as. `student1-repo/todo-app` 

- Explain `tag immutability` and leave it as default.

- Create the repository 

### Step 2 - Creating and attaching IAM role to the EC2 for ECR

- Go to AWS IAM and Select Roles and click on Create Role:

```
Select type of trusted entity   : AWS Services
Choose a use case               : EC2
Permissions                     :
    - AWSAppRunnerServicePolicyForECRAccess
    - EC2InstanceProfileForImageBuilderECRContainerBuilds

Role Name                       : EC2FullAccessECR
```
- Go to EC2 console and select Ec2 instance
- Click on Actions---> Security---> Modify IAM role
- Add `EC2FullAccessECR`

### Step 3 - Managing Docker Images using AWS ECR as Repository

- Go to AWS ECR console select `student1-repo/todo-app`

- At the right top of the click on `View push command` and follow the instructions on terminal. be sure that you are  `inside the to-do-app-nodejs folder`

    a. Retrieve an authentication token and authenticate your Docker client to your registry.
```
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 046402772087.dkr.ecr.us-east-1.amazonaws.com
```

    b. For information on building a Docker file from scratch see the instructions here . You can skip this step if your image is already built:
```
docker build -t student1-repo/todo-app .
```

    c. After the build completes, tag your image so you can push the image to this repository:
```
docker tag student1-repo/todo-app:latest 046402772087.dkr.ecr.us-east-1.amazonaws.com/student1-repo/todo-app
```

    d. Run the following command to push this image to your newly created AWS repository:
```
docker push 046402772087.dkr.ecr.us-east-1.amazonaws.com/student1-repo/todo-app:latest
```
-/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/-

## Part 3 - Creating Elastic Load Balancer for ECS

### Step 1- Creating ALB Sec Group

- Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/.

- Choose Security Groups on the left-hand menu,

- Click the "Create Security Group" tab.

```text
Security Group Name  : ALBSecGroup
Description         : ALB Security Group
VPC                 : Default VPC
Inbound Rules:
    - Type: SSH----> Source: Anywhere
    - Type: ALL TCP ---> Source: Anywhere
Outbound Rules: Keep it as it is
Tag:
    - Key   : Name
      Value : ALBSECGroup
```

### Step 2 - Create a target group

- Go to `Target Groups` section under the Load Balancing part on left-hand side and click it.

- Click `Create Target Group` button.

- Basic configuration.

```text
Choose a target type    : IP **** This is important . Since we are   
                          gonna use Fargate we need to select "IP" option rather than Instance

Target Groups Name      : ECSTargetGroup
Protocol                : HTTP
Port                    : 3000
VPC                     : Default
Protocol version        : HTTP1
```

- Health checks

```text
Health check protocol   : HTTP
Health check path       : /
```

- Advance Health check settings.

```text
Port                    : Traffic port
Healthy treshold        : 5
Unhealthy treshold      : 2
Timeout                 : 5 seconds
Interval                : 10 seconds
Succes codes            : 200
```

- Tags

```text
Key                     : Name
Value                   : MyTargetGroup
```

- Click next.

- Select `NO` instances to the target group.

- Click `Create target group` button.

### Step 3 - Creating Application Load Balancer together with Target Group

- Go to the Load Balancing section on left-hand menu and click `Load Balancers`.

- Tap `Create Load Balancer` button.

- Click `Create` button inside the `Application Load Balancer` section.

- Basic configuration

```text
Load Balancer Name     : ECS ALB
Scheme                 : Internet-facing
IP address type        : IPv4
```

- Network mapping

```text
VPC          : Default VPC
Mappings     : Select all AZ's
```

- Security groups

```text
Security groups  : Remove Default SG and select ALBSecGroup
```

- Listeners and routing
```text
Protocol       : HTTP
Port           : 80
Default action : Forward to ECSTargetGroup
```

- Keep rest as is

- Review if everything is ok, and then click the `Create load balancer` button

```text
Successfully created load balancer!
```
-/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/-

## Part 4 - Creating ECS Clusters 

- Go to ECS services
- Select Cluster and Click on Create Cluster 
- Select Cluster Template: `Networking only` for Fargate and Click next

```text
Cluster name :FirstCluster
Networking   : Keep it as (unchecked)
Tags: 
    Key:name,  Value:Osvaldo
```

- Click on create Cluster
- Show the newly created cluster 

## Part 5 - Creating Task Definition:

- Select the Task Definition from left hand menu

- Click on `Create new Task Definition`

- Select launch type compatibility as `Fargate` and click on next Step

- Configure task and container definitions:

```text
Task definition name: firsttask

Operating system family:Linux

Keep the rest as is.
```
- Task execution IAM role: Keep it as is

- Task size:

`Task memory (GB)`: 1 GB
`Task CPU (vCPU)` : 0.5 vCPU

- Container definitions:

Click on---->>>>> Add container :
```text

          - Container name  : Firstcontainer
          - Image           : Copy the  the URI of ECR repo and paste  
                              046402772087.dkr.ecr.us-east-1.amazonaws.com/student1-repo/todo-app:latest  

         - Memory Limits (MiB)       : 1024MB
         - Port mappings             : 3000

```
Click on Add.

## Part 6 - Creating Services:

- Click On Cluster  from left hand menu
- Select newly created Cluster 
- Select `Service` and Click on Create
- Configure service: 

 ```
 Launch type                : Fargate
 Operating system family    : Linux
 Task Definition            : firsttask
 Platform version           : latest
 Cluster                    : FirstCluster
 Service name               : newservices
 Number of tasks            : 1 

Keep it as..
 ```
Click on next step:

- Configure network: 

```
Cluster VPC: default VPC
Subnets: Select all default subnets
Security groups: Click on  Edit.
                - Crate new rule:
                   Type  : All TCP
                   Source: SourceGroup---->ALBSecGroup 

Auto-assign public IP: yes

Keep the rest as is..
 ```

- Load balancing
  ---> Application Load Balancer --> ECS ALB

- Container to load balance: 

```
  Click on "Add to LoadBalancer"
  Production listener port: HTTP:80
  Target group name: ECSTargetGroup

  Keep the rest as is...
```
- Click on next step 
- Set Auto Scaling (optional): NO
- Click on create

- COpy the ALB url and past on browser.

- Delete the image and repository of `student1-repo/todo-app` from AWS ECR Console.
-/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/--/-

- Deregister the task Def.
- Delete the service and Task Definition
- Delete ALB

