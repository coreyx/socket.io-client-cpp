Write-Host "Generating Visual Studio solution and project files..." 
& cmake -G "Visual Studio 14 2015 Win64" -DBOOST_ROOT:STRING=C:\Boost -DBOOST_VER:STRING=1.55.0 ./