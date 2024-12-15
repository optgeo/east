# Makefile for extracting specific regions from multiple pmtiles files

# Common Variables
BBOX=122,-12,156,0

# Variables for planet.pmtiles
PLANET_URL=https://tile.openstreetmap.jp/static/planet.pmtiles
PLANET_OUTPUT=public/pmtiles/planet_subset.pmtiles

# Variables for gel.pmtiles
GEL_URL=https://data.source.coop/smartmaps/gel/gel.pmtiles
GEL_OUTPUT=public/pmtiles/gel_subset.pmtiles

# Variables for terrain22.pmtiles
T22_URL=https://data.source.coop/smartmaps/foil4gr1/terrain22.pmtiles
T22_OUTPUT=public/pmtiles/t22_subset.pmtiles

# Variables for kpop.pmtiles
KPOP_URL=https://data.source.coop/smartmaps/foil4gr1/kpop.pmtiles
KPOP_OUTPUT=public/pmtiles/kpop_subset.pmtiles

# Default target
all: extract_planet extract_gel extract_t22 extract_kpop

# Target to extract planet.pmtiles
extract_planet:
	@echo "Extracting tiles from $(PLANET_URL) to $(PLANET_OUTPUT) with bbox $(BBOX)"
	pmtiles extract $(PLANET_URL) $(PLANET_OUTPUT) --bbox=$(BBOX)

# Target to extract gel.pmtiles
extract_gel:
	@echo "Extracting tiles from $(GEL_URL) to $(GEL_OUTPUT) with bbox $(BBOX)"
	pmtiles extract $(GEL_URL) $(GEL_OUTPUT) --bbox=$(BBOX)

# Target to extract terrain22.pmtiles
extract_t22:
	@echo "Extracting tiles from $(T22_URL) to $(T22_OUTPUT) with bbox $(BBOX)"
	pmtiles extract $(T22_URL) $(T22_OUTPUT) --bbox=$(BBOX)

# Target to extract kpop.pmtiles
extract_kpop:
	@echo "Extracting tiles from $(KPOP_URL) to $(KPOP_OUTPUT) with bbox $(BBOX)"
	pmtiles extract $(KPOP_URL) $(KPOP_OUTPUT) --bbox=$(BBOX)

# Target to clean generated files
clean:
	@echo "Cleaning up generated files"
	rm -f $(PLANET_OUTPUT) $(GEL_OUTPUT) $(T22_OUTPUT) $(KPOP_OUTPUT)

# Target to check the extracted files
show_planet:
	@echo "Showing details of $(PLANET_OUTPUT)"
	pmtiles show $(PLANET_OUTPUT)

show_gel:
	@echo "Showing details of $(GEL_OUTPUT)"
	pmtiles show $(GEL_OUTPUT)

show_t22:
	@echo "Showing details of $(T22_OUTPUT)"
	pmtiles show $(T22_OUTPUT)

show_kpop:
	@echo "Showing details fo $(KPOP_OUTPUT)"
	pmtiles show $(KPOP_OUTPUT)

# Phony targets
.PHONY: all extract_planet extract_gel extract_t22 extract_kpop clean show_planet show_gel show_t22 show_kpop

