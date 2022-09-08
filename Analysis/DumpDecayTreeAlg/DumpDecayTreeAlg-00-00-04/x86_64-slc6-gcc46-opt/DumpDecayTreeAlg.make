#-- start of make_header -----------------

#====================================
#  Library DumpDecayTreeAlg
#
#   Generated Mon Nov  8 09:00:48 2021  by bes3pub
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_DumpDecayTreeAlg_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_DumpDecayTreeAlg_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_DumpDecayTreeAlg

DumpDecayTreeAlg_tag = $(tag)

#cmt_local_tagfile_DumpDecayTreeAlg = $(DumpDecayTreeAlg_tag)_DumpDecayTreeAlg.make
cmt_local_tagfile_DumpDecayTreeAlg = $(bin)$(DumpDecayTreeAlg_tag)_DumpDecayTreeAlg.make

else

tags      = $(tag),$(CMTEXTRATAGS)

DumpDecayTreeAlg_tag = $(tag)

#cmt_local_tagfile_DumpDecayTreeAlg = $(DumpDecayTreeAlg_tag).make
cmt_local_tagfile_DumpDecayTreeAlg = $(bin)$(DumpDecayTreeAlg_tag).make

endif

include $(cmt_local_tagfile_DumpDecayTreeAlg)
#-include $(cmt_local_tagfile_DumpDecayTreeAlg)

ifdef cmt_DumpDecayTreeAlg_has_target_tag

cmt_final_setup_DumpDecayTreeAlg = $(bin)setup_DumpDecayTreeAlg.make
cmt_dependencies_in_DumpDecayTreeAlg = $(bin)dependencies_DumpDecayTreeAlg.in
#cmt_final_setup_DumpDecayTreeAlg = $(bin)DumpDecayTreeAlg_DumpDecayTreeAlgsetup.make
cmt_local_DumpDecayTreeAlg_makefile = $(bin)DumpDecayTreeAlg.make

else

cmt_final_setup_DumpDecayTreeAlg = $(bin)setup.make
cmt_dependencies_in_DumpDecayTreeAlg = $(bin)dependencies.in
#cmt_final_setup_DumpDecayTreeAlg = $(bin)DumpDecayTreeAlgsetup.make
cmt_local_DumpDecayTreeAlg_makefile = $(bin)DumpDecayTreeAlg.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)DumpDecayTreeAlgsetup.make

#DumpDecayTreeAlg :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'DumpDecayTreeAlg'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = DumpDecayTreeAlg/
#DumpDecayTreeAlg::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

DumpDecayTreeAlglibname   = $(bin)$(library_prefix)DumpDecayTreeAlg$(library_suffix)
DumpDecayTreeAlglib       = $(DumpDecayTreeAlglibname).a
DumpDecayTreeAlgstamp     = $(bin)DumpDecayTreeAlg.stamp
DumpDecayTreeAlgshstamp   = $(bin)DumpDecayTreeAlg.shstamp

DumpDecayTreeAlg :: dirs  DumpDecayTreeAlgLIB
	$(echo) "DumpDecayTreeAlg ok"

#-- end of libary_header ----------------

DumpDecayTreeAlgLIB :: $(DumpDecayTreeAlglib) $(DumpDecayTreeAlgshstamp)
	@/bin/echo "------> DumpDecayTreeAlg : library ok"

$(DumpDecayTreeAlglib) :: $(bin)DumpDecayTreeAlg.o $(bin)DumpDecayTreeAlg_load.o $(bin)DumpDecayTreeAlg_entries.o
	$(lib_echo) library
	$(lib_silent) cd $(bin); \
	  $(ar) $(DumpDecayTreeAlglib) $?
	$(lib_silent) $(ranlib) $(DumpDecayTreeAlglib)
	$(lib_silent) cat /dev/null >$(DumpDecayTreeAlgstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

$(DumpDecayTreeAlglibname).$(shlibsuffix) :: $(DumpDecayTreeAlglib) $(DumpDecayTreeAlgstamps)
	$(lib_silent) cd $(bin); QUIET=$(QUIET); $(make_shlib) "$(tags)" DumpDecayTreeAlg $(DumpDecayTreeAlg_shlibflags)

$(DumpDecayTreeAlgshstamp) :: $(DumpDecayTreeAlglibname).$(shlibsuffix)
	@if test -f $(DumpDecayTreeAlglibname).$(shlibsuffix) ; then cat /dev/null >$(DumpDecayTreeAlgshstamp) ; fi

DumpDecayTreeAlgclean ::
	$(cleanup_echo) objects
	$(cleanup_silent) cd $(bin); /bin/rm -f $(bin)DumpDecayTreeAlg.o $(bin)DumpDecayTreeAlg_load.o $(bin)DumpDecayTreeAlg_entries.o

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
DumpDecayTreeAlginstallname = $(library_prefix)DumpDecayTreeAlg$(library_suffix).$(shlibsuffix)

DumpDecayTreeAlg :: DumpDecayTreeAlginstall

install :: DumpDecayTreeAlginstall

DumpDecayTreeAlginstall :: $(install_dir)/$(DumpDecayTreeAlginstallname)
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

$(install_dir)/$(DumpDecayTreeAlginstallname) :: $(bin)$(DumpDecayTreeAlginstallname)
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test ! -d "$(install_dir)"; then \
	      mkdir -p $(install_dir); \
	    fi ; \
	    if test -d "$(install_dir)"; then \
	      echo "Installing library $(DumpDecayTreeAlginstallname) into $(install_dir)"; \
	      if test -e $(install_dir)/$(DumpDecayTreeAlginstallname); then \
	        $(cmt_uninstall_area_command) $(install_dir)/$(DumpDecayTreeAlginstallname); \
	        $(cmt_uninstall_area_command) $(install_dir)/$(DumpDecayTreeAlginstallname).cmtref; \
	      fi; \
	      $(cmt_install_area_command) `pwd`/$(DumpDecayTreeAlginstallname) $(install_dir)/$(DumpDecayTreeAlginstallname); \
	      echo `pwd`/$(DumpDecayTreeAlginstallname) >$(install_dir)/$(DumpDecayTreeAlginstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot install library $(DumpDecayTreeAlginstallname), no installation directory specified"; \
	  fi; \
	fi

DumpDecayTreeAlgclean :: DumpDecayTreeAlguninstall

uninstall :: DumpDecayTreeAlguninstall

DumpDecayTreeAlguninstall ::
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test -d "$(install_dir)"; then \
	      echo "Removing installed library $(DumpDecayTreeAlginstallname) from $(install_dir)"; \
	      $(cmt_uninstall_area_command) $(install_dir)/$(DumpDecayTreeAlginstallname); \
	      $(cmt_uninstall_area_command) $(install_dir)/$(DumpDecayTreeAlginstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot uninstall library $(DumpDecayTreeAlginstallname), no installation directory specified"; \
	  fi; \
	fi




#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),DumpDecayTreeAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)DumpDecayTreeAlg.d

$(bin)$(binobj)DumpDecayTreeAlg.d :

$(bin)$(binobj)DumpDecayTreeAlg.o : $(cmt_final_setup_DumpDecayTreeAlg)

$(bin)$(binobj)DumpDecayTreeAlg.o : $(src)DumpDecayTreeAlg.cxx
	$(cpp_echo) $(src)DumpDecayTreeAlg.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(DumpDecayTreeAlg_pp_cppflags) $(lib_DumpDecayTreeAlg_pp_cppflags) $(DumpDecayTreeAlg_pp_cppflags) $(use_cppflags) $(DumpDecayTreeAlg_cppflags) $(lib_DumpDecayTreeAlg_cppflags) $(DumpDecayTreeAlg_cppflags) $(DumpDecayTreeAlg_cxx_cppflags)  $(src)DumpDecayTreeAlg.cxx
endif
endif

else
$(bin)DumpDecayTreeAlg_dependencies.make : $(DumpDecayTreeAlg_cxx_dependencies)

$(bin)DumpDecayTreeAlg_dependencies.make : $(src)DumpDecayTreeAlg.cxx

$(bin)$(binobj)DumpDecayTreeAlg.o : $(DumpDecayTreeAlg_cxx_dependencies)
	$(cpp_echo) $(src)DumpDecayTreeAlg.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(DumpDecayTreeAlg_pp_cppflags) $(lib_DumpDecayTreeAlg_pp_cppflags) $(DumpDecayTreeAlg_pp_cppflags) $(use_cppflags) $(DumpDecayTreeAlg_cppflags) $(lib_DumpDecayTreeAlg_cppflags) $(DumpDecayTreeAlg_cppflags) $(DumpDecayTreeAlg_cxx_cppflags)  $(src)DumpDecayTreeAlg.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),DumpDecayTreeAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)DumpDecayTreeAlg_load.d

$(bin)$(binobj)DumpDecayTreeAlg_load.d :

$(bin)$(binobj)DumpDecayTreeAlg_load.o : $(cmt_final_setup_DumpDecayTreeAlg)

$(bin)$(binobj)DumpDecayTreeAlg_load.o : $(src)components/DumpDecayTreeAlg_load.cxx
	$(cpp_echo) $(src)components/DumpDecayTreeAlg_load.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(DumpDecayTreeAlg_pp_cppflags) $(lib_DumpDecayTreeAlg_pp_cppflags) $(DumpDecayTreeAlg_load_pp_cppflags) $(use_cppflags) $(DumpDecayTreeAlg_cppflags) $(lib_DumpDecayTreeAlg_cppflags) $(DumpDecayTreeAlg_load_cppflags) $(DumpDecayTreeAlg_load_cxx_cppflags) -I../src/components $(src)components/DumpDecayTreeAlg_load.cxx
endif
endif

else
$(bin)DumpDecayTreeAlg_dependencies.make : $(DumpDecayTreeAlg_load_cxx_dependencies)

$(bin)DumpDecayTreeAlg_dependencies.make : $(src)components/DumpDecayTreeAlg_load.cxx

$(bin)$(binobj)DumpDecayTreeAlg_load.o : $(DumpDecayTreeAlg_load_cxx_dependencies)
	$(cpp_echo) $(src)components/DumpDecayTreeAlg_load.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(DumpDecayTreeAlg_pp_cppflags) $(lib_DumpDecayTreeAlg_pp_cppflags) $(DumpDecayTreeAlg_load_pp_cppflags) $(use_cppflags) $(DumpDecayTreeAlg_cppflags) $(lib_DumpDecayTreeAlg_cppflags) $(DumpDecayTreeAlg_load_cppflags) $(DumpDecayTreeAlg_load_cxx_cppflags) -I../src/components $(src)components/DumpDecayTreeAlg_load.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),DumpDecayTreeAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)DumpDecayTreeAlg_entries.d

$(bin)$(binobj)DumpDecayTreeAlg_entries.d :

$(bin)$(binobj)DumpDecayTreeAlg_entries.o : $(cmt_final_setup_DumpDecayTreeAlg)

$(bin)$(binobj)DumpDecayTreeAlg_entries.o : $(src)components/DumpDecayTreeAlg_entries.cxx
	$(cpp_echo) $(src)components/DumpDecayTreeAlg_entries.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(DumpDecayTreeAlg_pp_cppflags) $(lib_DumpDecayTreeAlg_pp_cppflags) $(DumpDecayTreeAlg_entries_pp_cppflags) $(use_cppflags) $(DumpDecayTreeAlg_cppflags) $(lib_DumpDecayTreeAlg_cppflags) $(DumpDecayTreeAlg_entries_cppflags) $(DumpDecayTreeAlg_entries_cxx_cppflags) -I../src/components $(src)components/DumpDecayTreeAlg_entries.cxx
endif
endif

else
$(bin)DumpDecayTreeAlg_dependencies.make : $(DumpDecayTreeAlg_entries_cxx_dependencies)

$(bin)DumpDecayTreeAlg_dependencies.make : $(src)components/DumpDecayTreeAlg_entries.cxx

$(bin)$(binobj)DumpDecayTreeAlg_entries.o : $(DumpDecayTreeAlg_entries_cxx_dependencies)
	$(cpp_echo) $(src)components/DumpDecayTreeAlg_entries.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(DumpDecayTreeAlg_pp_cppflags) $(lib_DumpDecayTreeAlg_pp_cppflags) $(DumpDecayTreeAlg_entries_pp_cppflags) $(use_cppflags) $(DumpDecayTreeAlg_cppflags) $(lib_DumpDecayTreeAlg_cppflags) $(DumpDecayTreeAlg_entries_cppflags) $(DumpDecayTreeAlg_entries_cxx_cppflags) -I../src/components $(src)components/DumpDecayTreeAlg_entries.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: DumpDecayTreeAlgclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(DumpDecayTreeAlg.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

DumpDecayTreeAlgclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library DumpDecayTreeAlg
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)DumpDecayTreeAlg$(library_suffix).a $(library_prefix)DumpDecayTreeAlg$(library_suffix).s? DumpDecayTreeAlg.stamp DumpDecayTreeAlg.shstamp
#-- end of cleanup_library ---------------
