# Rebuild everything from the raw data:  make all
# Test the script on the invented data:  make mock

DATA ?= data/raw/survey.csv
OUT  ?= results

.PHONY: all mock clean check run

all: clean check run

mock:
	@$(MAKE) --no-print-directory run DATA=data/mock/survey_mock.csv OUT=data/derived/mock-results

clean:
	rm -rf data/derived
	rm -f results/*.csv

check:
	@if command -v sha256sum >/dev/null 2>&1; then sha256sum -c data/raw.sha256; \
	else shasum -a 256 -c data/raw.sha256; fi

run:
	@mkdir -p $(OUT) data/derived
	@if [ -f analysis/run_all.R ]; then Rscript analysis/run_all.R $(DATA) $(OUT); \
	elif [ -f analysis/run_all.py ]; then python3 analysis/run_all.py $(DATA) $(OUT); \
	else echo "No analysis/run_all.R or analysis/run_all.py yet."; exit 1; fi
