# Multi-Distribution Apache Web Server Deployment with Remote Execution

## Project Scenario

A large e-commerce company operates an online marketplace that receives a significant amount of traffic. To ensure high availability and optimal performance, the company decides to deploy its web application across multiple Linux EC2 instances using different Linux distributions. The goal is to leverage the strengths of each distribution and enhance overall system reliability.

To achieve this, they employ a scripted approach for deploying the Apache web server on each instance, adapting the script based on the underlying Linux distribution. The provided script [here](./remote_websetup/multios_websetup.sh) serves as a template for the deployment process, with modular functions for package installation, service management, and artifact deployment.

## Purpose
In this capstone project, you will showcase your advanced skills in Linux administration and shell scripting by deploying an Apache web server on multiple Linux EC2 instances with different distributions. This project focuses on creating a scalable and resilient web application infrastructure using Amazon Linux, Ubuntu, Debian and CentOS, with an emphasis on remote execution.