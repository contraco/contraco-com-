# Quick Start Guide for Windows 11

**Build all 5 contraco websites from one place!**

## Prerequisites

✅ Windows 11
✅ Node.js 14+ installed ([Download](https://nodejs.org/))

Check your Node.js version:
```powershell
node --version
```

Should show v14.0.0 or higher.

---

## Step 1: Copy This Folder

Copy the `PHASE2-UNIFIED` folder to your working location:

```
C:\Users\YourName\contraco-unified\
```

---

## Step 2: Open PowerShell

Right-click on the folder → "Open in Terminal" or "Open PowerShell here"

Or:
1. Press `Windows + X`
2. Select "Windows PowerShell" or "Terminal"
3. Navigate: `cd C:\Users\YourName\contraco-unified`

---

## Step 3: Install Dependencies

```powershell
npm install
```

Wait ~30 seconds. This downloads 11ty and required packages.

---

## Step 4: Copy Your Assets

Copy files from your old TLD sites to the new structure:

### Shared Assets (Logo, common graphics)

Copy to `src\assets-shared\`:
- Logo_rectangle.svg
- Logo_rectangle.png
- contraco_logo.png
- Strategic pillar SVGs

```powershell
# Example:
copy C:\old-sites\contraco-net\Logo_rectangle.svg src\assets-shared\
copy C:\old-sites\contraco-net\Logo_rectangle.png src\assets-shared\
```

### TLD-Specific Assets

Copy each TLD's unique files to `src\assets-tld\{tld}\`:

**For contraco-net:**
```powershell
copy C:\old-sites\contraco-net\*.png src\assets-tld\net\
copy C:\old-sites\contraco-net\*.ico src\assets-tld\net\
copy C:\old-sites\contraco-net\*.xml src\assets-tld\net\
copy C:\old-sites\contraco-net\*.txt src\assets-tld\net\
copy C:\old-sites\contraco-net\yandex*.html src\assets-tld\net\
copy C:\old-sites\contraco-net\CNAME src\assets-tld\net\
copy C:\old-sites\contraco-net\robots.txt src\assets-tld\net\
```

**Repeat for de, kr, ru, com:**
```powershell
# contraco-de
copy C:\old-sites\contraco-de\*.png src\assets-tld\de\
copy C:\old-sites\contraco-de\*.ico src\assets-tld\de\
# ... etc

# contraco-kr
copy C:\old-sites\contraco-kr\*.png src\assets-tld\kr\
# ... etc

# contraco-ru
copy C:\old-sites\contraco-ru\*.png src\assets-tld\ru\
# ... etc

# contraco-com
copy C:\old-sites\contraco-com\*.png src\assets-tld\com\
# ... etc
```

---

## Step 5: Extract CSS

Open any old HTML file (e.g., `contraco-net\index.html`) in Notepad or VS Code.

1. Find the `<style>` section (usually lines 60-700)
2. Copy everything **between** `<style>` and `</style>` (not including the tags)
3. Open `src\css\styles.css`
4. Paste the CSS
5. Save

---

## Step 6: Extract JavaScript (Already Done!)

The JavaScript is already in `src\js\scripts.js` (logo fallback, mobile menu).

If you have additional JS, add it to that file.

---

## Step 7: Build All Sites

```powershell
npm run build
```

This builds all 5 TLD sites in ~5-10 seconds!

Output goes to:
- `dist\net\` → contraco.net
- `dist\de\` → contraco.de
- `dist\kr\` → contraco.co.kr
- `dist\ru\` → contraco.ru
- `dist\com\` → contraco.com

---

## Step 8: Test Locally

### Test One Site:

```powershell
npm run serve:net
```

Opens http://localhost:8080 automatically. Browse your site!

Press `Ctrl+C` to stop.

### Test Other Sites:

```powershell
npm run serve:de    # Test German site
npm run serve:kr    # Test Korean site
npm run serve:ru    # Test Russian site
npm run serve:com   # Test .com site
```

---

## Step 9: Deploy to GitHub

### Option A: Automatic Deployment

```powershell
npm run deploy
```

Interactive script that:
1. Asks for paths to your 5 GitHub repos
2. Copies built files
3. Commits and pushes (optional)

### Option B: Manual Copy

```powershell
# Copy built files to each repo
xcopy dist\net\* C:\repos\contraco-net\ /E /Y
xcopy dist\de\* C:\repos\contraco-de\ /E /Y
xcopy dist\kr\* C:\repos\contraco-kr\ /E /Y
xcopy dist\ru\* C:\repos\contraco-ru\ /E /Y
xcopy dist\com\* C:\repos\contraco-com\ /E /Y

# Then commit each repo:
cd C:\repos\contraco-net
git add .
git commit -m "Update from unified builder"
git push

# Repeat for de, kr, ru, com
```

---

## 🎉 Done!

You now manage all 5 websites from ONE place!

---

## Daily Workflow

### Make a Change (e.g., update footer)

1. Edit `src\_includes\footer.njk`
2. Run: `npm run build`
3. Test: `npm run serve:net` (check one site)
4. Deploy: `npm run deploy` or manual copy
5. Done! Footer updated on all 5 sites.

**Time: 2-3 minutes** (was 2-3 hours!)

---

## Common Commands

```powershell
# Build all sites
npm run build

# Build one site
npm run build:net
npm run build:de

# Test locally
npm run serve:net

# Deploy
npm run deploy

# Clean build folders
npm run clean
```

---

## Troubleshooting

### "npm is not recognized"

Node.js not installed or not in PATH.
- Download from https://nodejs.org/
- Restart PowerShell after installing

### "Cannot find module"

Run:
```powershell
npm install
```

### Build fails

Check:
- `src\_includes\base.njk` exists
- `src\_data\navigation.json` is valid JSON
- CSS file has no syntax errors

### Sites look broken

- Check CSS copied correctly to `src\css\styles.css`
- Check assets copied to `src\assets-tld\{tld}\`
- Run `npm run build` again

---

## File Locations (Windows Paths)

```
C:\Users\YourName\contraco-unified\
├── src\
│   ├── _includes\        ← Edit templates here
│   ├── _data\            ← Edit navigation here
│   ├── css\styles.css    ← Edit styles here
│   ├── js\scripts.js     ← Edit JavaScript here
│   ├── assets-tld\       ← TLD-specific assets
│   └── index.njk         ← Edit pages here
├── dist\                 ← Built sites (deploy these)
└── node_modules\         ← Dependencies (don't edit)
```

---

## Need Help?

See `README.md` for detailed documentation!

---

**🚀 You're ready to build and deploy all 5 sites with ONE command!**
