CC=gcc
NVCC=nvcc
CFLAGS=
BIN_DIR=bin/
CUDA_BIN_DIR=$(BIN_DIR)cuda/
SRC_DIR=src/
OBJ_DIR=obj/

OBJ=01_print.o 02_cuda.o
OBJS=$(addprefix $(OBJ_DIR), $(OBJ))
BIN=01_print
BINS=$(addprefix $(BIN_DIR), $(BIN))
CUDA_BIN=02_cuda
CUDA_BINS=$(addprefix $(CUDA_BIN_DIR), $(CUDA_BIN))

all: dirs obj bin

obj: $(OBJS)

bin: $(BINS) $(CUDA_BINS)

$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)%.o: $(SRC_DIR)%.cu
	$(NVCC) $(CFLAGS) -c $< -o $@

$(BIN_DIR)%: $(OBJ_DIR)%.o
	$(CC) $(CFLAGS) $< -o $@

$(CUDA_BIN_DIR)%: $(OBJ_DIR)%.o
	$(NVCC) $(CFLAGS) $< -o $@

dirs:
	@mkdir -p $(BIN_DIR) $(OBJ_DIR) $(CUDA_BIN_DIR)

clean:
	@rm -rf $(BIN_DIR) $(OBJ_DIR)
