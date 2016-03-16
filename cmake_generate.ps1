Write-Host "Generating Visual Studio solution and project files..." 
& cmake -G "Visual Studio 12 2013 Win64" -DBOOST_ROOT:STRING=C:\Boost -DBOOST_VER:STRING=1.55.0 ./