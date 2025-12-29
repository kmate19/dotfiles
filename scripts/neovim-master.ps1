# Save current directory
$curr_dir = Get-Location

function Abort($msg) {
    Write-Error "ERROR: $msg"
    exit 1
}

# Check dependencies
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Abort "git not found"
}

if (-not (Get-Command cmake -ErrorAction SilentlyContinue)) {
    Abort "cmake not found"
}

if (-not (Get-Command ninja -ErrorAction SilentlyContinue)) {
    Abort "ninja not found"
}

# Check CC (compiler) env variable
if (-not $env:CC) {
    Abort "C compiler (CC) not set"
}

# Create temp directory
$tmp = Join-Path $HOME ".tmp"
New-Item -ItemType Directory -Force -Path $tmp | Out-Null
Set-Location $tmp

# Clone repo
git clone https://github.com/neovim/neovim
Set-Location "neovim"

# Clean any old build directory
if (Test-Path "build") {
    Remove-Item -Recurse -Force "build"
}

# Configure and build
$installPrefix = Join-Path $HOME "neovim"
cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$installPrefix"
cmake --build build
cmake --install build

# Clean up
Set-Location $tmp
Remove-Item -Recurse -Force "neovim"

# Return to original directory
Set-Location $curr_dir
