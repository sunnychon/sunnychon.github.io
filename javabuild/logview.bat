@echo off
for /f %%i in (lnm.txt)  do (
set lnm=%%i
) 
cd logs
:logp
cls
type javabuilder%lnm%.log
title ####    ####
title #  #    #  #
title ####    ####
title     ####
title     #  #
title     ####
title lod
title ####    ####
title #  #    #  #
title ####    ####
title     ####
title     #  #
title     ####
title lod
title ####    ####
title #  #    #  #
title ####    ####
title     ####
title     #  #
title     ####
title lod
title ####    ####
title #  #    #  #
title ####    ####
title     ####
title     #  #
title     ####
title lod
title ####    ####
title #  #    #  #
title ####    ####
title     ####
title     #  #
title     ####
title lod
title ####    ####
title #  #    #  #
title ####    ####
title     ####
title     #  #
title     ####
title lod

goto logp
