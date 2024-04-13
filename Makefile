container:
	docker build -t openvino-gpu-benchmark .

test-gpu: container
	docker run --rm -it --device /dev/dri:/dev/dri openvino-gpu-benchmark python3 -c 'import openvino as ov; core = ov.Core(); print(core.available_devices)'