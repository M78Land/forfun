#-- start of make_header -----------------

#====================================
#  Library AbsCor
#
#   Generated Thu Nov 11 08:11:15 2021  by bes3pub
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_AbsCor_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_AbsCor_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_AbsCor

AbsCor_tag = $(tag)

#cmt_local_tagfile_AbsCor = $(AbsCor_tag)_AbsCor.make
cmt_local_tagfile_AbsCor = $(bin)$(AbsCor_tag)_AbsCor.make

else

tags      = $(tag),$(CMTEXTRATAGS)

AbsCor_tag = $(tag)

#cmt_local_tagfile_AbsCor = $(AbsCor_tag).make
cmt_local_tagfile_AbsCor = $(bin)$(AbsCor_tag).make

endif

include $(cmt_local_tagfile_AbsCor)
#-include $(cmt_local_tagfile_AbsCor)

ifdef cmt_AbsCor_has_target_tag

cmt_final_setup_AbsCor = $(bin)setup_AbsCor.make
cmt_dependencies_in_AbsCor = $(bin)dependencies_AbsCor.in
#cmt_final_setup_AbsCor = $(bin)AbsCor_AbsCorsetup.make
cmt_local_AbsCor_makefile = $(bin)AbsCor.make

else

cmt_final_setup_AbsCor = $(bin)setup.make
cmt_dependencies_in_AbsCor = $(bin)dependencies.in
#cmt_final_setup_AbsCor = $(bin)AbsCorsetup.make
cmt_local_AbsCor_makefile = $(bin)AbsCor.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)AbsCorsetup.make

#AbsCor :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'AbsCor'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = AbsCor/
#AbsCor::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

AbsCorlibname   = $(bin)$(library_prefix)AbsCor$(library_suffix)
AbsCorlib       = $(AbsCorlibname).a
AbsCorstamp     = $(bin)AbsCor.stamp
AbsCorshstamp   = $(bin)AbsCor.shstamp

AbsCor :: dirs  AbsCorLIB
	$(echo) "AbsCor ok"

#-- end of libary_header ----------------

AbsCorLIB :: $(AbsCorlib) $(AbsCorshstamp)
	@/bin/echo "------> AbsCor : library ok"

$(AbsCorlib) :: $(bin)AbsCor.o $(bin)AbsCor_load.o $(bin)AbsCor_entries.o
	$(lib_echo) library
	$(lib_silent) cd $(bin); \
	  $(ar) $(AbsCorlib) $?
	$(lib_silent) $(ranlib) $(AbsCorlib)
	$(lib_silent) cat /dev/null >$(AbsCorstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

$(AbsCorlibname).$(shlibsuffix) :: $(AbsCorlib) $(AbsCorstamps)
	$(lib_silent) cd $(bin); QUIET=$(QUIET); $(make_shlib) "$(tags)" AbsCor $(AbsCor_shlibflags)

$(AbsCorshstamp) :: $(AbsCorlibname).$(shlibsuffix)
	@if test -f $(AbsCorlibname).$(shlibsuffix) ; then cat /dev/null >$(AbsCorshstamp) ; fi

AbsCorclean ::
	$(cleanup_echo) objects
	$(cleanup_silent) cd $(bin); /bin/rm -f $(bin)AbsCor.o $(bin)AbsCor_load.o $(bin)AbsCor_entries.o

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

ifeq ($(INSTALLAREA),)
installarea = $(CMTINSTALLAREA)
else
ifeq ($(findstring `,$(INSTALLAREA)),`)
installarea = $(shell $(subst `,, $(INSTALLAREA)))
else
installarea = $(INSTALLAREA)
endif
endif

install_dir = ${installarea}/${CMTCONFIG}/lib
AbsCorinstallname = $(library_prefix)AbsCor$(library_suffix).$(shlibsuffix)

AbsCor :: AbsCorinstall

install :: AbsCorinstall

AbsCorinstall :: $(install_dir)/$(AbsCorinstallname)
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

$(install_dir)/$(AbsCorinstallname) :: $(bin)$(AbsCorinstallname)
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test ! -d "$(install_dir)"; then \
	      mkdir -p $(install_dir); \
	    fi ; \
	    if test -d "$(install_dir)"; then \
	      echo "Installing library $(AbsCorinstallname) into $(install_dir)"; \
	      if test -e $(install_dir)/$(AbsCorinstallname); then \
	        $(cmt_uninstall_area_command) $(install_dir)/$(AbsCorinstallname); \
	        $(cmt_uninstall_area_command) $(install_dir)/$(AbsCorinstallname).cmtref; \
	      fi; \
	      $(cmt_install_area_command) `pwd`/$(AbsCorinstallname) $(install_dir)/$(AbsCorinstallname); \
	      echo `pwd`/$(AbsCorinstallname) >$(install_dir)/$(AbsCorinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot install library $(AbsCorinstallname), no installation directory specified"; \
	  fi; \
	fi

AbsCorclean :: AbsCoruninstall

uninstall :: AbsCoruninstall

AbsCoruninstall ::
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test -d "$(install_dir)"; then \
	      echo "Removing installed library $(AbsCorinstallname) from $(install_dir)"; \
	      $(cmt_uninstall_area_command) $(install_dir)/$(AbsCorinstallname); \
	      $(cmt_uninstall_area_command) $(install_dir)/$(AbsCorinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot uninstall library $(AbsCorinstallname), no installation directory specified"; \
	  fi; \
	fi




#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),AbsCorclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)AbsCor.d

$(bin)$(binobj)AbsCor.d :

$(bin)$(binobj)AbsCor.o : $(cmt_final_setup_AbsCor)

$(bin)$(binobj)AbsCor.o : $(src)AbsCor.cxx
	$(cpp_echo) $(src)AbsCor.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(AbsCor_pp_cppflags) $(lib_AbsCor_pp_cppflags) $(AbsCor_pp_cppflags) $(use_cppflags) $(AbsCor_cppflags) $(lib_AbsCor_cppflags) $(AbsCor_cppflags) $(AbsCor_cxx_cppflags)  $(src)AbsCor.cxx
endif
endif

else
$(bin)AbsCor_dependencies.make : $(AbsCor_cxx_dependencies)

$(bin)AbsCor_dependencies.make : $(src)AbsCor.cxx

$(bin)$(binobj)AbsCor.o : $(AbsCor_cxx_dependencies)
	$(cpp_echo) $(src)AbsCor.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(AbsCor_pp_cppflags) $(lib_AbsCor_pp_cppflags) $(AbsCor_pp_cppflags) $(use_cppflags) $(AbsCor_cppflags) $(lib_AbsCor_cppflags) $(AbsCor_cppflags) $(AbsCor_cxx_cppflags)  $(src)AbsCor.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),AbsCorclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)AbsCor_load.d

$(bin)$(binobj)AbsCor_load.d :

$(bin)$(binobj)AbsCor_load.o : $(cmt_final_setup_AbsCor)

$(bin)$(binobj)AbsCor_load.o : $(src)components/AbsCor_load.cxx
	$(cpp_echo) $(src)components/AbsCor_load.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(AbsCor_pp_cppflags) $(lib_AbsCor_pp_cppflags) $(AbsCor_load_pp_cppflags) $(use_cppflags) $(AbsCor_cppflags) $(lib_AbsCor_cppflags) $(AbsCor_load_cppflags) $(AbsCor_load_cxx_cppflags) -I../src/components $(src)components/AbsCor_load.cxx
endif
endif

else
$(bin)AbsCor_dependencies.make : $(AbsCor_load_cxx_dependencies)

$(bin)AbsCor_dependencies.make : $(src)components/AbsCor_load.cxx

$(bin)$(binobj)AbsCor_load.o : $(AbsCor_load_cxx_dependencies)
	$(cpp_echo) $(src)components/AbsCor_load.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(AbsCor_pp_cppflags) $(lib_AbsCor_pp_cppflags) $(AbsCor_load_pp_cppflags) $(use_cppflags) $(AbsCor_cppflags) $(lib_AbsCor_cppflags) $(AbsCor_load_cppflags) $(AbsCor_load_cxx_cppflags) -I../src/components $(src)components/AbsCor_load.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),AbsCorclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)AbsCor_entries.d

$(bin)$(binobj)AbsCor_entries.d :

$(bin)$(binobj)AbsCor_entries.o : $(cmt_final_setup_AbsCor)

$(bin)$(binobj)AbsCor_entries.o : $(src)components/AbsCor_entries.cxx
	$(cpp_echo) $(src)components/AbsCor_entries.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(AbsCor_pp_cppflags) $(lib_AbsCor_pp_cppflags) $(AbsCor_entries_pp_cppflags) $(use_cppflags) $(AbsCor_cppflags) $(lib_AbsCor_cppflags) $(AbsCor_entries_cppflags) $(AbsCor_entries_cxx_cppflags) -I../src/components $(src)components/AbsCor_entries.cxx
endif
endif

else
$(bin)AbsCor_dependencies.make : $(AbsCor_entries_cxx_dependencies)

$(bin)AbsCor_dependencies.make : $(src)components/AbsCor_entries.cxx

$(bin)$(binobj)AbsCor_entries.o : $(AbsCor_entries_cxx_dependencies)
	$(cpp_echo) $(src)components/AbsCor_entries.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(AbsCor_pp_cppflags) $(lib_AbsCor_pp_cppflags) $(AbsCor_entries_pp_cppflags) $(use_cppflags) $(AbsCor_cppflags) $(lib_AbsCor_cppflags) $(AbsCor_entries_cppflags) $(AbsCor_entries_cxx_cppflags) -I../src/components $(src)components/AbsCor_entries.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: AbsCorclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(AbsCor.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

AbsCorclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library AbsCor
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)AbsCor$(library_suffix).a $(library_prefix)AbsCor$(library_suffix).s? AbsCor.stamp AbsCor.shstamp
#-- end of cleanup_library ---------------
