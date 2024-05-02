# Mars Communication, Command, and Control (C3) Architecture

This repository contains the source code a document describing a hypothetical Mars Communication, Command, and Control (C3) architecture. The document is written in [typst](https://typst.app), and was created as a group project for SYS 581 Intro to Systems course at Stevens Institute of Technology.

## Setup

1. Install [typst](https://typst.app)
2. Install [mermaid-cli](https://github.com/mermaid-js/mermaid-cli) (requires node.js)
```
npm install -g @mermaid-js/mermaid-cli@10.6.1
```
Note: Running in WSL may require some additional setup for mermaid to work. See: https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#running-puppeteer-on-wsl-windows-subsystem-for-linux

## Usage

if you have `just` installed, you can run these:

```bash
# build the document
just build

# rerender all figures
just figures

# build the document in watch mode (rebuilds on file changes)
just watch
```

if you have `make` installed, you can run these:

```bash
# build the document
make

# rerender all figures
make figures
```

Otherwise, you can run the commands in the `makefile` manually.

```bash
# produces main.pdf
typst compile main.typ

# rerenders all figures
./scripts/render-figures.sh
```
