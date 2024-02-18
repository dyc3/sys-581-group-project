all:
	./scripts/generate-changelog.sh > changelog.csv
	typst compile main.typ main.pdf

clean:
	rm *.pdf

figures:
	./scripts/render-figures.sh

full: figures all

storyboard:
	typst compile storyboard.typ storyboard.pdf

.PHONY: all clean figures full storyboard
