registry="docker.io"
version="2.0.0"
maintainer="jayjohnson"
basename="jupyter/scipy-notebook"
imagename="jupyter"

export ENV_PROJ_DIR="/opt/project"
export ENV_DATA_DIR="/opt/work/data"
export ENV_DATA_SRC_DIR="/opt/work/data/src"
export ENV_DATA_DST_DIR="/opt/work/data/dst"

# Allow running starters from outside the container
export ENV_DATA_BIN_DIR="/opt/work/data/bin"
export ENV_PRESTART_SCRIPT="/opt/containerfiles/pre-start-notebook.sh"
export ENV_START_SCRIPT="/opt/containerfiles/start-notebook.sh"
export ENV_POSTSTART_SCRIPT="/opt/containerfiles/post-start-notebook.sh"

export ENV_DEPLOYMENT_TYPE="Local"
export ENV_REDIS_HOST="localhost"
export ENV_REDIS_PORT="6000"
export ENV_REDIS_SRC_KEY="JUPYTER_SRC_KEY"
export ENV_REDIS_DST_KEY="JUPYTER_DST_KEY"

export ENV_SYNTHESIZE_DIR="/opt/work/data/synthesize"
export ENV_SYNTHESIZE_BIN="/opt/containerfiles/synthesize.sh"
export ENV_TIDY_DIR="/opt/work/data/tidy"
export ENV_TIDY_BIN="/opt/containerfiles/tidy.sh"
export ENV_ANALYZE_DIR="/opt/work/data/analyze"
export ENV_ANALYZE_BIN="/opt/containerfiles/analzye.sh"
export ENV_OUTPUT_DIR="/opt/work/data/output"
export ENV_OUTPUT_BIN="/opt/containerfiles/output-model.sh"
export ENV_REDIS_MODEL_OUT_BIN="/opt/containerfiles/redis-model.sh"
export ENV_REDIS_MODEL_DST_KEY="JUPYTER_REDIS_MODEL_DST_KEY"

if [[ "${PYTHONPATH}" == "" ]]; then
    export PYTHONPATH=/opt/work
else
    export PYTHONPATH=${PYTHONPATH}:/opt/work
fi

