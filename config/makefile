STOW_FOLDERS = $(wildcard */)
STOW_FOLDERS_PARTIALS = $(filter-out code, $(STOW_FOLDERS))

all:
	stow --verbose --target=$$HOME --restow $(STOW_FOLDERS)

partial:
	stow --verbose --target=$$HOME --restow $(STOW_FOLDERS_PARTIALS)

delete:
	stow --verbose --target=$$HOME --delete */

