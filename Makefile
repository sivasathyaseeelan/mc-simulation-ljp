check_file:
	@if [ -e ./output/energy.csv ]; then \
		echo "\nFile ./output/energy.csv exists\n"; \
	else \
		echo "\nError ./output/energy.csv does not exist\n\nRun make simulate or make simulate-and-plot\n"; \
		exit 1; \
	fi

simulate:
	@echo "\nStarting the simulation...\n"
	python3 main.py
	@echo "\n\nSimulation is completed and energy.csv is created in output directory\n"

plot-graph:
	@echo "\nGraph is ploted!!!\n"
	python3 plot.py
	@echo "\nExiting Graph\n"

plot:
	make check_file && make plot-graph

simulate-and-plot:
	make simulate && make plot