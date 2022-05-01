#!/bin/sh
nix build .#hm.piyush.activationPackage
./result/activate
