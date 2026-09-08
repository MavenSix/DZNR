<#
.SYNOPSIS
  DZNR installer for Windows 10 and 11 (PowerShell 5.1 or 7).

.DESCRIPTION
  Windows twin of install.sh. Does the same five things, in the same order:
    1. Checks that Node.js, Claude Code, and Git are installed
    2. Clones the DZNR repo to $HOME\DZNR (or pulls the latest if it exists)
    3. Installs the /dznr slash command at the user level ($HOME\.claude\commands\dznr.md)
    4. Offers to set up the workshop sync (a directory junction, not a symlink,
       so it works without Developer Mode or admin rights)
    5. Verifies the install

.USAGE
  From a PowerShell prompt:
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
    .\install.ps1
  Or, if you already cloned the repo:
    powershell -ExecutionPolicy Bypass -File $HOME\DZNR\install.ps1

  Flags:
    -Check    Only check prerequisites. Change nothing.

  Safe to re-run. Idempotent.

.NOTES
  Claude Code on Windows requires Git for Windows (it uses Git Bash internally).
  Installing Git for Windows also satisfies the Git prerequisite here.
#>
[CmdletBinding()]
param(
  [switch]$Check
)

$ErrorActionPreference = 'Stop'
$script:Step = 0

function Step($msg) { $script:Step++; Write-Host ""; Write-Host "[$($script:Step)/5] $msg" -ForegroundColor Blue }
function Ok($msg)   { Write-Host "  ok   $msg" -ForegroundColor Green }
function Warn($msg) { Write-Host "  ..   $msg" -ForegroundColor Yellow }
function Fail($msg) { Write-Host "  no   $msg" -ForegroundColor Red }
function Hint($msg) { Write-Host "         $msg" -ForegroundColor DarkGray }

Write-Host ""
if ($Check) {
  Write-Host "DZNR Installer (check mode)" -ForegroundColor White
  Write-Host "Verifying prerequisites. No changes will be made." -ForegroundColor DarkGray
} else {
  Write-Host "DZNR Installer" -ForegroundColor White
  Write-Host "A practitioner-grade Claude Code plugin for design, AI product, and experience engineering work." -ForegroundColor DarkGray
}

# ===== Step 1: Prereq check =====
Step "Check what is already installed"
$missing = $false

if (Get-Command node -ErrorAction SilentlyContinue) {
  Ok "Node.js installed ($(node --version))"
} else {
  Fail "Node.js not found"
  Hint "Install the LTS: winget install OpenJS.NodeJS.LTS   (or https://nodejs.org)"
  $missing = $true
}

if (Get-Command claude -ErrorAction SilentlyContinue) {
  $cv = (& claude --version 2>$null | Select-Object -First 1); if (-not $cv) { $cv = 'unknown' }
  Ok "Claude Code installed ($cv)"
} else {
  Fail "Claude Code not found"
  Hint "Install with: npm install -g @anthropic-ai/claude-code"
  Hint "Then run:     claude login"
  $missing = $true
}

if (Get-Command git -ErrorAction SilentlyContinue) {
  Ok "Git installed ($((git --version) -replace 'git version ',''))"
} else {
  Fail "Git not found"
  Hint "Install Git for Windows: winget install Git.Git   (Claude Code needs it too)"
  $missing = $true
}

if (Test-Path $HOME -PathType Container) { Ok "Home directory is writable ($HOME)" } else { Fail "Cannot find home directory"; $missing = $true }

if ($missing) {
  Write-Host ""
  Fail "Install the missing prerequisites above, open a NEW PowerShell window, and re-run this script."
  exit 1
}

if ($Check) { Write-Host ""; Ok "All prerequisites present. Run without -Check to install."; exit 0 }

# ===== Step 2: Clone or update =====
Step "Get the DZNR repo"
$DznrDir = Join-Path $HOME 'DZNR'
$RepoUrl = 'https://github.com/MavenSix/DZNR.git'

if (Test-Path (Join-Path $DznrDir '.git')) {
  Warn "DZNR already at $DznrDir, pulling latest"
  git -C $DznrDir pull --ff-only | Out-Null
  Ok "Updated"
} elseif (Test-Path $DznrDir) {
  Fail "$DznrDir exists but is not a git checkout"
  Hint "Move or rename it, then re-run."
  exit 1
} else {
  git clone $RepoUrl $DznrDir | Out-Null
  Ok "Cloned to $DznrDir"
}

# ===== Step 3: Slash command =====
Step "Install the /dznr slash command at the user level"
$CmdDir  = Join-Path $HOME '.claude\commands'
$Source  = Join-Path $DznrDir 'commands\conduct.md'
$Target  = Join-Path $CmdDir 'dznr.md'

if (-not (Test-Path $Source)) { Fail "Source command file not found at $Source"; Hint "Something is wrong with the clone. Remove $DznrDir and re-run."; exit 1 }
New-Item -ItemType Directory -Force -Path $CmdDir | Out-Null

if (Test-Path $Target) {
  if ((Get-FileHash $Source).Hash -eq (Get-FileHash $Target).Hash) { Ok "/dznr already installed and up to date" }
  else { Warn "/dznr exists but differs, updating"; Copy-Item $Source $Target -Force; Ok "/dznr updated" }
} else {
  Copy-Item $Source $Target -Force
  Ok "/dznr installed at $Target"
}

# ===== Step 4: Workshop sync (junction) =====
Step "Workshop sync (optional)"
$SkillsDir   = Join-Path $HOME '.claude\skills'
$WorkshopDir = Join-Path $DznrDir 'skills\workshop'

Write-Host "The workshop sync makes Gandalf's craft skills available outside DZNR's namespace," -ForegroundColor DarkGray
Write-Host "so you can use them in non-DZNR projects too. Most users want it." -ForegroundColor DarkGray
Write-Host ""

$reply = 'N'
if ([Environment]::UserInteractive -and -not [Console]::IsInputRedirected) {
  $reply = Read-Host "  Set up the workshop sync now? [Y/n]"
  if ([string]::IsNullOrWhiteSpace($reply)) { $reply = 'Y' }
} else {
  Warn "Non-interactive install detected, skipping workshop sync."
  Hint "Run later: powershell -File $DznrDir\install.ps1"
}

if ($reply -match '^[Yy]$') {
  $existing = Get-Item $SkillsDir -ErrorAction SilentlyContinue
  if ($existing -and $existing.LinkType -eq 'Junction' -and ($existing.Target -contains $WorkshopDir)) {
    Ok "Workshop sync already in place"
  } elseif ($existing -and -not $existing.LinkType) {
    $backup = "$SkillsDir.backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    Warn "$SkillsDir exists as a regular folder, backing up to $backup"
    Move-Item $SkillsDir $backup
    New-Item -ItemType Junction -Path $SkillsDir -Target $WorkshopDir | Out-Null
    Ok "Workshop sync set up (previous folder is safe at $backup)"
  } else {
    if ($existing) { Remove-Item $SkillsDir -Force }
    New-Item -ItemType Junction -Path $SkillsDir -Target $WorkshopDir | Out-Null
    Ok "Workshop sync set up (directory junction, no admin needed)"
  }
}

# ===== Step 5: Verify =====
Step "Verify the install"
$verifyOk = $true
if (Test-Path $Target) { Ok "/dznr slash command file present" } else { Fail "/dznr missing at $Target"; $verifyOk = $false }
$manifest = Join-Path $DznrDir '.claude-plugin\plugin.json'
if (Test-Path $manifest) {
  $ver = (Get-Content $manifest -Raw | ConvertFrom-Json).version
  Ok "DZNR plugin manifest present (v$ver)"
} else { Fail "DZNR plugin manifest missing"; $verifyOk = $false }
if (Test-Path (Join-Path $DznrDir 'agents\tar\AGENT.md')) { Ok "DZNR subagents present" } else { Fail "DZNR subagents missing"; $verifyOk = $false }

if (-not $verifyOk) { Write-Host ""; Fail "Install verification did not pass."; Hint "Email the output above to Kevin (brandlessons@gmail.com)."; exit 1 }

Write-Host ""
Write-Host "DZNR is installed." -ForegroundColor Green
Write-Host ""
Write-Host "To start using it:" -ForegroundColor White
Write-Host ""
Write-Host "  1. Open a new PowerShell or Windows Terminal window."
Write-Host "  2. Run:  claude --plugin-dir `"$DznrDir`""
Write-Host "  3. Inside Claude Code, type /dznr and press Enter."
Write-Host ""
