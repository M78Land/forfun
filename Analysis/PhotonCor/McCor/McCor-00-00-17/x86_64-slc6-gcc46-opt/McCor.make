#-- start of make_header -----------------

#====================================
#  Library McCor
#
#   Generated Thu Nov 11 08:11:10 2021  by bes3pub
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_McCor_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_McCor_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_McCor

McCor_tag = $(tag)

#cmt_local_tagfile_McCor = $(McCor_tag)_McCor.make
cmt_local_tagfile_McCor = $(bin)$(McCor_tag)_McCor.make

else

tags      = $(tag),$(CMTEXTRATAGS)

McCor_tag = $(tag)

#cmt_local_tagfile_McCor = $(McCor_tag).make
cmt_local_tagfile_McCor = $(bin)$(McCor_tag).make

endif

include $(cmt_local_tagfile_McCor)
#-include $(cmt_local_tagfile_McCor)

ifdef cmt_McCor_has_target_tag

cmt_final_setup_McCor = $(bin)setup_McCor.make
cmt_dependencies_in_McCor = $(bin)dependencies_McCor.in
#cmt_final_setup_McCor = $(bin)McCor_McCorsetup.make
cmt_local_McCor_makefile = $(bin)McCor.make

else

cmt_final_setup_McCor = $(bin)setup.make
cmt_dependencies_in_McCor = $(bin)dependencies.in
#cmt_final_setup_McCor = $(bin)McCorsetup.make
cmt_local_McCor_makefile = $(bin)McCor.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)McCorsetup.make

#McCor :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'McCor'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = McCor/
#McCor::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

McCorlibname   = $(bin)$(library_prefix)McCor$(library_suffix)
McCorlib       = $(McCorlibname).a
McCorstamp     = $(bin)McCor.stamp
McCorshstamp   = $(bin)McCor.shstamp

McCor :: dirs  McCorLIB
	$(echo) "McCor ok"

#-- end of libary_header ----------------

McCorLIB :: $(McCorlib) $(McCorshstamp)
	@/bin/echo "------> McCor : library ok"

$(McCorlib) :: $(bin)McCor.o $(bin)McCor_load.o $(bin)McCor_entries.o
	$(lib_echo) library
	$(lib_silent) cd $(bin); \
	  $(ar) $(McCorlib) $?
	$(lib_silent) $(ranlib) $(McCorlib)
	$(lib_silent) cat /dev/null >$(McCorstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

$(McCorlibname).$(shlibsuffix) :: $(McCorlib) $(McCorstamps)
	$(lib_silent) cd $(bin); QUIET=$(QUIET); $(make_shlib) "$(tags)" McCor $(McCor_shlibflags)

$(McCorshstamp) :: $(McCorlibname).$(shlibsuffix)
	@if test -f $(McCorlibname).$(shlibsuffix) ; then cat /dev/null >$(McCorshstamp) ; fi

McCorclean ::
	$(cleanup_echo) objects
	$(cleanup_silent) cd $(bin); /bin/rm -f $(bin)McCor.o $(bin)McCor_load.o $(bin)McCor_entries.o

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
McCorinstallname = $(library_prefix)McCor$(library_suffix).$(shlibsuffix)

McCor :: McCorinstall

install :: McCorinstall

McCorinstall :: $(install_dir)/$(McCorinstallname)
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

$(install_dir)/$(McCorinstallname) :: $(bin)$(McCorinstallname)
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test ! -d "$(install_dir)"; then \
	      mkdir -p $(install_dir); \
	    fi ; \
	    if test -d "$(install_dir)"; then \
	      echo "Installing library $(McCorinstallname) into $(install_dir)"; \
	      if test -e $(install_dir)/$(McCorinstallname); then \
	        $(cmt_uninstall_area_command) $(install_dir)/$(McCorinstallname); \
	        $(cmt_uninstall_area_command) $(install_dir)/$(McCorinstallname).cmtref; \
	      fi; \
	      $(cmt_install_area_command) `pwd`/$(McCorinstallname) $(install_dir)/$(McCorinstallname); \
	      echo `pwd`/$(McCorinstallname) >$(install_dir)/$(McCorinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot install library $(McCorinstallname), no installation directory specified"; \
	  fi; \
	fi

McCorclean :: McCoruninstall

uninstall :: McCoruninstall

McCoruninstall ::
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test -d "$(install_dir)"; then \
	      echo "Removing installed library $(McCorinstallname) from $(install_dir)"; \
	      $(cmt_uninstall_area_command) $(install_dir)/$(McCorinstallname); \
	      $(cmt_uninstall_area_command) $(install_dir)/$(McCorinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot uninstall library $(McCorinstallname), no installation directory specified"; \
	  fi; \
	fi




#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),McCorclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)McCor.d

$(bin)$(binobj)McCor.d :

$(bin)$(binobj)McCor.o : $(cmt_final_setup_McCor)

$(bin)$(binobj)McCor.o : $(src)McCor.cxx
	$(cpp_echo) $(src)McCor.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(McCor_pp_cppflags) $(lib_McCor_pp_cppflags) $(McCor_pp_cppflags) $(use_cppflags) $(McCor_cppflags) $(lib_McCor_cppflags) $(McCor_cppflags) $(McCor_cxx_cppflags)  $(src)McCor.cxx
endif
endif

else
$(bin)McCor_dependencies.make : $(McCor_cxx_dependencies)

$(bin)McCor_dependencies.make : $(src)McCor.cxx

$(bin)$(binobj)McCor.o : $(McCor_cxx_dependencies)
	$(cpp_echo) $(src)McCor.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(McCor_pp_cppflags) $(lib_McCor_pp_cppflags) $(McCor_pp_cppflags) $(use_cppflags) $(McCor_cppflags) $(lib_McCor_cppflags) $(McCor_cppflags) $(McCor_cxx_cppflags)  $(src)McCor.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),McCorclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)McCor_load.d

$(bin)$(binobj)McCor_load.d :

$(bin)$(binobj)McCor_load.o : $(cmt_final_setup_McCor)

$(bin)$(binobj)McCor_load.o : $(src)components/McCor_load.cxx
	$(cpp_echo) $(src)components/McCor_load.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(McCor_pp_cppflags) $(lib_McCor_pp_cppflags) $(McCor_load_pp_cppflags) $(use_cppflags) $(McCor_cppflags) $(lib_McCor_cppflags) $(McCor_load_cppflags) $(McCor_load_cxx_cppflags) -I../src/components $(src)components/McCor_load.cxx
endif
endif

else
$(bin)McCor_dependencies.make : $(McCor_load_cxx_dependencies)

$(bin)McCor_dependencies.make : $(src)components/McCor_load.cxx

$(bin)$(binobj)McCor_load.o : $(McCor_load_cxx_dependencies)
	$(cpp_echo) $(src)components/McCor_load.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(McCor_pp_cppflags) $(lib_McCor_pp_cppflags) $(McCor_load_pp_cppflags) $(use_cppflags) $(McCor_cppflags) $(lib_McCor_cppflags) $(McCor_load_cppflags) $(McCor_load_cxx_cppflags) -I../src/components $(src)components/McCor_load.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),McCorclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)McCor_entries.d

$(bin)$(binobj)McCor_entries.d :

$(bin)$(binobj)McCor_entries.o : $(cmt_final_setup_McCor)

$(bin)$(binobj)McCor_entries.o : $(src)components/McCor_entries.cxx
	$(cpp_echo) $(src)components/McCor_entries.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(McCor_pp_cppflags) $(lib_McCor_pp_cppflags) $(McCor_entries_pp_cppflags) $(use_cppflags) $(McCor_cppflags) $(lib_McCor_cppflags) $(McCor_entries_cppflags) $(McCor_entries_cxx_cppflags) -I../src/components $(src)components/McCor_entries.cxx
endif
endif

else
$(bin)McCor_dependencies.make : $(McCor_entries_cxx_dependencies)

$(bin)McCor_dependencies.make : $(src)components/McCor_entries.cxx

$(bin)$(binobj)McCor_entries.o : $(McCor_entries_cxx_dependencies)
	$(cpp_echo) $(src)components/McCor_entries.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(McCor_pp_cppflags) $(lib_McCor_pp_cppflags) $(McCor_entries_pp_cppflags) $(use_cppflags) $(McCor_cppflags) $(lib_McCor_cppflags) $(McCor_entries_cppflags) $(McCor_entries_cxx_cppflags) -I../src/components $(src)components/McCor_entries.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: McCorclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(McCor.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

McCorclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library McCor
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)McCor$(library_suffix).a $(library_prefix)McCor$(library_suffix).s? McCor.stamp McCor.shstamp
#-- end of cleanup_library ---------------
