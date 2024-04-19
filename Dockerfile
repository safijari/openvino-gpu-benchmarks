from ubuntu:22.04

run apt update && apt install python3 python3-pip -y

# https://docs.openvino.ai/2023.3/openvino_docs_install_guides_configurations_for_intel_gpu.html
run apt install -y gpg-agent wget

run apt install -y ocl-icd-libopencl1

run mkdir neo && cd neo
run wget https://github.com/intel/intel-graphics-compiler/releases/download/igc-1.0.16238.4/intel-igc-core_1.0.16238.4_amd64.deb
run wget https://github.com/intel/intel-graphics-compiler/releases/download/igc-1.0.16238.4/intel-igc-opencl_1.0.16238.4_amd64.deb
run wget https://github.com/intel/compute-runtime/releases/download/24.09.28717.12/intel-level-zero-gpu-dbgsym_1.3.28717.12_amd64.ddeb
run wget https://github.com/intel/compute-runtime/releases/download/24.09.28717.12/intel-level-zero-gpu_1.3.28717.12_amd64.deb
run wget https://github.com/intel/compute-runtime/releases/download/24.09.28717.12/intel-opencl-icd-dbgsym_24.09.28717.12_amd64.ddeb
run wget https://github.com/intel/compute-runtime/releases/download/24.09.28717.12/intel-opencl-icd_24.09.28717.12_amd64.deb
run wget https://github.com/intel/compute-runtime/releases/download/24.09.28717.12/libigdgmm12_22.3.17_amd64.deb

run dpkg -i *.deb

run pip install "openvino-dev>=2023.1.0"

run apt install intel-gpu-tools -y