EXPLORER_PATH := C:/s4explore
BASE_WORKSPACE := $(EXPLORER_PATH)/workspace/content/patch
LUMEN_WORKSPACE := $(BASE_WORKSPACE)/data/ui/lumen
SCRIPT_WORKSPACE := $(BASE_WORKSPACE)/data/ui/script

# VERBOSE := true

ifndef VERBOSE
	NULL_OUTPUT = >nul
endif

all:
	@echo -n "Building world_smash_view_select_map.xtal..."
	xtalc -o "$(SCRIPT_WORKSPACE)/app/world_smash/world_smash_view_select_map.xtal" scene_1.xt
	@echo " done."
	@echo -n "Building world_smash_view_select_mii.xtal..."
	xtalc -o "$(SCRIPT_WORKSPACE)/app/world_smash/world_smash_view_select_mii.xtal" scene_2.xt
	@echo " done."

	@echo -n "Building ws_select_map.lm..."
	prism scene_1.lmml "$(LUMEN_WORKSPACE)/ws_select_map/ws_select_map.lm"
	@echo " done."
	@echo -n "Building ws_select_mii.lm..."
	prism scene_2.lmml "$(LUMEN_WORKSPACE)/ws_select_mii/ws_select_mii.lm"
	@echo " done."

	@echo -n "Packing..."
	cd "$(EXPLORER_PATH)"; Sm4shFileExplorer build $(NULL_OUTPUT)
	@echo " done."

.PHONY: all

$(VERBOSE).SILENT:
