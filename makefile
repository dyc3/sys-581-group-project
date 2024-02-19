all:
	./scripts/generate-changelog.sh > changelog.csv
	typst compile --font-path ./fonts main.typ main.pdf

clean:
	rm *.pdf

figures:
	./scripts/render-figures.sh

full: figures all

storyboard:
	typst compile --font-path ./fonts storyboard.typ storyboard.pdf

.PHONY: all clean figures full storyboard
