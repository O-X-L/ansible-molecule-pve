lint:
	pylint --rcfile .pylintrc --recursive=y .
	yamllint .
	ANSIBLE_LIBRARY=plugins/modules ansible-lint -c .ansible-lint.yml
