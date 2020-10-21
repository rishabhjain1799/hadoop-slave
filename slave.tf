provider "aws" {
  region = "ap-south-1"
  profile = "rishabh"
}

resource "aws_instance" "web" {
  ami           = "ami-052c08d70def0ac62"
  instance_type = "t2.micro"
  key_name = "lw"
  security_groups = ["sg-0e55a9eba83e37729"]
  subnet_id = "subnet-1e3f5452" 

  tags = {
    Name = "slave-1"
  }
}

resource "aws_ebs_volume" "v1" {
  availability_zone = "ap-south-1b"
  size              =  30
  
  tags = {
    Name = "rishuv1"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.v1.id}"
  instance_id = "${aws_instance.web.id}"
  force_detach = true
}

resource "null_resource" "nullremote3"  {

depends_on = [
    aws_volume_attachment.ebs_att,
  ]


  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/risha/Downloads/lw.pem")
    host     = aws_instance.web.public_ip
  }

provisioner "remote-exec" {
    inline = [
      "sudo yum install git -y",
      "curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | sudo bash",
      "sudo yum install git-lfs  -y",
      "sudo git lfs install",
      "sudo git-lfs clone https://github.com/Anshika-Sharma-as/hadoopClusterhadoop.git  /hdfs",
      "cd  /hdfs",
      "sudo mv jdk-8u171-linux-x64.rpm  /home/ec2-user",
      "cd",
      "sudo rm -rf /hdfs",
      "sudo git-lfs clone https://github.com/Anshika-Sharma-as/hadoopCluster.git  /hdfs",
      "cd  /hdfs",
      "sudo mv hadoop-1.2.1-1.x86_64.rpm  /home/ec2-user",
      "cd",
      "sudo rm -rf /hdfs",
      "cd /home/ec2-user",
      "sudo rpm -ivf jdk-8u171-linux-x64.rpm",
      "sudo rpm -ivh hadoop-1.2.1-1.x86_64.rpm --force",
      "cd",
      "sudo mkdir /dn",
      "cd /etc/hadoop",
      "sudo rm -rf hdfs-site.xml core-site.xml",
      "cd",
      "sudo git clone https://github.com/rishabhjain1799/hadoop-slave.git  /hdfs",
      "cd /hdfs",
      "sudo mv hdfs-site.xml core-site.xml /etc/hadoop",
      "sudo hadoop datanode -format -force",
      "sudo hadoop-daemon.sh start datanode"
    ]
  }
}

# 2nd instance

resource "aws_instance" "web1" {
  ami           = "ami-052c08d70def0ac62"
  instance_type = "t2.micro"
  key_name = "lw"
  security_groups = ["sg-0e55a9eba83e37729"]
  subnet_id = "subnet-1e3f5452" 

  tags = {
    Name = "slave-2"
  }
}

resource "aws_ebs_volume" "v2" {
  availability_zone = "ap-south-1b"
  size              =  30
  
  tags = {
    Name = "rishuv2"
  }
}

resource "aws_volume_attachment" "ebs_att1" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.v2.id}"
  instance_id = "${aws_instance.web1.id}"
  force_detach = true
}

resource "null_resource" "nullremote4"  {

depends_on = [
    aws_volume_attachment.ebs_att1,
  ]


  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/risha/Downloads/lw.pem")
    host     = aws_instance.web1.public_ip
  }

provisioner "remote-exec" {
    inline = [
      "sudo yum install git -y",
      "curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | sudo bash",
      "sudo yum install git-lfs  -y",
      "sudo git lfs install",
      "sudo git-lfs clone https://github.com/Anshika-Sharma-as/hadoopClusterhadoop.git  /hdfs",
      "cd  /hdfs",
      "sudo mv jdk-8u171-linux-x64.rpm  /home/ec2-user",
      "cd",
      "sudo rm -rf /hdfs",
      "sudo git-lfs clone https://github.com/Anshika-Sharma-as/hadoopCluster.git  /hdfs",
      "cd  /hdfs",
      "sudo mv hadoop-1.2.1-1.x86_64.rpm  /home/ec2-user",
      "cd",
      "sudo rm -rf /hdfs",
      "cd /home/ec2-user",
      "sudo rpm -ivf jdk-8u171-linux-x64.rpm",
      "sudo rpm -ivh hadoop-1.2.1-1.x86_64.rpm --force",
      "cd",
      "sudo mkdir /dn",
      "cd /etc/hadoop",
      "sudo rm -rf hdfs-site.xml core-site.xml",
      "cd",
      "sudo git clone https://github.com/rishabhjain1799/hadoop-slave.git  /hdfs",
      "cd /hdfs",
      "sudo mv hdfs-site.xml core-site.xml /etc/hadoop",
      "sudo hadoop datanode -format -force",
      "sudo hadoop-daemon.sh start datanode"
    ]
  }
}

# 3rd Instance

resource "aws_instance" "web2" {
  ami           = "ami-052c08d70def0ac62"
  instance_type = "t2.micro"
  key_name = "lw"
  security_groups = ["sg-0e55a9eba83e37729"]
  subnet_id = "subnet-1e3f5452" 

  tags = {
    Name = "slave-3"
  }
}

resource "aws_ebs_volume" "v3" {
  availability_zone = "ap-south-1b"
  size              =  30
  
  tags = {
    Name = "rishuv3"
  }
}

resource "aws_volume_attachment" "ebs_att2" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.v3.id}"
  instance_id = "${aws_instance.web2.id}"
  force_detach = true
}

resource "null_resource" "nullremote5"  {

depends_on = [
    aws_volume_attachment.ebs_att2,
  ]


  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/risha/Downloads/lw.pem")
    host     = aws_instance.web2.public_ip
  }

provisioner "remote-exec" {
    inline = [
      "sudo yum install git -y",
      "curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | sudo bash",
      "sudo yum install git-lfs  -y",
      "sudo git lfs install",
      "sudo git-lfs clone https://github.com/Anshika-Sharma-as/hadoopClusterhadoop.git  /hdfs",
      "cd  /hdfs",
      "sudo mv jdk-8u171-linux-x64.rpm  /home/ec2-user",
      "cd",
      "sudo rm -rf /hdfs",
      "sudo git-lfs clone https://github.com/Anshika-Sharma-as/hadoopCluster.git  /hdfs",
      "cd  /hdfs",
      "sudo mv hadoop-1.2.1-1.x86_64.rpm  /home/ec2-user",
      "cd",
      "sudo rm -rf /hdfs",
      "cd /home/ec2-user",
      "sudo rpm -ivf jdk-8u171-linux-x64.rpm",
      "sudo rpm -ivh hadoop-1.2.1-1.x86_64.rpm --force",
      "cd",
      "sudo mkdir /dn",
      "cd /etc/hadoop",
      "sudo rm -rf hdfs-site.xml core-site.xml",
      "cd",
      "sudo git clone https://github.com/rishabhjain1799/hadoop-slave.git  /hdfs",
      "cd /hdfs",
      "sudo mv hdfs-site.xml core-site.xml /etc/hadoop",
      "sudo hadoop datanode -format -force",
      "sudo hadoop-daemon.sh start datanode"
    ]
  }
}
