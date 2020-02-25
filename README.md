# Amazon Machine Image (AMI)
 
 An AMI provides the necessary information needed to launch an instance.
 In this repository, I am using Packer to create an Amazon AMI. 
 Follow the link https://packer.io/docs/builders/amazon.html for detailed usage.

## Requirements 

1. Install AWS CLI as the first step for this template. 
   Follow this link to install AWS CLI on Linux machine - https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html

2. Configure your AWS credentials using ```aws configure```
   Follow link https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html for detailed steps to setup a profile in your aws config

3. Create a copy of your own by forking the org by clicking on the `Fork` button (https://github.com/    varmavimalv-spring2020/ami). All your work must be done in your forked repo.

4. Clone the forked repository by clicking on the `clone or download` button and select `Use SSH` (For example, I cloned using `git@github.com:VishakaVarmaVimal/ami.git`)

5. Set your AWS access key and secret access as Environment Variables

6. The variables section in packer.json consists of all the information I have configured and will be needing to generate my AMI

7. The provisioners consists of a shell script which has the shell commands I need to get my application started in the instance.

8. DO NOT commit your AWS credentials to your git or store it anywhere unsafe.


## Validate your template

```packer validate packer.json```

(if you have given a JSON file with variables, use -)

```packer validate -var-file=./<filename>.json packer.json```


### Build your AMI

```packer build -var-file=./vars.json packer.json```

(if you have configured your variables as env variables, use -)

```packer build packer.json```

(or through command line -)

```
packer build \
-var 'aws_access_key=<enter access key>' \
-var 'aws_secret_key=<enter secret key>' \
-var 'aws_region=<enter aws region>' \
-var 'subnet_id=<enter subnet id>' \
packer.json
```

## configure CircleCI

Add your AWS configs to circleCI environment variables. https://circleci.com/docs/2.0/env-vars/

Build a congif.yml file with packer image that generates an AMI every time new changes are added to the repository. 

## References 

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html
https://packer.io/docs/builders/amazon.html
https://packer.io/docs/builders/amazon-ebs.html
https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html
https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html
https://aws.amazon.com/ec2/
