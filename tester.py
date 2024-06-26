import numpy as np
from openvino import Core
import time


def main():
    ie = Core()
    devices = ie.available_devices
    assert "GPU" in devices, "GPU not available to openvino"
    net = ie.read_model("/model")
    model = ie.compile_model(model=net, device_name="GPU")

    ii = model.input(0)
    print(f"loaded model, {ii}")

    shape = [s for s in ii.shape]

    while True:
        start = time.time()
        for i in range(100):
            dummy_data = np.random.rand(*shape)
            res = model([dummy_data])
        print(f"Time taken for 100 runs: {time.time() - start}, FPS is {100/(time.time() - start)}")


if __name__ == "__main__":
    main()
