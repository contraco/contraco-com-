# contraco Asset Copy Script for Windows
# Copies files from old TLD sites to unified PHASE2 structure
# Target: D:\PHASE2-11ty-setup

Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  contraco Asset Copy Script" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# Target directory
$targetDir = "D:\PHASE2-11ty-setup"

# Check if target directory exists
if (-not (Test-Path $targetDir)) {
    Write-Host "❌ Target directory not found: $targetDir" -ForegroundColor Red
    Write-Host "   Please create it or copy PHASE2-UNIFIED folder there first." -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ Target directory found: $targetDir" -ForegroundColor Green
Write-Host ""

# Ask for old site paths
Write-Host "📁 Enter paths to your OLD contraco sites:" -ForegroundColor Yellow
Write-Host "   (Example: C:\old-sites\contraco-net)" -ForegroundColor Gray
Write-Host ""

$oldSites = @{}

$oldSites["net"] = Read-Host "contraco-net path"
$oldSites["de"] = Read-Host "contraco-de path"
$oldSites["kr"] = Read-Host "contraco-kr path"
$oldSites["ru"] = Read-Host "contraco-ru path"
$oldSites["com"] = Read-Host "contraco-com path"

Write-Host ""

# Validate paths
foreach ($tld in $oldSites.Keys) {
    if (-not (Test-Path $oldSites[$tld])) {
        Write-Host "❌ Path not found: $($oldSites[$tld])" -ForegroundColor Red
        exit 1
    }
}

Write-Host "✅ All paths validated" -ForegroundColor Green
Write-Host ""

# Create directory structure
Write-Host "📁 Creating directory structure..." -ForegroundColor Yellow

$dirs = @(
    "$targetDir\src\assets-shared",
    "$targetDir\src\assets-tld\net",
    "$targetDir\src\assets-tld\de",
    "$targetDir\src\assets-tld\kr",
    "$targetDir\src\assets-tld\ru",
    "$targetDir\src\assets-tld\com"
)

foreach ($dir in $dirs) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

Write-Host "✅ Directory structure created" -ForegroundColor Green
Write-Host ""

# Function to copy file if exists
function Copy-IfExists {
    param(
        [string]$Source,
        [string]$Destination
    )

    if (Test-Path $Source) {
        Copy-Item -Path $Source -Destination $Destination -Force
        Write-Host "  ✓ $(Split-Path $Source -Leaf)" -ForegroundColor Green
        return $true
    } else {
        Write-Host "  ⚠ $(Split-Path $Source -Leaf) not found (skipping)" -ForegroundColor Yellow
        return $false
    }
}

# Function to copy multiple files with wildcard
function Copy-Wildcard {
    param(
        [string]$SourcePattern,
        [string]$Destination
    )

    $files = Get-ChildItem -Path $SourcePattern -ErrorAction SilentlyContinue
    $count = 0

    foreach ($file in $files) {
        Copy-Item -Path $file.FullName -Destination $Destination -Force
        $count++
    }

    if ($count -gt 0) {
        Write-Host "  ✓ Copied $count files matching $(Split-Path $SourcePattern -Leaf)" -ForegroundColor Green
    } else {
        Write-Host "  ⚠ No files found matching $(Split-Path $SourcePattern -Leaf)" -ForegroundColor Yellow
    }

    return $count
}

Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "📦 COPYING SHARED ASSETS (from contraco-net)" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

$sharedSource = $oldSites["net"]
$sharedDest = "$targetDir\src\assets-shared"

Write-Host "Logos and graphics:" -ForegroundColor Yellow
Copy-IfExists "$sharedSource\Logo_rectangle.svg" $sharedDest
Copy-IfExists "$sharedSource\Logo_rectangle.png" $sharedDest
Copy-IfExists "$sharedSource\contraco_logo.png" $sharedDest
Copy-IfExists "$sharedSource\contraco_logo.svg" $sharedDest
Write-Host ""

Write-Host "Strategic pillar icons:" -ForegroundColor Yellow
Copy-IfExists "$sharedSource\strategic-clarity.svg" $sharedDest
Copy-IfExists "$sharedSource\technological-intelligence.svg" $sharedDest
Copy-IfExists "$sharedSource\psychological-depth.svg" $sharedDest
Write-Host ""

Write-Host "UI elements:" -ForegroundColor Yellow
Copy-IfExists "$sharedSource\arrow-right.svg" $sharedDest
Copy-IfExists "$sharedSource\checkmark.svg" $sharedDest
Write-Host ""

Write-Host "Favicons (shared across all TLDs):" -ForegroundColor Yellow
Copy-Wildcard "$sharedSource\favicon*.*" $sharedDest
Copy-Wildcard "$sharedSource\apple-touch-icon*.png" $sharedDest
Copy-Wildcard "$sharedSource\android-icon*.png" $sharedDest
Copy-Wildcard "$sharedSource\ms-icon*.png" $sharedDest
Copy-IfExists "$sharedSource\browserconfig.xml" $sharedDest
Copy-IfExists "$sharedSource\site.webmanifest" $sharedDest
Write-Host ""

Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "📦 COPYING TLD-SPECIFIC ASSETS" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

foreach ($tld in $oldSites.Keys) {
    Write-Host "📁 contraco-$tld:" -ForegroundColor Cyan

    $source = $oldSites[$tld]
    $dest = "$targetDir\src\assets-tld\$tld"

    # Yandex verification
    $yandexFiles = Get-ChildItem -Path "$source\yandex*.html" -ErrorAction SilentlyContinue
    if ($yandexFiles) {
        foreach ($file in $yandexFiles) {
            Copy-Item -Path $file.FullName -Destination $dest -Force
            Write-Host "  ✓ $($file.Name)" -ForegroundColor Green
        }
    } else {
        Write-Host "  ⚠ No Yandex verification file found" -ForegroundColor Yellow
    }

    # IndexNow key (any .txt file except robots.txt)
    $txtFiles = Get-ChildItem -Path "$source\*.txt" -ErrorAction SilentlyContinue |
                Where-Object { $_.Name -ne "robots.txt" }
    if ($txtFiles) {
        foreach ($file in $txtFiles) {
            Copy-Item -Path $file.FullName -Destination $dest -Force
            Write-Host "  ✓ $($file.Name) (IndexNow key)" -ForegroundColor Green
        }
    } else {
        Write-Host "  ⚠ No IndexNow key file found" -ForegroundColor Yellow
    }

    # CNAME
    Copy-IfExists "$source\CNAME" $dest

    # robots.txt
    Copy-IfExists "$source\robots.txt" $dest

    # sitemap.xml
    Copy-IfExists "$source\sitemap.xml" $dest

    Write-Host ""
}

Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "✅ ALL FILES COPIED!" -ForegroundColor Green
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

Write-Host "📊 Summary:" -ForegroundColor Yellow
Write-Host "   Shared assets    → $targetDir\src\assets-shared\" -ForegroundColor White
Write-Host "   TLD-specific     → $targetDir\src\assets-tld\{net,de,kr,ru,com}\" -ForegroundColor White
Write-Host ""

Write-Host "📋 Next steps:" -ForegroundColor Yellow
Write-Host "   1. Extract CSS from any old HTML file" -ForegroundColor White
Write-Host "      → Paste to: $targetDir\src\css\styles.css" -ForegroundColor Gray
Write-Host ""
Write-Host "   2. Verify JavaScript in: $targetDir\src\js\scripts.js" -ForegroundColor White
Write-Host "      (Already has logo fallback code)" -ForegroundColor Gray
Write-Host ""
Write-Host "   3. Open PowerShell in $targetDir" -ForegroundColor White
Write-Host "      Run: npm install" -ForegroundColor Gray
Write-Host ""
Write-Host "   4. Build all sites:" -ForegroundColor White
Write-Host "      Run: npm run build" -ForegroundColor Gray
Write-Host ""
Write-Host "   5. Test locally:" -ForegroundColor White
Write-Host "      Run: npm run serve:net" -ForegroundColor Gray
Write-Host ""

Write-Host "🎉 Asset copy complete! You're ready to build." -ForegroundColor Green
Write-Host ""

# Pause so user can read the output
Write-Host "Press any key to exit..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
