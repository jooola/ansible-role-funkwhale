# Run all commands in a single shell
# See https://www.gnu.org/software/make/manual/html_node/One-Shell.html
.ONESHELL:
SHELL = bash
VENV = .venv

all: $(VENV)

venv: $(VENV)
$(VENV):
	python3 -m venv $(VENV)
	source $(VENV)/bin/activate
	pip install --upgrade pip wheel setuptools

install: $(VENV)
	source $(VENV)/bin/activate
	pip install -r requirements.txt
	ansible-galaxy install -r requirements.yml

test: $(VENV)
	source $(VENV)/bin/activate
	molecule test

clean:
	rm -Rf $(VENV)
