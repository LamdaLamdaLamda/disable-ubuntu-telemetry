# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
This project has no tagged releases, so entries are grouped by date instead of version number.

## [Unreleased]

### Added
- GitHub Actions CI pipeline (`.github/workflows/test.yml`) that runs `disableUbuntuOptOut.sh` against Ubuntu 18.04, 20.04, 22.04 and 24.04 in Docker containers, plus a ShellCheck lint job.
- `Dockerfile` and `.dockerignore` to build and run the script locally against any Ubuntu base image via `--build-arg UBUNTU_VERSION=<version>`, without touching the host system.

### Fixed
- `apt-mark hold` was called with an unsupported `-y` flag, which made it exit with an error on every run and caused the script to always report `[-] Removing of telemtry services failed.` regardless of whether the packages were actually purged. The flag is now only used with `apt purge`.

## 2022-04-22
### Added
- `apt-mark hold` on the telemetry packages after purging, so they can't be reinstalled by an `apt upgrade`.

## 2021-09-07
### Added
- Travis CI integration.
### Removed
- Travis CI integration (reverted the same day).

## 2019-09-30
### Added
- Explicit opt-out via `ubuntu-report -f send no`.

## 2018-08-07
### Added
- Initial release: resolves `metrics.ubuntu.com` and `popcon.ubuntu.com` to localhost and purges `ubuntu-report`, `popularity-contest`, `apport` and `whoopsie`.
