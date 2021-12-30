.PHONY: setup desktop desktop-*

CHECk =
ifdef CHECK
CHECK = --check
endif

PYTHON_VENV		?= venv
PYTHON_BIN		?= $(CURDIR)/$(PYTHON_VENV)/bin/python3
PYTHON_SOURCE	?= . $(CURDIR)/$(PYTHON_VENV)/bin/activate

.PHONY : setup/apt
setup/apt:
	apt-get install -y python3-apt python3-venv

.PHONY : version
version:
	@ansible --version

venv:
	@(python3 -m venv $(PYTHON_VENV))
	@(	\
		$(PYTHON_SOURCE); \
		python --version; \
		pip --version; \
		pip install --upgrade \
			pip \
			wheel; \
		pip --version; \
	)

.PHONY : setup/venv
setup/venv: venv

.PHONY : setup/python
setup/python: setup/venv
	@(	\
		$(PYTHON_SOURCE); \
		python --version; \
		pip --version; \
		pip install \
		--upgrade \
		--requirement $(CURDIR)/ansible-requirements.txt; \
	)

.PHONY : setup/ansible
setup/ansible: setup/python
	@(	\
		$(PYTHON_SOURCE); \
		python --version; \
		pip --version; \
	)

.PHONY : setup
setup: setup/ansible

.PHONY : lint
lint:
	@(	\
		$(PYTHON_SOURCE); \
		yamllint .; \
		ansible-lint .; \
	)

.PHONY : test
test:
	@(	\
		$(PYTHON_SOURCE); \
		molecule test; \
	)
