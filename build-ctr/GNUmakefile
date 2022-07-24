ifeq ($(strip $(DEVKITARM)),)
$(error "DEVKITARM not in your environment.")
endif

include $(DEVKITARM)/3ds_rules

ifdef STEREO
	TARGET	:=re3-stereo
	LIBRW	:=librw-stereo
else
	TARGET	:=re3
	LIBRW	:=librw
endif

#RE3_CFG		:=-DAUDIO_OAL -D_3DS_PERFCOUNT -DLIBRW -DRW_3DS
RE3_CFG		:=-DAUDIO_OAL -D_3DS_PERFCOUNT -DLIBRW -DRW_3DS -DMASTER
#RE3_CFG		:=-DAUDIO_OAL -D_3DS_PERFCOUNT -DLIBRW -DRW_3DS -DMASTER -DUSE_TXD_CDIMAGE
LIBRW_CFG	:=-DRW_3DS
MPG123_CFG	:=-DOPT_MULTI -DOPT_GENERIC -DOPT_GENERIC_DITHER -DOPT_NEON -DREAL_IS_FLOAT
DEBUG		:=-g
WISDOM		:= # -Wall -Werr (yeah right)

#Debug
#OPTFLAGS	:=-O2

#Release
#OPTFLAGS	:=-O3 -flto -fwhole-program
OPTFLAGS	:=-O4 -flto -fwhole-program -DNDEBUG

# If you want to swap between build configurations uncomment.
# The next two lines and comment PREFX :=./obj/.
# each set of object files will be associated with the fingerprint.

FPSTR		:="$(RE3_CFG)$(LIBRW_CFG)$(MPG123_CFG)$(DEBUG)$(OPTFLAGS)$(WISDOM)"
FINGERPRINT	:=$(shell echo "$(FPSTR)" | md5sum | cut -d' ' -f1)
PREFIX		:=./obj/$(FINGERPRINT)/

#PREFIX		:=./obj/

# re3

RE3_SRC		:=	../src/animation \
			../src/audio     \
			../src/audio/oal \
			../src/audio/eax \
			../src/buildings \
			../src/collision \
			../src/control   \
			../src/core      \
			../src/entities  \
			../src/extras    \
			../src/fakerw    \
			../src/math      \
			../src/modelinfo \
			../src/objects   \
			../src/peds      \
			../src/renderer   \
			../src/rw        \
			../src/save      \
			../src/skel      \
			../src/skel/3ds  \
			../src/text      \
			../src/vehicles  \
			../src/weapons

RE3_PRV_INC	:=	$(foreach dir,$(RE3_SRC),-I$(dir))

# librw

LIBRW_SRC	:=	../vendor/$(LIBRW)             \
			../vendor/$(LIBRW)/src         \
			../vendor/$(LIBRW)/src/3ds     \
			../vendor/$(LIBRW)/src/3ds/tex \
			../vendor/$(LIBRW)/src/d3d     \
			../vendor/$(LIBRW)/src/gl      \
			../vendor/$(LIBRW)/src/ps2     \
			../vendor/$(LIBRW)/src/lodepng

LIBRW_INC	:=	$(foreach dir,$(LIBRW_SRC),-I$(dir))

# libctru

LIBCTRU_SRC	:=	../vendor/libctru/libctru/source                 \
			../vendor/libctru/libctru/source/allocator       \
			../vendor/libctru/libctru/source/gpu             \
			../vendor/libctru/libctru/source/ndsp            \
			../vendor/libctru/libctru/source/services        \
			../vendor/libctru/libctru/source/services/soc    \
			../vendor/libctru/libctru/source/applets         \
			../vendor/libctru/libctru/source/util/decompress \
			../vendor/libctru/libctru/source/util/rbtree     \
			../vendor/libctru/libctru/source/util/utf        \
			../vendor/libctru/libctru/source/system

LIBCTRU_PRV_INC	:=	$(foreach dir,$(LIBCTRU_SRC),-I$(dir))

LIBCTRU_INC	:=	-I../vendor/libctru/libctru/include

# citro3d

CITRO3D_SRC	:=	../vendor/citro3d/source \
			../vendor/citro3d/source/maths

CITRO3D_PRV_INC	:=	$(foreach dir,$(CITRO3D_SRC),-I$(dir))

CITRO3D_INC	:=	-I../vendor/citro3d/include

# libmpg123

MPG123_SSRC	:=	../vendor/mpg123-ctr/src/libmpg123/synth_arm.S                  \
			../vendor/mpg123-ctr/src/libmpg123/synth_arm_accurate.S         \
			../vendor/mpg123-ctr/src/libmpg123/synth_neon.S                 \
			../vendor/mpg123-ctr/src/libmpg123/synth_neon_accurate.S        \
			../vendor/mpg123-ctr/src/libmpg123/synth_neon_float.S           \
			../vendor/mpg123-ctr/src/libmpg123/synth_neon_s32.S             \
			../vendor/mpg123-ctr/src/libmpg123/synth_stereo_neon.S          \
			../vendor/mpg123-ctr/src/libmpg123/synth_stereo_neon_s32.S      \
			../vendor/mpg123-ctr/src/libmpg123/synth_stereo_neon_float.S    \
			../vendor/mpg123-ctr/src/libmpg123/synth_stereo_neon_accurate.S \
			../vendor/mpg123-ctr/src/libmpg123/dct36_neon.S                 \
			../vendor/mpg123-ctr/src/libmpg123/dct64_neon.S                 \
			../vendor/mpg123-ctr/src/libmpg123/dct64_neon_float.S           \

MPG123_CSRC	:=	../vendor/mpg123-ctr/src/compat/compat.c             \
			../vendor/mpg123-ctr/src/compat/compat_str.c         \
			../vendor/mpg123-ctr/src/compat/cpuflags_3ds.c       \
			../vendor/mpg123-ctr/src/libmpg123/dct64.c           \
			../vendor/mpg123-ctr/src/libmpg123/dither.c          \
			../vendor/mpg123-ctr/src/libmpg123/feature.c         \
			../vendor/mpg123-ctr/src/libmpg123/format.c          \
			../vendor/mpg123-ctr/src/libmpg123/frame.c           \
			../vendor/mpg123-ctr/src/libmpg123/id3.c             \
			../vendor/mpg123-ctr/src/libmpg123/index.c           \
			../vendor/mpg123-ctr/src/libmpg123/layer1.c          \
			../vendor/mpg123-ctr/src/libmpg123/layer2.c          \
			../vendor/mpg123-ctr/src/libmpg123/layer3.c          \
			../vendor/mpg123-ctr/src/libmpg123/libmpg123.c       \
			../vendor/mpg123-ctr/src/libmpg123/ntom.c            \
			../vendor/mpg123-ctr/src/libmpg123/optimize.c        \
			../vendor/mpg123-ctr/src/libmpg123/parse.c           \
			../vendor/mpg123-ctr/src/libmpg123/readers.c         \
			../vendor/mpg123-ctr/src/libmpg123/stringbuf.c       \
			../vendor/mpg123-ctr/src/libmpg123/synth.c           \
			../vendor/mpg123-ctr/src/libmpg123/synth_8bit.c      \
			../vendor/mpg123-ctr/src/libmpg123/synth_s32.c       \
			../vendor/mpg123-ctr/src/libmpg123/synth_real.c      \
			../vendor/mpg123-ctr/src/libmpg123/tabinit.c

MPG123_PRV_INC	:=	-I../vendor/mpg123-ctr/src           \
			-I../vendor/mpg123-ctr/src/compat    \
			-I../vendor/mpg123-ctr/src/libmpg123

MPG123_INC	:=	-I../vendor/mpg123-ctr/src/include

# openal

OAL_SRC		:=	$(wildcard ../vendor/openal-soft-ctr/Alc/*.c)      \
			$(wildcard ../vendor/openal-soft-ctr/OpenAL32/*.c) \
			../vendor/openal-soft-ctr/Alc/backends/null.c      \
			../vendor/openal-soft-ctr/Alc/backends/loopback.c  \
			../vendor/openal-soft-ctr/Alc/backends/ctr.c

OAL_PRV_INC	:=	-I../vendor/openal-soft-ctr              \
			-I../vendor/openal-soft-ctr/include      \
			-I../vendor/openal-soft-ctr/Alc          \
			-I../vendor/openal-soft-ctr/Alc/backends \
			-I../vendor/openal-soft-ctr/OpenAL32/Include

OAL_INC		:=	-I../vendor/openal-soft-ctr/include

DATA_DIRS	:=	../vendor/libctru/libctru/data

SOURCE_DIRS	:=	$(LIBCTRU_SRC) $(CITRO3D_SRC) $(LIBRW_SRC) $(RE3_SRC)

# Source files / Object files

CPPFILES	:=	$(foreach dir,$(SOURCE_DIRS),$(wildcard $(dir)/*.cpp))
CFILES		:=	$(foreach dir,$(SOURCE_DIRS),$(wildcard $(dir)/*.c))
CFILES		+=	$(OAL_SRC)
CFILES		+=	$(MPG123_CSRC)

SFILES		:=	$(foreach dir,$(SOURCE_DIRS),$(wildcard $(dir)/*.s))
SFILES		+=	$(MPG123_SSRC)

PICAFILES	:=	$(foreach dir,$(SOURCE_DIRS),$(wildcard $(dir)/*.shlist))
DATAFILES	:=	$(foreach dir,$(DATA_DIRS),$(wildcard $(dir)/*.bin))

OBJECTS		:=	$(foreach file,$(SFILES),$(patsubst ../%,$(PREFIX)%,$(basename $(file)).o))
OBJECTS		+=	$(foreach file,$(CFILES),$(patsubst ../%,$(PREFIX)%,$(basename $(file)).o))
OBJECTS		+=	$(foreach file,$(CPPFILES),$(patsubst ../%,$(PREFIX)%,$(basename $(file)).o))

PICA_OBJ	:=	$(foreach file,$(PICAFILES),$(patsubst ../%,$(PREFIX)%,$(patsubst %.shlist,%.shbin.o,$(file))))
DATA_OBJ	:=	$(foreach file,$(DATAFILES),$(patsubst ../%,$(PREFIX)%,$(patsubst %.bin,%.bin.o,$(file))))

PICA_INC	:=	$(sort $(foreach obj,$(PICA_OBJ),-I$(dir $(obj))))
DATA_INC	:=	$(sort $(foreach obj,$(DATA_OBJ),-I$(dir $(obj))))

# code generation

ARCH		:=	-march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft
ASFLAGS		:=	$(DEBUG) $(ARCH)

CFLAGS		:=	$(WISDOM) $(DEBUG) $(OPTFLAGS) $(ARCH)  \
			-mword-relocations -ffunction-sections  \
			-DARM11 -D__3DS__ \
			$(LIBCTRU_INC) -I$(PORTLIBS)/include

LIBS		:=	-lm

LDFLAGS		:=	$(DEBUG) $(ARCH) $(OPTFLAGS) \
			-specs=3dsx.specs  -Wl,-Map,$(notdir $*.map)

CXXFLAGS	:=	$(CFLAGS) \
			-std=gnu++11 -fno-rtti -fno-exceptions -fpermissive

DEPGEN		=	-MMD -MP -MF $@.d

DEPS		:=	$(foreach obj,$(OBJECTS),$(obj).d)  \
			$(foreach obj,$(PICA_OBJ),$(obj).d) \
			$(foreach obj,$(DATA_OBJ),$(obj).d)

# rules
default: $(PREFIX)$(TARGET).3dsx


# binary files
$(PREFIX)%.bin.o $(PREFIX)%_bin.h: ../%.bin
	@echo $(notdir $<)
	@mkdir -p $(dir $@) || true
	@echo $@ $(patsubst %.bin.o,%_bin.h,$@): $< > $@.d
	@bin2s -a 4 -H $(patsubst %.bin.o,%_bin.h,$@) $< | $(AS) -o $@

# compiling libctru *.cpp
$(PREFIX)vendor/libctru/%.o: ../vendor/libctru/%.cpp
	@mkdir -p $(dir $@) || true
	@echo $(CXX) $<
	@$(CXX) $(DEPGEN) -c $< -o $@ $(CXXFLAGS) $(LIBCTRU_PRV_INC) $(DATA_INC)

# compiling libctru *.c
$(PREFIX)vendor/libctru/%.o: ../vendor/libctru/%.c
	@mkdir -p $(dir $@) || true
	@echo $(CC) $<
	@$(CC) $(DEPGEN) -c $< -o $@ $(CFLAGS) $(LIBCTRU_PRV_INC) $(DATA_INC)

# libctru asm
$(PREFIX)vendor/libctru/%.o: ../vendor/libctru/%.s
	@mkdir -p $(dir $@) || true
	@echo $(CC) $<
	@$(CC) $(DEPGEN) -x assembler-with-cpp -c $< -o $@ $(LIBCTRU_INC)

# compiling citro3d *.c
$(PREFIX)vendor/citro3d/%.o: ../vendor/citro3d/%.c
	@mkdir -p $(dir $@) || true
	@echo $(CC) $<
	@$(CC) -c $< $(DEPGEN) -o $@ $(CFLAGS) $(CITRO3D_PRV_INC) $(CITRO3D_INC)

# mpg123 *.c
$(PREFIX)vendor/mpg123-ctr/%.o: ../vendor/mpg123-ctr/%.c
	@mkdir -p $(dir $@) || true
	@echo $(CC) $<
	@$(CC) -c $< $(DEPGEN) -o $@ -ffast-math $(CFLAGS) $(MPG123_CFG) $(MPG123_PRV_INC)

# mpg123 asm
$(PREFIX)vendor/mpg123-ctr/%.o: ../vendor/mpg123-ctr/%.S
	@mkdir -p $(dir $@) || true
	@echo $(CC) $<
	@$(CC) $(DEPGEN) -c $< -o $@ $(MPG123_CFG) $(MPG123_PRV_INC)

# compiling OAL
$(PREFIX)vendor/openal-soft-ctr/%.o: ../vendor/openal-soft-ctr/%.c
	@mkdir -p $(dir $@) || true
	@echo $(CC) $<
	@$(CC) -c $< $(DEPGEN) -o $@ $(CFLAGS) $(OAL_PRV_INC)

# compiling librw
$(PREFIX)vendor/$(LIBRW)/%.o: ../vendor/$(LIBRW)/%.cpp
	@mkdir -p $(dir $@) || true
	@echo $(CXX) $<
	@$(CXX) $(DEPGEN) -c $< -o $@ $(CXXFLAGS) $(LIBRW_CFG) $(CITRO3D_INC) $(LIBRW_INC) $(PICA_INC)

# compiling shaders
$(PREFIX)%.shbin.o $(PREFIX)%_shbin.h: ../%.shlist
	@mkdir -p $(dir $@) || true
	@./shlist.sh $< $@

# compiling re3
$(PREFIX)src/%.o: ../src/%.cpp
	@mkdir -p $(dir $@) || true
	@echo $(CXX) $<
	@$(CXX) $(DEPGEN) -c $< -o $@ $(CXXFLAGS) $(RE3_CFG) $(RE3_PRV_INC) $(CITRO3D_INC) $(LIBRW_INC) $(OAL_INC) $(MPG123_INC)

# random asm
$(PREFIX)%.o: ../%.s
	@mkdir -p $(dir $@) || true
	@echo Ignoring assembly file: $<
	@echo | $(AS) -o $@

# linking
$(PREFIX)%.elf:
	@echo linking $(notdir $@)
	@$(CXX) $(LDFLAGS) $(PICA_OBJ) $(OBJECTS) $(LIBS) -o $@
	@$(NM) -CSn $@ > $(notdir $*.lst)

$(OBJECTS): | $(PICA_OBJ) $(DATA_OBJ)

$(PREFIX)$(TARGET).3dsx: $(PREFIX)$(TARGET).elf

$(PREFIX)$(TARGET).elf: $(OBJECTS) $(OBJ_PICA) $(OBJ_DATA) $(PREFIX)info

$(PREFIX)info:
	@echo 'FINGERPRINT:\t'$(FINGERPRINT)  > $@
	@echo 'RE3_CFG:    \t'$(RE3_CFG)     >> $@
	@echo 'LIBRW_CFG:  \t'$(LIBRW_CFG)   >> $@
	@echo 'DEBUG:      \t'$(DEBUG)       >> $@
	@echo 'OPTFLAGS:   \t'$(OPTFLAGS)    >> $@
	@echo 'WISDOM:     \t'$(WISDOM)      >> $@

.PHONY: clean
clean:
	@rm -f         \
	$(TARGET).3dsx \
	$(TARGET).elf  \
	$(OBJECTS)     \
	$(OBJ_PICA)    \
	$(OBJ_DATA)    \
	$(DEPS)

.PHONY: copy
copy:
	cp $(PREFIX)$(TARGET).elf ./
	cp $(PREFIX)$(TARGET).3dsx ./

.PHONY: upload
upload:
	3dslink -a 10.0.0.2 $(PREFIX)$(TARGET).3dsx

.PHONY: debug
debug:
	$(DEVKITARM)/bin/arm-none-eabi-gdb $(PREFIX)$(TARGET).elf

-include $(DEPS)
