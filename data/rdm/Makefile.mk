# DATA
################################################
dist_piddata_DATA = \
    data/rdm/draft_pids.proto \
    data/rdm/pids.proto \
    data/rdm/manufacturer_pids.proto

# SCRIPTS
################################################
dist_noinst_SCRIPTS += \
    data/rdm/download.sh \
    data/rdm/PidDataTest.py

# TESTS
################################################

if BUILD_TESTS
tests += data/rdm/PidDataTester

if BUILD_PYTHON_LIBS
tests += data/rdm/PidDataTest.sh
endif
endif

data/rdm/PidDataTest.sh$(EXEEXT): data/rdm/Makefile.mk
	echo "PYTHONPATH=${top_builddir}/python PIDDATA=${srcdir}/data/rdm $(PYTHON) ${srcdir}/data/rdm/PidDataTest.py; exit \$$?" > data/rdm/PidDataTest.sh
	chmod +x data/rdm/PidDataTest.sh

data_rdm_PidDataTester_SOURCES = data/rdm/PidDataTest.cpp
data_rdm_PidDataTester_CXXFLAGS = $(COMMON_TESTING_FLAGS) -DDATADIR=\"$(srcdir)/data/rdm\"
data_rdm_PidDataTester_LDADD = $(COMMON_TEST_LDADD)

CLEANFILES += data/rdm/PidDataTest.sh
