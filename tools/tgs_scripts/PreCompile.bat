@echo off

FOR /F "tokens=* USEBACKQ" %%F IN (`powershell -NoLogo -ExecutionPolicy Bypass -File "get_dependencies.ps1"`) DO (
SET RUST_G_VERSION=%%F
)

SET "original_dir=%CD%"
cd "%~1"

::set "RUST_G_VERSION=3.1.0"

cd "%original_dir%"
IF NOT exist "rust-g"\ (
  echo "Cloning rust-g..."
  git "clone" "https://github.com/tgstation/rust-g"
  cd "rust-g"
  rustup "target" "add" "i686-pc-windows-msvc"
) ELSE (
  echo "Fetching rust-g..."
  cd "rust-g"
  git "fetch"
  rustup "target" "add" "i686-pc-windows-msvc"
)
echo "Deploying rust-g..."
git "checkout" "%RUST_G_VERSION%"
set PKG_CONFIG_ALLOW_CROSS=1
cargo build --release --target=i686-pc-windows-msvc
move "%CD%\target\i686-pc-windows-msvc\release\rust_g.dll" "%~1/rust_g.dll"
cd ".."
echo "Compiling tgui..."
cd "%~1"
set TG_BOOTSTRAP_CACHE=%original_dir%
set "CBT_BUILD_MODE=TGS"
tools/bootstrap/node.bat tools/build/build.js
