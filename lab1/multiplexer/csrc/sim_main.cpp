#include "verilated.h"
#include "verilated_vcd_c.h"
#include "../obj_dir/Vtop.h"
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
  tfp->open("dump.vcd");
}

void sim_exit(){
  step_and_dump_wave();
  tfp->close();
}

int main() {
  sim_init();
  /* write your simulation code below */
  top->io_x0 = 0;
  top->io_x1 = 1;
  top->io_x2 = 2;
  top->io_x3 = 3;

  top->io_y = 0;
  step_and_dump_wave();
  top->io_y = 1;
  step_and_dump_wave();
  top->io_y = 2;
  step_and_dump_wave();
  top->io_y = 3;
  step_and_dump_wave();

  sim_exit();
}
