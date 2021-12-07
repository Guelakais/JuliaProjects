#!/usr/bin/env julia
using Plots; gr()

a, b, c = 13, 5, 4

d = a+b+c

e, f, g = a/d, b/d, c/d
fruit = ["Ausgefallen","Durchwachsen_stattgefunden","Planmäßig_Stattgefunden"]
bushels = [e, f, g]

pie(fruit, bushels)