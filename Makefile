TOPNAME = top
NXDC_FILES = constr/top.nxdc
INC_PATH ?=

VERILATOR = verilator
VSRCS = $(shell find $(abspath ./vsrc) -name "*.v")

SVSRCS = $(shell find $(abspath ./vsrc) -name "*.sv")

# $(error $(NVBOARD_HOME))
# NVBOARD_HOME = ../../nvboard/
######################### simulation code ###############################

GTKWAVE = gtkwave
SIM_VERILATOR_CFLAGS = --trace --cc --exe --build \
					--Wall --timing
SIM_CSRCS = $(abspath ./csrc/sim_main.cpp)
VCD_FILE = dump.vcd

# EXECUTABLE NAME: Vtop
EXECUTABLE = V$(TOPNAME)
# print variable name to debug
# $(error $(EXECUTABLE))

# $(error $(VERILATOR_CFLAGS))

# $(error $(SIM_CSRCS))

# only sim and see wave, if want to run on nvboard, use make run
sim:
	$(VERILATOR) $(SIM_VERILATOR_CFLAGS) $(SIM_CSRCS) $(VSRCS) $(SVSRCS) --top-module $(TOPNAME)
	./obj_dir/$(EXECUTABLE)
	$(GTKWAVE) $(VCD_FILE)

######################### run nvboard code ###############################


VERILATOR_CFLAGS += -MMD --build -cc  \
				-O3 --x-assign fast --x-initial fast --noassert


BUILD_DIR = ./build
OBJ_DIR = $(BUILD_DIR)/obj_dir
BIN = $(BUILD_DIR)/$(TOPNAME)

# $(error $(VERILATOR_CFLAGS))
default: $(BIN)

$(shell mkdir -p $(BUILD_DIR))

# constraint file

# $(error $(SRC_AUTO_BIND))

SRC_AUTO_BIND = $(abspath $(BUILD_DIR)/auto_bind.cpp)
$(SRC_AUTO_BIND): $(NXDC_FILES)
	python3 $(NVBOARD_HOME)/scripts/auto_pin_bind.py $^ $@

# CSRCS = $(abspath ./csrc/main.cpp)
CSRCS = $(shell find $(abspath ./csrc) -name "*.c" -or -name "*.cc" -or -name "main.cpp")
CSRCS += $(SRC_AUTO_BIND)
# $(error $(CSRCS))
	
include $(NVBOARD_HOME)/scripts/nvboard.mk

# $(error $(INC_PATH))
# rules for verilator
INCFLAGS = $(addprefix -I, $(INC_PATH))
CFLAGS += $(INCFLAGS) -DTOP_NAME="\"V$(TOPNAME)\""
LDFLAGS += -lSDL2 -lSDL2_image


# $(error $(OBJ_DIR))
# echo $(BIN)
# $(warning $(BIN))
# $(warning $(VSRCS))
# $(warning $(CSRCS))
# $(warning $(NVBOARD_ARCHIVE))
# $(warning $(OBJ_DIR))
# $(warning $(VERILATOR))
# $(warning $(VERILATOR_CFLAGS))
# $(warning $(TOPNAME))
# $(warning $(CFLAGS))
# $(warning $(LDFLAGS))

# their
$(BIN): $(VSRCS) $(CSRCS) $(NVBOARD_ARCHIVE)
	@rm -rf $(OBJ_DIR)
	$(VERILATOR) $(VERILATOR_CFLAGS) \
		--top-module $(TOPNAME) $^ \
		$(addprefix -CFLAGS , $(CFLAGS)) $(addprefix -LDFLAGS , $(LDFLAGS)) \
		--Mdir $(OBJ_DIR) --exe -o $(abspath $(BIN))


# my: An extra space after "\", makes it doesn't work.
# $(BIN): $(VSRCS) $(CSRCS) $(NVBOARD_ARCHIVE)
# 	@rm -rf $(OBJ_DIR)
# 	$(VERILATOR) $(VERILATOR_CFLAGS) \
# 		--top-module $(TOPNAME) $^ \ 
# 		$(addprefix -CFLAGS , $(CFLAGS)) $(addprefix -LDFLAGS , $(LDFLAGS)) \
# 		--Mdir $(OBJ_DIR) --exe -o $(abspath $(BIN))


all: default

# run on nvborad
run: $(BIN)
	@$^

########################### others #######################################

clean:
	rm -rf obj_dir *.vcd $(BUILD_DIR)
# clean:
# rm -rf $(BUILD_DIR)


.PHONY: default all clean run
