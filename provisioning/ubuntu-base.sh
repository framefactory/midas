#!/bin/bash

# Update repos
apt-get update && apt-get upgrade -y

# Install basic tools
apt-get install -y bzip wget curl vim nano git
