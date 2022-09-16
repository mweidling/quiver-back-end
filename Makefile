dependencies: init
	rm data/deps.json data/dep_conflicts.json || echo "No data to delete. Continue JSON creation."
	bash dependencies.sh
	python3 quiver/dependencies.py

.PHONY: repos.json
repos.json: dependencies
	quiver-ocrd repo json > "$@"

init:
	git submodule update --init
	git submodule foreach --recursive 'git submodule update --init' || echo 0
