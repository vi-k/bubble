#!/bin/sh
# Проставляет в шапки переводов текущие blob-хеши оригиналов.
#
# ЗАПУСКАТЬ ТОЛЬКО ПОСЛЕ ТОГО, КАК ТЕКСТ ПЕРЕВОДА ДЕЙСТВИТЕЛЬНО ОБНОВЛЁН.
# Скрипт не читает содержимое и не может отличить обновлённый перевод от
# устаревшего: он лишь переносит хеш. Запуск «чтобы гейт замолчал» превращает
# проверку в ложь.
#
# Запускать из любого места: sh docs/ru/stamp.sh
set -eu

cd "$(dirname "$0")/../.."

for translation in README.ru.md example/README.ru.md; do
  [ -e "$translation" ] || continue

  source=$(sed -n 's/^> Перевод `\([^`]*\)`.*/\1/p' "$translation" | head -1)
  if [ -z "$source" ] || [ ! -e "$source" ]; then
    echo "пропущен (нет шапки или оригинала): $translation"
    continue
  fi

  actual=$(git hash-object "$source")
  recorded=$(sed -n 's/^.*blob `\([0-9a-f]\{40\}\)`.*/\1/p' "$translation" | head -1)

  if [ "$actual" = "$recorded" ]; then
    continue
  fi

  tmp="$translation.stamp"
  sed "s/blob \`[0-9a-f]\{40\}\`/blob \`$actual\`/" "$translation" > "$tmp"
  mv "$tmp" "$translation"
  echo "проставлен $actual → $translation"
done
