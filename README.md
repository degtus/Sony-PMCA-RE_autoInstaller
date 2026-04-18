# Sony-PMCA-RE autoInstaller

This repository is a public personal fork of [ma1co/Sony-PMCA-RE](https://github.com/ma1co/Sony-PMCA-RE).

## Status

This fork is not under active development.

There is no roadmap here.
There is no promise of future fixes, packaged releases, or issue support.
If something happens to work for your camera or machine, treat that as best-effort maintenance, not an actively supported product.

It exists mainly as a convenience fork for:

* running the project from source on current Linux/macOS systems
* carrying a few small maintenance fixes that are useful locally
* keeping a simpler public landing page than the original upstream repository state

Do not expect regular releases, packaged binaries, or fast upstream sync.

## What Is Different In This Fork

* fork-facing README instead of the original upstream landing page
* `scripts/bootstrap-ubuntu.sh` for preparing the current checkout on Ubuntu/Debian
* a small macOS driver fallback fix from upstream PR `#698`
* a small Python warning cleanup from upstream PR `#651`
* the JP camera language safety tweak from upstream PR `#356`
* removal of old Travis/AppVeyor CI config that no longer matches the current fork

## Quick Start

### Ubuntu / Debian

Clone the fork, enter the checkout, then run:

```bash
./scripts/bootstrap-ubuntu.sh
sudo .venv/bin/python pmca-console.py serviceshell
```

### macOS

This fork is source-first on macOS. A minimal setup looks like this:

```bash
brew install libusb
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
python pmca-console.py -h
```

Notes:

* Apple Silicon is not the main blocker here; old USB/driver behavior is.
* This fork loads `libusb` alongside the native Sony path on macOS when the default driver is used.
* For USB communication on macOS, having `libusb` installed is important.

### Plain Source Setup

If you do not want the helper script:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
python pmca-console.py -h
```

## Typical Commands

* `python pmca-console.py info`
* `python pmca-console.py install -i`
* `python pmca-console.py updatershell`
* `python pmca-console.py serviceshell`

The GUI is still present as `pmca-gui.py`, but this fork is mainly aimed at source-based console usage.

## Submodules And Old Build Paths

For `pmca-console.py` and `serviceshell`, a normal clone is enough.

Recursive submodules are only relevant if you want to rebuild older `updatershell` components. That area still contains historical toolchain baggage, and some nested submodule URLs upstream are stale.

## Important Limitations

* This code still talks to cameras through old reverse-engineered USB paths.
* It can break on modern operating systems, modern Python versions, or particular camera models.
* This fork does not maintain packaged releases.
* This fork should not be read as a commitment to support future Sony bodies, new firmware, or platform compatibility work.
* Bug reports or feature requests may simply remain unanswered.
* Use it at your own risk. If something goes wrong with the camera, that risk is on you.

## Upstream Project

The original project and broader documentation live here:

* Upstream repository: [ma1co/Sony-PMCA-RE](https://github.com/ma1co/Sony-PMCA-RE)
* Camera compatibility docs: [openmemories.readthedocs.io](https://openmemories.readthedocs.io/devices.html)
* App installation notes: [docs/AppInstallation.md](docs/AppInstallation.md)

## Special Thanks

Without the work done by the people at [nex-hack](http://www.personal-view.com/faqs/sony-hack/hack-development), this would not have been possible.
