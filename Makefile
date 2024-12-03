# Variables
PYTHON_SCRIPT=python scripts/generate_figures.py
INPUT_FILE=data/00030067-eng.csv
OUTPUT_DIR=results
QMD_FILE=reports/qmd_example.qmd
HTML_OUTPUT=html
PDF_OUTPUT=pdf

# Targets
all: generate_figures render_html render_pdf

generate_figures:
	$(PYTHON_SCRIPT) --input_dir="$(INPUT_FILE)" --out_dir="$(OUTPUT_DIR)"

render_html:
	quarto render $(QMD_FILE) --to $(HTML_OUTPUT)

render_pdf:
	quarto render $(QMD_FILE) --to $(PDF_OUTPUT)

clean:
	rm -rf $(OUTPUT_DIR)/*.png $(QMD_FILE:.qmd=.html) $(QMD_FILE:.qmd=.pdf)

.PHONY: all generate_figures render_html render_pdf clean
