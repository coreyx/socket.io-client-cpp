# Derived from http://help.appveyor.com/discussions/questions/455-boost-lib-depency
# and https://github.com/helios-labs-shared/socket.io-client-cpp/blob/master/INSTALL.md#boost_setup
Add-Type -assembly "system.io.compression.filesystem"

Write-Host "Downloading boost.." 
# URL to download boost 1.59 shortened with bit.ly
(new-object net.webclient).DownloadFile("http://bit.ly/1pk71MX", "C:\Projects\Boost_Src\boost_1_55_0.zip") 
Write-Host "Extracting archive.." 
[io.compression.zipfile]::ExtractToDirectory("C:\Projects\Boost_Src\boost_1_55_0.zip", "C:\Projects\Boost_Src\") 
Set-Location "C:\Projects\\boost_1_55_0" 
Write-Host "Building boost.." 
& ".\bootstrap.bat" 
# Boost build command from original file:
# & .\b2 address-model=64 toolset=msvc-14.0 windows-api=desktop variant=debug link=static threading=multi runtime-link=shared --with-log
# Command from https://github.com/helios-labs-shared/socket.io-client-cpp/blob/master/INSTALL.md#boost_setup
& .\bjam install --prefix="C:\Boost" --with-system --with-date_time --with-random link=static runtime-link=shared threading=multi address-model=64 --toolset=msvc-12.0 debug release