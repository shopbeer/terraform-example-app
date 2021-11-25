#!/bin/bash
sleep 3 && curl -s -I $(terraform output --raw stg_app_public_dns) || echo "x"