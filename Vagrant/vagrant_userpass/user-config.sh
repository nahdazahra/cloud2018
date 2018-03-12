#!/usr/bin/env bash

useradd -d /home/awan -m -s /bin/bash awan
echo -e "buayakecil\nbuayakecil\n" | passwd "awan"
