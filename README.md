# 🐳 Docker Full Cleanup

A simple and interactive shell script to completely clean up a Docker environment.

It can remove:

- 🛑 All running containers
- 📦 All Docker containers
- 🖼️ All Docker images
- 💾 All Docker volumes
- 🧹 All unused Docker build cache

## ⚠️ Warning

**This script is destructive.**

Docker volumes can contain persistent application data, including:

- Databases
- Uploaded files
- Application state
- Configuration data

Make sure you have backups of anything important before running this script.

This project is intended for development machines, test environments, CI environments, and situations where you intentionally want to reset Docker.

## 🚀 Usage

### Clone the repository

```bash
[git clone https://github.com/YOUR_USERNAME/rm-all-docker.git](https://github.com/GITburakdeniz/Docker-Full-Cleanup.git)
cd rm-all-docker
```

### Make the script executable

```bash
chmod +x rm-all-docker.sh
```

### Run

```bash
./rm-all-docker.sh
```

The script will:

1. Check that Docker is installed.
2. Check that the Docker daemon is available.
3. Display the current Docker state.
4. Ask for confirmation.
5. Stop running containers.
6. Remove all containers.
7. Remove all images.
8. Remove all volumes.
9. Remove unused build cache.
10. Display the Docker state after cleanup.

### Run with `sh`

```bash
sh rm-all-docker.sh
```

## 📊 What gets removed?

| Resource | Action |
|---|---|
| Running containers | Stopped |
| Containers | Removed |
| Images | Removed |
| Volumes | Removed |
| Build cache | Removed |

## 🔍 Before cleanup

The script automatically displays:

```bash
docker ps
docker ps -a
docker images
docker volume ls
docker system df
```

This lets you inspect the Docker environment before confirming the cleanup.

## 🛡️ Safety

The script requires explicit confirmation:

```text
Continue? [y/N]
```

Only `y`, `Y`, `yes`, `YES`, or `Yes` will continue.

Anything else cancels the operation.

## 📋 Requirements

- Linux or macOS
- Docker
- Docker daemon running
- Permission to access Docker
- POSIX-compatible shell

## 🧪 ShellCheck

The project uses [ShellCheck](https://www.shellcheck.net/) to check the shell script for common errors and potential problems.

## 📄 License

This project is licensed under the MIT License.

See [LICENSE](LICENSE) for details.

## 🤝 Contributing

Contributions are welcome.

If you find a bug or have an improvement:

1. Fork the repository.
2. Create a feature branch.
3. Make your changes.
4. Run ShellCheck.
5. Open a pull request.

Please keep the script simple and portable.

## ⭐ Support

If this script is useful to you, consider giving the repository a star.
