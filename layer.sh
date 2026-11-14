layer=""
for f in blobs/sha256/*; do
  tar -tf "$f" 2>/dev/null | grep -qx 'bin/terraform' && layer="$f"
done
echo "Слой: $layer"
