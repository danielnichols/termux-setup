export RESTIC_REPOSITORY=~/storage/shared/TermuxBackups/restic/
export RESTIC_PASSWORD=password
external_storage_dir=$(readlink -f ~/storage/external-1)
echo $external_storage_dir

restic backup \
  /data/data/com.termux/files \
  $external_storage_dir \
  --exclude="$HOME/storage/*" \
  --exclude="!$HOME/storage/external-1" \
  --exclude-caches \