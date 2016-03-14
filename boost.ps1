# Derived from http://help.appveyor.com/discussions/questions/455-boost-lib-depency
# and https://github.com/helios-labs-shared/socket.io-client-cpp/blob/master/INSTALL.md#boost_setup
Add-Type -assembly "system.io.compression.filesystem"

# URL to download boost 1.59 shortened with bit.ly
$download_url = "http://bit.ly/1pk71MX"
$boost_version = "boost_1_55_0"
$filename = $boost_version + ".zip"
$boost_src_dir = "C:\Boost_Src\"
$boost_zip_path = $boost_src_dr + $filename
$boost_src = $boost_src_dir + $boost_version
$boost_dir = "C:\Boost"

Write-Host "Downloading boost.." 
(new-object net.webclient).DownloadFile($download_url, $boost_zip_path) 
Write-Host "Extracting archive.." 
[io.compression.zipfile]::ExtractToDirectory($boost_zip_path, $boost_src_dir) 
Set-Location $boost_src
Write-Host "Building boost.." 
& ".\bootstrap.bat" 
# Boost build command from original file:
# & .\b2 address-model=64 toolset=msvc-14.0 windows-api=desktop variant=debug link=static threading=multi runtime-link=shared --with-log
# Command from https://github.com/helios-labs-shared/socket.io-client-cpp/blob/master/INSTALL.md#boost_setup
& .\bjam install --prefix=$boost_dir --with-system --with-date_time --with-random link=static runtime-link=shared threading=multi address-model=64 --toolset=msvc-12.0 debug release