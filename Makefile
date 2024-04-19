CMD_PRE=docker run --privileged=true --rm -it --device /dev/dri:/dev/dri
CMD_POST=openvino-gpu-benchmark
CMD=$(CMD_PRE) $(CMD_POST)
container:
	docker build -t openvino-gpu-benchmark .

test-gpu: container
	$(CMD) python3 -c 'import openvino as ov; core = ov.Core(); print(core.available_devices)'

shell: container
	$(CMD) bash

tester: container
	# $(CMD_PRE) -v $(MODEL_PATH):/model -v `pwd`:/code $(CMD_POST) python3 /code/tester.py
	$(CMD_PRE) -v $(MODEL_PATH):/model -v `pwd`:/code $(CMD_POST) bash