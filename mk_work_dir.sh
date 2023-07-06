# enter one lab directory and run this shell script, it
# will make work directory for you automatically.
# for example: ../mk_work_dir.sh alu

mkdir $1
cd $1

CWD=$(pwd)
cons_dir=$CWD"/constr"
csrc_dir=$CWD"/csrc"
vsrc_dir=$CWD"/vsrc"

mkdir $cons_dir && cd $cons_dir
touch top.nxdc
echo "top=top" > top.nxdc
cd $CWD

mkdir $vsrc_dir && cd $vsrc_dir
touch top.v
cd $CWD

mkdir $csrc_dir && cd $csrc_dir
touch main.cpp
touch sim_main.cpp
# use escape charactor \ to input the quotatio mark(") to file.
echo "#include \"verilated.h\"
#include \"verilated_vcd_c.h\"
#include \"../obj_dir/Vtop.h\"
#include <iostream>
#include <iomanip>

using std::cout;
using std::endl;

VerilatedContext* contextp = NULL;
VerilatedVcdC* tfp = NULL;

static Vtop* top;

void step_and_dump_wave(){
  top->eval();
  contextp->timeInc(1);
  tfp->dump(contextp->time());
}
void sim_init(){
  contextp = new VerilatedContext;
  tfp = new VerilatedVcdC;
  top = new Vtop;
  contextp->traceEverOn(true);
  top->trace(tfp, 0);
  tfp->open(\"dump.vcd\");
}

void sim_exit(){
  step_and_dump_wave();
  tfp->close();
}

int main() {
  sim_init();
  /* write your simulation code below */

  sim_exit();
}" > sim_main.cpp
cd $CWD

echo "include ../../Makefile" > Makefile
touch log.md