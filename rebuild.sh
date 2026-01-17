#! /bin/sh

sudo nixos-rebuild switch --flake ./#default --impure
home-manager switch --flake ./#default
