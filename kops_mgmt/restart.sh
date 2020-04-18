#!/usr/bin/env bash

kops update cluster --yes
kops rolling-update cluster