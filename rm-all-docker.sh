#!/bin/sh

set -u

echo "========================================"
echo "        Docker Full Cleanup"
echo "========================================"

# Check Docker command
if ! command -v docker >/dev/null 2>&1; then
    echo "Error: Docker is not installed or not in PATH."
    exit 1
fi

# Check Docker daemon
if ! docker info >/dev/null 2>&1; then
    echo "Error: Docker daemon is not running or permission is denied."
    exit 1
fi

echo
echo "=== BEFORE CLEANUP ==="

echo
echo "--- Docker Version ---"
docker --version

echo
echo "--- Running Containers ---"
docker ps

echo
echo "--- All Containers ---"
docker ps -a

echo
echo "--- Images ---"
docker images

echo
echo "--- Volumes ---"
docker volume ls

echo
echo "--- Docker Disk Usage ---"
docker system df

echo
echo "========================================"
echo "WARNING"
echo "========================================"
echo "This will remove:"
echo "  - All containers"
echo "  - All Docker images"
echo "  - All Docker volumes"
echo "  - All unused Docker build cache"
echo
echo "WARNING: Docker volumes may contain"
echo "persistent application data."
echo
echo "This operation cannot be easily undone."
echo "========================================"
echo

printf "Continue? [y/N] "
read answer

case "$answer" in
    y|Y|yes|YES|Yes)
        ;;
    *)
        echo "Cancelled."
        exit 0
        ;;
esac

echo
echo "=== STOPPING ALL RUNNING CONTAINERS ==="
docker ps -q | xargs -r docker stop

echo
echo "=== REMOVING ALL CONTAINERS ==="
docker ps -aq | xargs -r docker rm -f

echo
echo "=== REMOVING ALL IMAGES ==="
docker images -aq | xargs -r docker rmi -f

echo
echo "=== REMOVING ALL VOLUMES ==="
docker volume ls -q | xargs -r docker volume rm

echo
echo "=== REMOVING BUILD CACHE ==="
docker builder prune -af

echo
echo "========================================"
echo "        AFTER CLEANUP"
echo "========================================"

echo
echo "--- Running Containers ---"
docker ps

echo
echo "--- All Containers ---"
docker ps -a

echo
echo "--- Images ---"
docker images

echo
echo "--- Volumes ---"
docker volume ls

echo
echo "--- Docker Disk Usage ---"
docker system df

echo
echo "========================================"
echo "        Cleanup Complete"
echo "========================================"
