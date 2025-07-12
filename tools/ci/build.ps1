if(!(Test-Path -Path "C:/byond")){
    bash tools/ci/download_byond.sh
    [System.IO.Compression.ZipFile]::ExtractToDirectory("C:/byond.zip", "C:/")
    Remove-Item C:/byond.zip
}

bash tools/ci/install_node.sh
<<<<<<< HEAD
bash tools/build/build.sh -Werror
=======
bash tools/build/build -Werror
>>>>>>> fe5556d2dc (up ports a bunch of TGS commands (#17961))

exit $LASTEXITCODE
