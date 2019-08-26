SCRIPT_PATH=$(dirname $(realpath -s $0))
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "script path: $SCRIPT_PATH"
echo "script dir: $SCRIPT_DIR"
echo "\$0: $0"
echo "pwd: $( pwd )"