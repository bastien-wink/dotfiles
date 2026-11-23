#!/usr/bin/env bash
# Installe le keymap PhpStorm dans la version la plus récente trouvée et l'active.
# À lancer IDE fermé (sinon PhpStorm écrase options/ à la fermeture).
set -euo pipefail
src="$(cd "$(dirname "$0")" && pwd)/keymaps"
dir=$(ls -d "$HOME"/.config/JetBrains/PhpStorm*/ 2>/dev/null | sort -V | tail -1)
[ -n "$dir" ] || { echo "Aucun ~/.config/JetBrains/PhpStorm* : lance PhpStorm une fois d'abord." >&2; exit 1; }
mkdir -p "$dir/keymaps" "$dir/options/linux"
cp "$src"/*.xml "$dir/keymaps/"
cat > "$dir/options/linux/keymap.xml" <<'XML'
<application>
  <component name="KeymapManager">
    <active_keymap name="XWin copy" />
  </component>
</application>
XML
echo "Keymap installé et activé dans $dir"
