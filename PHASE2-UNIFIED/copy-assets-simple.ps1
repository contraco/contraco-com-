# contraco Asset Copy Script - Simple Version
# Edit the paths below, then run this script

# ═══════════════════════════════════════════════════════════
# EDIT THESE PATHS TO YOUR OLD SITE LOCATIONS
# ═══════════════════════════════════════════════════════════

$oldSiteNet = "C:\path\to\contraco-net"    # ← CHANGE THIS
$oldSiteDe  = "C:\path\to\contraco-de"     # ← CHANGE THIS
$oldSiteKr  = "C:\path\to\contraco-kr"     # ← CHANGE THIS
$oldSiteRu  = "C:\path\to\contraco-ru"     # ← CHANGE THIS
$oldSiteCom = "C:\path\to\contraco-com"    # ← CHANGE THIS

# Target directory (where this script is located)
$targetDir = $PSScriptRoot

# ═══════════════════════════════════════════════════════════
# DO NOT EDIT BELOW THIS LINE
# ═══════════════════════════════════════════════════════════

Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  contraco Asset Copy Script" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
Write-Host "Target: $targetDir" -ForegroundColor Yellow
Write-Host ""

# Validate paths
$allValid = $true

if (-not (Test-Path $oldSiteNet)) {
    Write-Host "❌ contraco-net path not found: $oldSiteNet" -ForegroundColor Red
    $allValid = $false
}

if (-not (Test-Path $oldSiteDe)) {
    Write-Host "❌ contraco-de path not found: $oldSiteDe" -ForegroundColor Red
    $allValid = $false
}

if (-not (Test-Path $oldSiteKr)) {
    Write-Host "❌ contraco-kr path not found: $oldSiteKr" -ForegroundColor Red
    $allValid = $false
}

if (-not (Test-Path $oldSiteRu)) {
    Write-Host "❌ contraco-ru path not found: $oldSiteRu" -ForegroundColor Red
    $allValid = $false
}

if (-not (Test-Path $oldSiteCom)) {
    Write-Host "❌ contraco-com path not found: $oldSiteCom" -ForegroundColor Red
    $allValid = $false
}

if (-not $allValid) {
    Write-Host ""
    Write-Host "⚠️  Please edit this script and set the correct paths at the top!" -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
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
    "$targetDir\src\assets-tld\com",
    "$targetDir\src\css",
    "$targetDir\src\js"
)

foreach ($dir in $dirs) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

Write-Host "✅ Directories created" -ForegroundColor Green
Write-Host ""

# Function to copy file if exists
function Copy-IfExists {
    param(
        [string]$Source,
        [string]$Destination,
        [string]$Description = ""
    )

    if (Test-Path $Source) {
        Copy-Item -Path $Source -Destination $Destination -Force
        if ($Description) {
            Write-Host "  ✓ $Description" -ForegroundColor Green
        } else {
            Write-Host "  ✓ $(Split-Path $Source -Leaf)" -ForegroundColor Green
        }
        return $true
    } else {
        if ($Description) {
            Write-Host "  ⚠ $Description not found (skipping)" -ForegroundColor DarkGray
        } else {
            Write-Host "  ⚠ $(Split-Path $Source -Leaf) not found" -ForegroundColor DarkGray
        }
        return $false
    }
}

# Function to copy multiple files
function Copy-Wildcard {
    param(
        [string]$SourcePattern,
        [string]$Destination,
        [string]$Description = ""
    )

    $files = Get-ChildItem -Path $SourcePattern -ErrorAction SilentlyContinue
    $count = 0

    foreach ($file in $files) {
        Copy-Item -Path $file.FullName -Destination $Destination -Force
        $count++
    }

    if ($count -gt 0) {
        if ($Description) {
            Write-Host "  ✓ $Description ($count files)" -ForegroundColor Green
        } else {
            Write-Host "  ✓ Copied $count files" -ForegroundColor Green
        }
    } else {
        if ($Description) {
            Write-Host "  ⚠ $Description not found" -ForegroundColor DarkGray
        }
    }

    return $count
}

Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "📦 STEP 1: COPYING SHARED ASSETS" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

$sharedDest = "$targetDir\src\assets-shared"

Write-Host "Logos and graphics:" -ForegroundColor Yellow
Copy-IfExists "$oldSiteNet\Logo_rectangle.svg" $sharedDest
Copy-IfExists "$oldSiteNet\Logo_rectangle.png" $sharedDest
Copy-IfExists "$oldSiteNet\contraco_logo.png" $sharedDest
Copy-IfExists "$oldSiteNet\contraco_logo.svg" $sharedDest
Write-Host ""

Write-Host "Strategic pillar icons:" -ForegroundColor Yellow
Copy-IfExists "$oldSiteNet\strategic-clarity.svg" $sharedDest
Copy-IfExists "$oldSiteNet\technological-intelligence.svg" $sharedDest
Copy-IfExists "$oldSiteNet\psychological-depth.svg" $sharedDest
Write-Host ""

Write-Host "UI elements:" -ForegroundColor Yellow
Copy-IfExists "$oldSiteNet\arrow-right.svg" $sharedDest
Copy-IfExists "$oldSiteNet\checkmark.svg" $sharedDest
Write-Host ""

Write-Host "Favicons (51 files):" -ForegroundColor Yellow
$faviconCount = 0
$faviconCount += Copy-Wildcard "$oldSiteNet\favicon*.*" $sharedDest "favicon files"
$faviconCount += Copy-Wildcard "$oldSiteNet\apple-touch-icon*.png" $sharedDest "Apple icons"
$faviconCount += Copy-Wildcard "$oldSiteNet\android-icon*.png" $sharedDest "Android icons"
$faviconCount += Copy-Wildcard "$oldSiteNet\ms-icon*.png" $sharedDest "MS tile icons"
Copy-IfExists "$oldSiteNet\browserconfig.xml" $sharedDest
Copy-IfExists "$oldSiteNet\site.webmanifest" $sharedDest
Write-Host "  → Total favicon files: $faviconCount" -ForegroundColor Cyan
Write-Host ""

Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "📦 STEP 2: COPYING TLD-SPECIFIC ASSETS" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# contraco-net
Write-Host "📁 contraco-net:" -ForegroundColor Cyan
$dest = "$targetDir\src\assets-tld\net"
Copy-Wildcard "$oldSiteNet\yandex*.html" $dest "Yandex verification"
$txtFiles = Get-ChildItem "$oldSiteNet\*.txt" -Exclude "robots.txt" -ErrorAction SilentlyContinue
foreach ($file in $txtFiles) { Copy-Item $file.FullName $dest -Force }
Write-Host "  ✓ IndexNow key files" -ForegroundColor Green
Copy-IfExists "$oldSiteNet\CNAME" $dest
Copy-IfExists "$oldSiteNet\robots.txt" $dest
Copy-IfExists "$oldSiteNet\sitemap.xml" $dest
Write-Host ""

# contraco-de
Write-Host "📁 contraco-de:" -ForegroundColor Cyan
$dest = "$targetDir\src\assets-tld\de"
Copy-Wildcard "$oldSiteDe\yandex*.html" $dest "Yandex verification"
$txtFiles = Get-ChildItem "$oldSiteDe\*.txt" -Exclude "robots.txt" -ErrorAction SilentlyContinue
foreach ($file in $txtFiles) { Copy-Item $file.FullName $dest -Force }
Write-Host "  ✓ IndexNow key files" -ForegroundColor Green
Copy-IfExists "$oldSiteDe\CNAME" $dest
Copy-IfExists "$oldSiteDe\robots.txt" $dest
Copy-IfExists "$oldSiteDe\sitemap.xml" $dest
Write-Host ""

# contraco-kr
Write-Host "📁 contraco-kr:" -ForegroundColor Cyan
$dest = "$targetDir\src\assets-tld\kr"
Copy-Wildcard "$oldSiteKr\yandex*.html" $dest "Yandex verification"
$txtFiles = Get-ChildItem "$oldSiteKr\*.txt" -Exclude "robots.txt" -ErrorAction SilentlyContinue
foreach ($file in $txtFiles) { Copy-Item $file.FullName $dest -Force }
Write-Host "  ✓ IndexNow key files" -ForegroundColor Green
Copy-IfExists "$oldSiteKr\CNAME" $dest
Copy-IfExists "$oldSiteKr\robots.txt" $dest
Copy-IfExists "$oldSiteKr\sitemap.xml" $dest
Write-Host ""

# contraco-ru
Write-Host "📁 contraco-ru:" -ForegroundColor Cyan
$dest = "$targetDir\src\assets-tld\ru"
Copy-Wildcard "$oldSiteRu\yandex*.html" $dest "Yandex verification"
$txtFiles = Get-ChildItem "$oldSiteRu\*.txt" -Exclude "robots.txt" -ErrorAction SilentlyContinue
foreach ($file in $txtFiles) { Copy-Item $file.FullName $dest -Force }
Write-Host "  ✓ IndexNow key files" -ForegroundColor Green
Copy-IfExists "$oldSiteRu\CNAME" $dest
Copy-IfExists "$oldSiteRu\robots.txt" $dest
Copy-IfExists "$oldSiteRu\sitemap.xml" $dest
Write-Host ""

# contraco-com
Write-Host "📁 contraco-com:" -ForegroundColor Cyan
$dest = "$targetDir\src\assets-tld\com"
Copy-Wildcard "$oldSiteCom\yandex*.html" $dest "Yandex verification"
$txtFiles = Get-ChildItem "$oldSiteCom\*.txt" -Exclude "robots.txt" -ErrorAction SilentlyContinue
foreach ($file in $txtFiles) { Copy-Item $file.FullName $dest -Force }
Write-Host "  ✓ IndexNow key files" -ForegroundColor Green
Copy-IfExists "$oldSiteCom\CNAME" $dest
Copy-IfExists "$oldSiteCom\robots.txt" $dest
Copy-IfExists "$oldSiteCom\sitemap.xml" $dest
Write-Host ""

Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "✅ ALL FILES COPIED SUCCESSFULLY!" -ForegroundColor Green
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

Write-Host "📊 Files copied to:" -ForegroundColor Yellow
Write-Host "   Shared assets → $targetDir\src\assets-shared\" -ForegroundColor White
Write-Host "   TLD-specific  → $targetDir\src\assets-tld\{net,de,kr,ru,com}\" -ForegroundColor White
Write-Host ""

Write-Host "📋 NEXT STEPS:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1️⃣  Extract CSS from old HTML file" -ForegroundColor Cyan
Write-Host "   • Open: $oldSiteNet\index.html" -ForegroundColor Gray
Write-Host "   • Find: <style> section (lines 60-700)" -ForegroundColor Gray
Write-Host "   • Copy: Everything between <style> and </style>" -ForegroundColor Gray
Write-Host "   • Paste to: $targetDir\src\css\styles.css" -ForegroundColor Gray
Write-Host ""

Write-Host "2️⃣  Install dependencies" -ForegroundColor Cyan
Write-Host "   cd $targetDir" -ForegroundColor Gray
Write-Host "   npm install" -ForegroundColor Gray
Write-Host ""

Write-Host "3️⃣  Build all 5 sites" -ForegroundColor Cyan
Write-Host "   npm run build" -ForegroundColor Gray
Write-Host ""

Write-Host "4️⃣  Test locally" -ForegroundColor Cyan
Write-Host "   npm run serve:net" -ForegroundColor Gray
Write-Host "   (Opens http://localhost:8080)" -ForegroundColor Gray
Write-Host ""

Write-Host "🎉 Ready to build your unified multi-site!" -ForegroundColor Green
Write-Host ""

Read-Host "Press Enter to exit"
