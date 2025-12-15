#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/CSFINALPROJECT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/CSFINALPROJECT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=FINAL_MAIN.c HCSR04_MODULE.c MOTOR_MODULE.c POTENTIOMETER_MODULE.c UART_MODULE.c SERVOS_MODULE.c PIC32INI.c DELAYS.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/FINAL_MAIN.o ${OBJECTDIR}/HCSR04_MODULE.o ${OBJECTDIR}/MOTOR_MODULE.o ${OBJECTDIR}/POTENTIOMETER_MODULE.o ${OBJECTDIR}/UART_MODULE.o ${OBJECTDIR}/SERVOS_MODULE.o ${OBJECTDIR}/PIC32INI.o ${OBJECTDIR}/DELAYS.o
POSSIBLE_DEPFILES=${OBJECTDIR}/FINAL_MAIN.o.d ${OBJECTDIR}/HCSR04_MODULE.o.d ${OBJECTDIR}/MOTOR_MODULE.o.d ${OBJECTDIR}/POTENTIOMETER_MODULE.o.d ${OBJECTDIR}/UART_MODULE.o.d ${OBJECTDIR}/SERVOS_MODULE.o.d ${OBJECTDIR}/PIC32INI.o.d ${OBJECTDIR}/DELAYS.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/FINAL_MAIN.o ${OBJECTDIR}/HCSR04_MODULE.o ${OBJECTDIR}/MOTOR_MODULE.o ${OBJECTDIR}/POTENTIOMETER_MODULE.o ${OBJECTDIR}/UART_MODULE.o ${OBJECTDIR}/SERVOS_MODULE.o ${OBJECTDIR}/PIC32INI.o ${OBJECTDIR}/DELAYS.o

# Source Files
SOURCEFILES=FINAL_MAIN.c HCSR04_MODULE.c MOTOR_MODULE.c POTENTIOMETER_MODULE.c UART_MODULE.c SERVOS_MODULE.c PIC32INI.c DELAYS.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/CSFINALPROJECT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX230F064D
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/FINAL_MAIN.o: FINAL_MAIN.c  .generated_files/flags/default/159ac631e376266b308f871e210d83ad8c476dbf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FINAL_MAIN.o.d 
	@${RM} ${OBJECTDIR}/FINAL_MAIN.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FINAL_MAIN.o.d" -o ${OBJECTDIR}/FINAL_MAIN.o FINAL_MAIN.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/HCSR04_MODULE.o: HCSR04_MODULE.c  .generated_files/flags/default/2a820caef554b3fef4ea882a61f84de040e66c1a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HCSR04_MODULE.o.d 
	@${RM} ${OBJECTDIR}/HCSR04_MODULE.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/HCSR04_MODULE.o.d" -o ${OBJECTDIR}/HCSR04_MODULE.o HCSR04_MODULE.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/MOTOR_MODULE.o: MOTOR_MODULE.c  .generated_files/flags/default/122f23da78704386fa35c59116253be5ffc963d3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MOTOR_MODULE.o.d 
	@${RM} ${OBJECTDIR}/MOTOR_MODULE.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/MOTOR_MODULE.o.d" -o ${OBJECTDIR}/MOTOR_MODULE.o MOTOR_MODULE.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/POTENTIOMETER_MODULE.o: POTENTIOMETER_MODULE.c  .generated_files/flags/default/1418f5c2ae5d066d1ef911752c776b091aee172a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/POTENTIOMETER_MODULE.o.d 
	@${RM} ${OBJECTDIR}/POTENTIOMETER_MODULE.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/POTENTIOMETER_MODULE.o.d" -o ${OBJECTDIR}/POTENTIOMETER_MODULE.o POTENTIOMETER_MODULE.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/UART_MODULE.o: UART_MODULE.c  .generated_files/flags/default/dc608383d567888d122a1cac10e8172341f6d113 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART_MODULE.o.d 
	@${RM} ${OBJECTDIR}/UART_MODULE.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/UART_MODULE.o.d" -o ${OBJECTDIR}/UART_MODULE.o UART_MODULE.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SERVOS_MODULE.o: SERVOS_MODULE.c  .generated_files/flags/default/86fac2f5cc6ef216d58c37a9ed6c8c3ddfec369 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SERVOS_MODULE.o.d 
	@${RM} ${OBJECTDIR}/SERVOS_MODULE.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SERVOS_MODULE.o.d" -o ${OBJECTDIR}/SERVOS_MODULE.o SERVOS_MODULE.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/PIC32INI.o: PIC32INI.c  .generated_files/flags/default/3854c2aa6aab2e2649bd62b37fc4fc982b5e9d62 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PIC32INI.o.d 
	@${RM} ${OBJECTDIR}/PIC32INI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/PIC32INI.o.d" -o ${OBJECTDIR}/PIC32INI.o PIC32INI.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/DELAYS.o: DELAYS.c  .generated_files/flags/default/b81792f40b6081823d4666c9b049cb471d4083ae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DELAYS.o.d 
	@${RM} ${OBJECTDIR}/DELAYS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/DELAYS.o.d" -o ${OBJECTDIR}/DELAYS.o DELAYS.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/FINAL_MAIN.o: FINAL_MAIN.c  .generated_files/flags/default/92162abe82f0501fa97937b9bd19024d141b623f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FINAL_MAIN.o.d 
	@${RM} ${OBJECTDIR}/FINAL_MAIN.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FINAL_MAIN.o.d" -o ${OBJECTDIR}/FINAL_MAIN.o FINAL_MAIN.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/HCSR04_MODULE.o: HCSR04_MODULE.c  .generated_files/flags/default/ac8c29212467cd680b757aaba50f0ae7149d0123 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HCSR04_MODULE.o.d 
	@${RM} ${OBJECTDIR}/HCSR04_MODULE.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/HCSR04_MODULE.o.d" -o ${OBJECTDIR}/HCSR04_MODULE.o HCSR04_MODULE.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/MOTOR_MODULE.o: MOTOR_MODULE.c  .generated_files/flags/default/e874c4dcb54461bfc4d8611a2d9c4db2e9d76e98 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MOTOR_MODULE.o.d 
	@${RM} ${OBJECTDIR}/MOTOR_MODULE.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/MOTOR_MODULE.o.d" -o ${OBJECTDIR}/MOTOR_MODULE.o MOTOR_MODULE.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/POTENTIOMETER_MODULE.o: POTENTIOMETER_MODULE.c  .generated_files/flags/default/2715dbd65d81c21194d7e85c67aa3185164bb377 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/POTENTIOMETER_MODULE.o.d 
	@${RM} ${OBJECTDIR}/POTENTIOMETER_MODULE.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/POTENTIOMETER_MODULE.o.d" -o ${OBJECTDIR}/POTENTIOMETER_MODULE.o POTENTIOMETER_MODULE.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/UART_MODULE.o: UART_MODULE.c  .generated_files/flags/default/da8a3a4931644310067bf49851b8d1e2d2f713c9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART_MODULE.o.d 
	@${RM} ${OBJECTDIR}/UART_MODULE.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/UART_MODULE.o.d" -o ${OBJECTDIR}/UART_MODULE.o UART_MODULE.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SERVOS_MODULE.o: SERVOS_MODULE.c  .generated_files/flags/default/cfc57fb346fc09d07e49418c4b9a449ca45d4787 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SERVOS_MODULE.o.d 
	@${RM} ${OBJECTDIR}/SERVOS_MODULE.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SERVOS_MODULE.o.d" -o ${OBJECTDIR}/SERVOS_MODULE.o SERVOS_MODULE.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/PIC32INI.o: PIC32INI.c  .generated_files/flags/default/611263dcb8a6af376505b01e190bb057a6910d9e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PIC32INI.o.d 
	@${RM} ${OBJECTDIR}/PIC32INI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/PIC32INI.o.d" -o ${OBJECTDIR}/PIC32INI.o PIC32INI.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/DELAYS.o: DELAYS.c  .generated_files/flags/default/17e6573f307737c1b3fe7c55ea5fb9107277b9bb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DELAYS.o.d 
	@${RM} ${OBJECTDIR}/DELAYS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/DELAYS.o.d" -o ${OBJECTDIR}/DELAYS.o DELAYS.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/CSFINALPROJECT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_SIMULATOR=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/CSFINALPROJECT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/CSFINALPROJECT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/CSFINALPROJECT.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/CSFINALPROJECT.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
