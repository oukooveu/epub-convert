#!/bin/sh

# functions

usage()
{
  echo "usage: $0 <books dir> [--format <format> --force]"
}

# init

if [ $# -lt 1 ]; then 
  usage
  exit 1
fi
[ -d $1 ] || exit 1

BOOKS_DIR=${1%\/} && shift
LOG_FILE="$BOOKS_DIR/epub-convert.log"

# options

format='mobi'
force=0

while [ "${1#-}" != "${1}" -a $# -gt 0 ]; do
    case $1 in
        --help|-h)
            usage
            exit
            ;;
        --force|-f)
            force=1
            shift
            ;;
        --format|-x)
            format=$2
            [ "x$format" = "x" ] && { usage; exit 1; }
            shift 2
            ;;
        *)
            shift
            ;;
    esac
done

# main

echo "=== output format is '$format'" >>$LOG_FILE

find ${BOOKS_DIR} -type f -not -name "*.${format}" -not -wholename "$LOG_FILE" |
while read f
do
  echo "=== file: '${f}'" >>$LOG_FILE

  out="${f%.*}.${format}"

  if [ -f "$out" ]; then
    if [ $force -eq 0 ]; then
      echo "=== file '$out' exists and there is no force mode, skipping" >>$LOG_FILE
      continue
    fi
      echo "=== file '$out' exists and there is force mode, remove file" >>$LOG_FILE
    rm "$out"
  fi

  ebook-convert "$f" "$out" 2>&1 >>$LOG_FILE

done
