#include <stdio.h>
#include <iostream>
#include <assert.h>
#include "circom.hpp"
#include "calcwit.hpp"
void state_transition_0_create(uint soffset,uint coffset,Circom_CalcWit* ctx,std::string componentName,uint componentFather);
void state_transition_0_run(uint ctx_index,Circom_CalcWit* ctx);
Circom_TemplateFunction _functionTable[1] = { 
state_transition_0_run };
Circom_TemplateFunction _functionTableParallel[1] = { 
NULL };
uint get_main_input_signal_start() {return 1;}

uint get_main_input_signal_no() {return 95;}

uint get_total_signal_no() {return 96;}

uint get_number_of_components() {return 1;}

uint get_size_of_input_hashmap() {return 256;}

uint get_size_of_witness() {return 1;}

uint get_size_of_constants() {return 9;}

uint get_size_of_io_map() {return 0;}

void release_memory_component(Circom_CalcWit* ctx, uint pos) {{

if (pos != 0){{

if(ctx->componentMemory[pos].subcomponents)
delete []ctx->componentMemory[pos].subcomponents;

if(ctx->componentMemory[pos].subcomponentsParallel)
delete []ctx->componentMemory[pos].subcomponentsParallel;

if(ctx->componentMemory[pos].outputIsSet)
delete []ctx->componentMemory[pos].outputIsSet;

if(ctx->componentMemory[pos].mutexes)
delete []ctx->componentMemory[pos].mutexes;

if(ctx->componentMemory[pos].cvs)
delete []ctx->componentMemory[pos].cvs;

if(ctx->componentMemory[pos].sbct)
delete []ctx->componentMemory[pos].sbct;

}}


}}


// function declarations
// template declarations
void state_transition_0_create(uint soffset,uint coffset,Circom_CalcWit* ctx,std::string componentName,uint componentFather){
ctx->componentMemory[coffset].templateId = 0;
ctx->componentMemory[coffset].templateName = "state_transition";
ctx->componentMemory[coffset].signalStart = soffset;
ctx->componentMemory[coffset].inputCounter = 95;
ctx->componentMemory[coffset].componentName = componentName;
ctx->componentMemory[coffset].idFather = componentFather;
ctx->componentMemory[coffset].subcomponents = new uint[0];
}

void state_transition_0_run(uint ctx_index,Circom_CalcWit* ctx){
FrElement* signalValues = ctx->signalValues;
u64 mySignalStart = ctx->componentMemory[ctx_index].signalStart;
std::string myTemplateName = ctx->componentMemory[ctx_index].templateName;
std::string myComponentName = ctx->componentMemory[ctx_index].componentName;
u64 myFather = ctx->componentMemory[ctx_index].idFather;
u64 myId = ctx_index;
u32* mySubcomponents = ctx->componentMemory[ctx_index].subcomponents;
bool* mySubcomponentsParallel = ctx->componentMemory[ctx_index].subcomponentsParallel;
FrElement* circuitConstants = ctx->circuitConstants;
std::string* listOfTemplateMessages = ctx->listOfTemplateMessages;
FrElement expaux[5];
FrElement lvar[21];
uint sub_component_aux;
uint index_multiple_eq;
{
PFrElement aux_dest = &lvar[0];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[1];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[2];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[3];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[4];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[5];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[6];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[7];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[8];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[9];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[10];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[11];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[12];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[13];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[14];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
Fr_lt(&expaux[0],&lvar[14],&circuitConstants[5]); // line circom 28
while(Fr_isTrue(&expaux[0])){
{
PFrElement aux_dest = &lvar[((1 * Fr_toInt(&lvar[14])) + 0)];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[((1 * Fr_toInt(&lvar[14])) + 5)];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[14];
// load src
Fr_add(&expaux[0],&lvar[14],&circuitConstants[1]); // line circom 28
// end load src
Fr_copy(aux_dest,&expaux[0]);
}
Fr_lt(&expaux[0],&lvar[14],&circuitConstants[5]); // line circom 28
}
{
PFrElement aux_dest = &lvar[14];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
Fr_lt(&expaux[0],&lvar[14],&circuitConstants[5]); // line circom 33
while(Fr_isTrue(&expaux[0])){
{
PFrElement aux_dest = &lvar[15];
// load src
Fr_mul(&expaux[0],&lvar[14],&circuitConstants[6]); // line circom 35
// end load src
Fr_copy(aux_dest,&expaux[0]);
}
{
PFrElement aux_dest = &lvar[16];
// load src
Fr_add(&expaux[0],&lvar[15],&circuitConstants[5]); // line circom 36
// end load src
Fr_copy(aux_dest,&expaux[0]);
}
{
PFrElement aux_dest = &lvar[17];
// load src
Fr_add(&expaux[0],&circuitConstants[7],&lvar[14]); // line circom 37
// end load src
Fr_copy(aux_dest,&expaux[0]);
}
{
PFrElement aux_dest = &lvar[18];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
Fr_lt(&expaux[0],&lvar[18],&circuitConstants[5]); // line circom 48
while(Fr_isTrue(&expaux[0])){
{
PFrElement aux_dest = &lvar[19];
// load src
// end load src
Fr_copy(aux_dest,&signalValues[mySignalStart + ((1 * (Fr_toInt(&lvar[15]) + Fr_toInt(&lvar[18]))) + 20)]);
}
{
PFrElement aux_dest = &lvar[20];
// load src
// end load src
Fr_copy(aux_dest,&signalValues[mySignalStart + ((1 * (Fr_toInt(&lvar[16]) + Fr_toInt(&lvar[18]))) + 20)]);
}
Fr_eq(&expaux[0],&lvar[14],&lvar[18]); // line circom 53
if(Fr_isTrue(&expaux[0])){
Fr_eq(&expaux[0],&lvar[19],&circuitConstants[0]); // line circom 54
if (!Fr_isTrue(&expaux[0])) std::cout << "Failed assert in template/function " << myTemplateName << " line 54. " <<  "Followed trace of components: " << ctx->getTrace(myId) << std::endl;
assert(Fr_isTrue(&expaux[0]));
Fr_eq(&expaux[0],&lvar[20],&circuitConstants[0]); // line circom 55
if (!Fr_isTrue(&expaux[0])) std::cout << "Failed assert in template/function " << myTemplateName << " line 55. " <<  "Followed trace of components: " << ctx->getTrace(myId) << std::endl;
assert(Fr_isTrue(&expaux[0]));
}
Fr_eq(&expaux[0],&signalValues[mySignalStart + ((1 * Fr_toInt(&lvar[18])) + 0)],&circuitConstants[0]); // line circom 59
if(Fr_isTrue(&expaux[0])){
Fr_eq(&expaux[0],&lvar[19],&circuitConstants[0]); // line circom 60
if (!Fr_isTrue(&expaux[0])) std::cout << "Failed assert in template/function " << myTemplateName << " line 60. " <<  "Followed trace of components: " << ctx->getTrace(myId) << std::endl;
assert(Fr_isTrue(&expaux[0]));
Fr_eq(&expaux[0],&lvar[20],&circuitConstants[0]); // line circom 61
if (!Fr_isTrue(&expaux[0])) std::cout << "Failed assert in template/function " << myTemplateName << " line 61. " <<  "Followed trace of components: " << ctx->getTrace(myId) << std::endl;
assert(Fr_isTrue(&expaux[0]));
}
Fr_neq(&expaux[2],&signalValues[mySignalStart + ((1 * Fr_toInt(&lvar[14])) + 0)],&circuitConstants[0]); // line circom 65
Fr_land(&expaux[0],&circuitConstants[1],&expaux[2]); // line circom 65
if(Fr_isTrue(&expaux[0])){
{
PFrElement aux_dest = &lvar[((1 * Fr_toInt(&lvar[18])) + 0)];
// load src
Fr_add(&expaux[0],&lvar[((1 * Fr_toInt(&lvar[18])) + 0)],&lvar[19]); // line circom 66
// end load src
Fr_copy(aux_dest,&expaux[0]);
}
{
PFrElement aux_dest = &lvar[((1 * Fr_toInt(&lvar[18])) + 5)];
// load src
Fr_add(&expaux[0],&lvar[((1 * Fr_toInt(&lvar[18])) + 5)],&lvar[20]); // line circom 67
// end load src
Fr_copy(aux_dest,&expaux[0]);
}
}
{
PFrElement aux_dest = &lvar[18];
// load src
Fr_add(&expaux[0],&lvar[18],&circuitConstants[1]); // line circom 48
// end load src
Fr_copy(aux_dest,&expaux[0]);
}
Fr_lt(&expaux[0],&lvar[18],&circuitConstants[5]); // line circom 48
}
{
PFrElement aux_dest = &lvar[14];
// load src
Fr_add(&expaux[0],&lvar[14],&circuitConstants[1]); // line circom 33
// end load src
Fr_copy(aux_dest,&expaux[0]);
}
Fr_lt(&expaux[0],&lvar[14],&circuitConstants[5]); // line circom 33
}
{
PFrElement aux_dest = &lvar[12];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[13];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[10];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[11];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
{
PFrElement aux_dest = &lvar[14];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
Fr_lt(&expaux[0],&lvar[14],&circuitConstants[5]); // line circom 77
while(Fr_isTrue(&expaux[0])){
Fr_leq(&expaux[0],&lvar[((1 * Fr_toInt(&lvar[14])) + 0)],&signalValues[mySignalStart + ((1 * Fr_toInt(&lvar[14])) + 5)]); // line circom 79
if (!Fr_isTrue(&expaux[0])) std::cout << "Failed assert in template/function " << myTemplateName << " line 79. " <<  "Followed trace of components: " << ctx->getTrace(myId) << std::endl;
assert(Fr_isTrue(&expaux[0]));
Fr_leq(&expaux[0],&lvar[((1 * Fr_toInt(&lvar[14])) + 5)],&signalValues[mySignalStart + ((1 * Fr_toInt(&lvar[14])) + 10)]); // line circom 80
if (!Fr_isTrue(&expaux[0])) std::cout << "Failed assert in template/function " << myTemplateName << " line 80. " <<  "Followed trace of components: " << ctx->getTrace(myId) << std::endl;
assert(Fr_isTrue(&expaux[0]));
Fr_add(&expaux[1],&lvar[((1 * Fr_toInt(&lvar[14])) + 0)],&lvar[((1 * Fr_toInt(&lvar[14])) + 5)]); // line circom 83
Fr_gt(&expaux[0],&expaux[1],&lvar[12]); // line circom 83
if(Fr_isTrue(&expaux[0])){
{
PFrElement aux_dest = &lvar[12];
// load src
Fr_add(&expaux[0],&lvar[((1 * Fr_toInt(&lvar[14])) + 0)],&lvar[((1 * Fr_toInt(&lvar[14])) + 5)]); // line circom 84
// end load src
Fr_copy(aux_dest,&expaux[0]);
}
{
PFrElement aux_dest = &lvar[10];
// load src
// end load src
Fr_copy(aux_dest,&lvar[14]);
}
}
Fr_sub(&expaux[2],&circuitConstants[4],&lvar[14]); // line circom 88
Fr_sub(&expaux[3],&circuitConstants[4],&lvar[14]); // line circom 88
Fr_add(&expaux[1],&lvar[((1 * Fr_toInt(&expaux[2])) + 0)],&lvar[((1 * Fr_toInt(&expaux[3])) + 5)]); // line circom 88
Fr_gt(&expaux[0],&expaux[1],&lvar[13]); // line circom 88
if(Fr_isTrue(&expaux[0])){
{
PFrElement aux_dest = &lvar[13];
// load src
Fr_add(&expaux[0],&lvar[((1 * Fr_toInt(&lvar[14])) + 0)],&lvar[((1 * Fr_toInt(&lvar[14])) + 5)]); // line circom 89
// end load src
Fr_copy(aux_dest,&expaux[0]);
}
{
PFrElement aux_dest = &lvar[11];
// load src
// end load src
Fr_copy(aux_dest,&lvar[14]);
}
}
{
PFrElement aux_dest = &lvar[14];
// load src
Fr_add(&expaux[0],&lvar[14],&circuitConstants[1]); // line circom 77
// end load src
Fr_copy(aux_dest,&expaux[0]);
}
Fr_lt(&expaux[0],&lvar[14],&circuitConstants[5]); // line circom 77
}
Fr_neq(&expaux[0],&lvar[10],&lvar[11]); // line circom 94
if(Fr_isTrue(&expaux[0])){
{
PFrElement aux_dest = &lvar[10];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[8]);
}
{
PFrElement aux_dest = &lvar[11];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[8]);
}
}
{
PFrElement aux_dest = &lvar[14];
// load src
// end load src
Fr_copy(aux_dest,&circuitConstants[0]);
}
Fr_lt(&expaux[0],&lvar[14],&circuitConstants[5]); // line circom 101
while(Fr_isTrue(&expaux[0])){
Fr_neq(&expaux[0],&lvar[14],&lvar[11]); // line circom 102
if(Fr_isTrue(&expaux[0])){
Fr_eq(&expaux[0],&signalValues[mySignalStart + ((1 * Fr_toInt(&lvar[14])) + 75)],&signalValues[mySignalStart + ((1 * Fr_toInt(&lvar[14])) + 0)]); // line circom 103
if (!Fr_isTrue(&expaux[0])) std::cout << "Failed assert in template/function " << myTemplateName << " line 103. " <<  "Followed trace of components: " << ctx->getTrace(myId) << std::endl;
assert(Fr_isTrue(&expaux[0]));
}else{
Fr_eq(&expaux[0],&signalValues[mySignalStart + ((1 * Fr_toInt(&lvar[14])) + 75)],&circuitConstants[0]); // line circom 105
if (!Fr_isTrue(&expaux[0])) std::cout << "Failed assert in template/function " << myTemplateName << " line 105. " <<  "Followed trace of components: " << ctx->getTrace(myId) << std::endl;
assert(Fr_isTrue(&expaux[0]));
}
Fr_eq(&expaux[0],&signalValues[mySignalStart + ((1 * Fr_toInt(&lvar[14])) + 80)],&signalValues[mySignalStart + ((1 * Fr_toInt(&lvar[14])) + 5)]); // line circom 107
if (!Fr_isTrue(&expaux[0])) std::cout << "Failed assert in template/function " << myTemplateName << " line 107. " <<  "Followed trace of components: " << ctx->getTrace(myId) << std::endl;
assert(Fr_isTrue(&expaux[0]));
Fr_eq(&expaux[0],&signalValues[mySignalStart + ((1 * Fr_toInt(&lvar[14])) + 85)],&signalValues[mySignalStart + ((1 * Fr_toInt(&lvar[14])) + 10)]); // line circom 108
if (!Fr_isTrue(&expaux[0])) std::cout << "Failed assert in template/function " << myTemplateName << " line 108. " <<  "Followed trace of components: " << ctx->getTrace(myId) << std::endl;
assert(Fr_isTrue(&expaux[0]));
Fr_eq(&expaux[0],&signalValues[mySignalStart + ((1 * Fr_toInt(&lvar[14])) + 90)],&signalValues[mySignalStart + ((1 * Fr_toInt(&lvar[14])) + 15)]); // line circom 109
if (!Fr_isTrue(&expaux[0])) std::cout << "Failed assert in template/function " << myTemplateName << " line 109. " <<  "Followed trace of components: " << ctx->getTrace(myId) << std::endl;
assert(Fr_isTrue(&expaux[0]));
{
PFrElement aux_dest = &lvar[14];
// load src
Fr_add(&expaux[0],&lvar[14],&circuitConstants[1]); // line circom 101
// end load src
Fr_copy(aux_dest,&expaux[0]);
}
Fr_lt(&expaux[0],&lvar[14],&circuitConstants[5]); // line circom 101
}
for (uint i = 0; i < 0; i++){
uint index_subc = ctx->componentMemory[ctx_index].subcomponents[i];
if (index_subc != 0)release_memory_component(ctx,index_subc);
}
}

void run(Circom_CalcWit* ctx){
state_transition_0_create(1,0,ctx,"main",0);
state_transition_0_run(0,ctx);
}
