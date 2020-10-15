#Packer

Templates are JSON files that configure the various components of Packer in order to create one or more machine images. Templates are portable, static, and readable and writable by both humans and computers. This has the added benefit of being able to not only create and modify templates by hand, but also write scripts to dynamically create or modify templates.

Templates are given to commands such as `packer build`, which will take the template and actually run the builds within it, producing any resulting machine images.

Template here contains:

builders (required) is an array of one or more objects that defines the builders that will be used to create machine images for this template, and configures each of those builders. For more information on how to define and configure a builder, read the sub-section on configuring builders in templates.

provisioners (optional) is an array of one or more objects that defines the provisioners that will be used to install and configure software for the machines created by each of the builders. If it is not specified, then no provisioners will be run. For more information on how to define and configure a provisioner, read the sub-section on configuring provisioners in templates.

variables (optional) is an object of one or more key/value strings that defines user variables contained in the template. If it is not specified, then no variables are defined. For more information on how to define and use user variables, read the sub-section on user variables in templates.

We run the following commands in our yml file to build our AMI

- name: Download Packer
        run: |
          wget -q https://releases.hashicorp.com/packer/1.4.2/packer_1.4.2_linux_amd64.zip
          unzip packer*.zip
          chmod +x packer

- name: Validate Packer Template
        run: ./packer validate ami.json

- name: Build AMI
        run: |
          ./packer build \
          -var "aws_region=${{ secrets.AWS_REGION }}" \
          -var "aws_access_key=${{ secrets.AWS_ACCESS_KEY_ID }}" \
          -var "aws_secret_key=${{ secrets.AWS_SECRET_ACCESS_KEY }}" \
          ami.json
