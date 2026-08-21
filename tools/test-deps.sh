#!/usr/bin/env bash
# tools/test-deps.sh
# Dry-run tester for Curtroder-install.sh dependency check
# Usage: ./tools/test-deps.sh [--install]

set -eo pipefail

REQUIRED_PKGS=(figlet curl)
MISSING=()

for pkg in "${REQUIRED_PKGS[@]}"; do
  if ! command -v "$pkg" >/dev/null 2>&1; then
    MISSING+=("$pkg")
  fi
done

if [ ${#MISSING[@]} -eq 0 ]; then
  echo "[OK] All required executables are present: ${REQUIRED_PKGS[*]}"
  exit 0
fi

echo "[DRY-RUN] The following packages appear to be missing: ${MISSING[*]}"

# Show the commands that would be executed by the installer
echo ""
echo "Commands (dry-run):"
echo "  pkg update -y"
echo -n "  pkg install"
for p in "${MISSING[@]}"; do
  echo -n " $p"
done
echo " -y"

echo ""

# If user asked for --install, run the real commands after confirmation
if [ "$1" = "--install" ]; then
  echo "You passed --install. This will run 'pkg update' and 'pkg install ${MISSING[*]}' on your system." 
  read -p "Proceed? [y/N]: " resp
  case "${resp,,}" in
    y|yes)
      echo "Running: pkg update -y"
      pkg update -y
      echo "Running: pkg install ${MISSING[*]} -y"
      pkg install "${MISSING[@]}" -y
      if [ $? -eq 0 ]; then
        echo "[OK] Installed: ${MISSING[*]}"
        exit 0
      else
        echo "[ERROR] Install failed. Check your network/mirrors or run 'pkg search <name>' to verify availability." >&2
        exit 1
      fi
      ;;
    *)
      echo "Cancelled by user. No changes were made."
      exit 2
      ;;
  esac
fi

# Helpful note for maintainers
cat <<'NOTE'

Tip: Run this script from your fork's workspace (it reads the system PATH).
Use --install to let it actually attempt to install missing packages (Termux only).
If pkg reports 'Unable to locate package', try: pkg install termux-change-repo -y && termux-change-repo
NOTE
