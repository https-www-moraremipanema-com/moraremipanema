#!/bin/sh
set -eu

rm -rf dist
mkdir -p dist

for item in * .*; do
  case "$item" in
    .|..|.git|dist) continue ;;
  esac

  if [ -e "$item" ]; then
    cp -R "$item" dist/
  fi
done

find dist -type f \( -name '*.html' -o -name '*.xml' -o -name '*.txt' \) -exec sed -i.bak 's#https://moraremipanema\.com#https://www.moraremipanema.com#g' {} \;
find dist -type f -name '*.bak' -delete

for page in dist/*.html; do
  [ "$page" = "dist/index.html" ] && continue
  sed -i.bak 's#<meta name="twitter:card" content="summary">#<meta name="twitter:card" content="summary_large_image"><meta property="og:image" content="https://www.moraremipanema.com/fotos/og-capa.jpg"><meta property="og:image:width" content="1200"><meta property="og:image:height" content="630"><meta property="og:image:alt" content="Sala do apartamento de 300 m² à venda em Ipanema, com vista lateral para o mar"><meta name="twitter:image" content="https://www.moraremipanema.com/fotos/og-capa.jpg"><meta name="twitter:image:alt" content="Sala do apartamento de 300 m² à venda em Ipanema, com vista lateral para o mar">#' "$page"
done
find dist -type f -name '*.bak' -delete

printf 'Arquivos publicados com domínio canônico normalizado (www).\n'
