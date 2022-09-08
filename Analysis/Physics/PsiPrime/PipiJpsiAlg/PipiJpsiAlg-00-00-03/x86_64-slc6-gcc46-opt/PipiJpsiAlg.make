#-- start of make_header -----------------

#====================================
#  Library PipiJpsiAlg
#
#   Generated Thu Nov 11 08:10:25 2021  by bes3pub
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_PipiJpsiAlg_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PipiJpsiAlg_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_PipiJpsiAlg

PipiJpsiAlg_tag = $(tag)

#cmt_local_tagfile_PipiJpsiAlg = $(PipiJpsiAlg_tag)_PipiJpsiAlg.make
cmt_local_tagfile_PipiJpsiAlg = $(bin)$(PipiJpsiAlg_tag)_PipiJpsiAlg.make

else

tags      = $(tag),$(CMTEXTRATAGS)

PipiJpsiAlg_tag = $(tag)

#cmt_local_tagfile_PipiJpsiAlg = $(PipiJpsiAlg_tag).make
cmt_local_tagfile_PipiJpsiAlg = $(bin)$(PipiJpsiAlg_tag).make

endif

include $(cmt_local_tagfile_PipiJpsiAlg)
#-include $(cmt_local_tagfile_PipiJpsiAlg)

ifdef cmt_PipiJpsiAlg_has_target_tag

cmt_final_setup_PipiJpsiAlg = $(bin)setup_PipiJpsiAlg.make
cmt_dependencies_in_PipiJpsiAlg = $(bin)dependencies_PipiJpsiAlg.in
#cmt_final_setup_PipiJpsiAlg = $(bin)PipiJpsiAlg_PipiJpsiAlgsetup.make
cmt_local_PipiJpsiAlg_makefile = $(bin)PipiJpsiAlg.make

else

cmt_final_setup_PipiJpsiAlg = $(bin)setup.make
cmt_dependencies_in_PipiJpsiAlg = $(bin)dependencies.in
#cmt_final_setup_PipiJpsiAlg = $(bin)PipiJpsiAlgsetup.make
cmt_local_PipiJpsiAlg_makefile = $(bin)PipiJpsiAlg.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)PipiJpsiAlgsetup.make

#PipiJpsiAlg :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'PipiJpsiAlg'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = PipiJpsiAlg/
#PipiJpsiAlg::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

PipiJpsiAlglibname   = $(bin)$(library_prefix)PipiJpsiAlg$(library_suffix)
PipiJpsiAlglib       = $(PipiJpsiAlglibname).a
PipiJpsiAlgstamp     = $(bin)PipiJpsiAlg.stamp
PipiJpsiAlgshstamp   = $(bin)PipiJpsiAlg.shstamp

PipiJpsiAlg :: dirs  PipiJpsiAlgLIB
	$(echo) "PipiJpsiAlg ok"

#-- end of libary_header ----------------

PipiJpsiAlgLIB :: $(PipiJpsiAlglib) $(PipiJpsiAlgshstamp)
	@/bin/echo "------> PipiJpsiAlg : library ok"

$(PipiJpsiAlglib) :: $(bin)PipiJpsi.o $(bin)PipiJpsi_load.o $(bin)PipiJpsi_entries.o
	$(lib_echo) library
	$(lib_silent) cd $(bin); \
	  $(ar) $(PipiJpsiAlglib) $?
	$(lib_silent) $(ranlib) $(PipiJpsiAlglib)
	$(lib_silent) cat /dev/null >$(PipiJpsiAlgstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

$(PipiJpsiAlglibname).$(shlibsuffix) :: $(PipiJpsiAlglib) $(PipiJpsiAlgstamps)
	$(lib_silent) cd $(bin); QUIET=$(QUIET); $(make_shlib) "$(tags)" PipiJpsiAlg $(PipiJpsiAlg_shlibflags)

$(PipiJpsiAlgshstamp) :: $(PipiJpsiAlglibname).$(shlibsuffix)
	@if test -f $(PipiJpsiAlglibname).$(shlibsuffix) ; then cat /dev/null >$(PipiJpsiAlgshstamp) ; fi

PipiJpsiAlgclean ::
	$(cleanup_echo) objects
	$(cleanup_silent) cd $(bin); /bin/rm -f $(bin)PipiJpsi.o $(bin)PipiJpsi_load.o $(bin)PipiJpsi_entries.o

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
PipiJpsiAlginstallname = $(library_prefix)PipiJpsiAlg$(library_suffix).$(shlibsuffix)

PipiJpsiAlg :: PipiJpsiAlginstall

install :: PipiJpsiAlginstall

PipiJpsiAlginstall :: $(install_dir)/$(PipiJpsiAlginstallname)
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

$(install_dir)/$(PipiJpsiAlginstallname) :: $(bin)$(PipiJpsiAlginstallname)
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test ! -d "$(install_dir)"; then \
	      mkdir -p $(install_dir); \
	    fi ; \
	    if test -d "$(install_dir)"; then \
	      echo "Installing library $(PipiJpsiAlginstallname) into $(install_dir)"; \
	      if test -e $(install_dir)/$(PipiJpsiAlginstallname); then \
	        $(cmt_uninstall_area_command) $(install_dir)/$(PipiJpsiAlginstallname); \
	        $(cmt_uninstall_area_command) $(install_dir)/$(PipiJpsiAlginstallname).cmtref; \
	      fi; \
	      $(cmt_install_area_command) `pwd`/$(PipiJpsiAlginstallname) $(install_dir)/$(PipiJpsiAlginstallname); \
	      echo `pwd`/$(PipiJpsiAlginstallname) >$(install_dir)/$(PipiJpsiAlginstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot install library $(PipiJpsiAlginstallname), no installation directory specified"; \
	  fi; \
	fi

PipiJpsiAlgclean :: PipiJpsiAlguninstall

uninstall :: PipiJpsiAlguninstall

PipiJpsiAlguninstall ::
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test -d "$(install_dir)"; then \
	      echo "Removing installed library $(PipiJpsiAlginstallname) from $(install_dir)"; \
	      $(cmt_uninstall_area_command) $(install_dir)/$(PipiJpsiAlginstallname); \
	      $(cmt_uninstall_area_command) $(install_dir)/$(PipiJpsiAlginstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot uninstall library $(PipiJpsiAlginstallname), no installation directory specified"; \
	  fi; \
	fi




#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),PipiJpsiAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PipiJpsi.d

$(bin)$(binobj)PipiJpsi.d :

$(bin)$(binobj)PipiJpsi.o : $(cmt_final_setup_PipiJpsiAlg)

$(bin)$(binobj)PipiJpsi.o : $(src)PipiJpsi.cxx
	$(cpp_echo) $(src)PipiJpsi.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(PipiJpsiAlg_pp_cppflags) $(lib_PipiJpsiAlg_pp_cppflags) $(PipiJpsi_pp_cppflags) $(use_cppflags) $(PipiJpsiAlg_cppflags) $(lib_PipiJpsiAlg_cppflags) $(PipiJpsi_cppflags) $(PipiJpsi_cxx_cppflags)  $(src)PipiJpsi.cxx
endif
endif

else
$(bin)PipiJpsiAlg_dependencies.make : $(PipiJpsi_cxx_dependencies)

$(bin)PipiJpsiAlg_dependencies.make : $(src)PipiJpsi.cxx

$(bin)$(binobj)PipiJpsi.o : $(PipiJpsi_cxx_dependencies)
	$(cpp_echo) $(src)PipiJpsi.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(PipiJpsiAlg_pp_cppflags) $(lib_PipiJpsiAlg_pp_cppflags) $(PipiJpsi_pp_cppflags) $(use_cppflags) $(PipiJpsiAlg_cppflags) $(lib_PipiJpsiAlg_cppflags) $(PipiJpsi_cppflags) $(PipiJpsi_cxx_cppflags)  $(src)PipiJpsi.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),PipiJpsiAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PipiJpsi_load.d

$(bin)$(binobj)PipiJpsi_load.d :

$(bin)$(binobj)PipiJpsi_load.o : $(cmt_final_setup_PipiJpsiAlg)

$(bin)$(binobj)PipiJpsi_load.o : $(src)PipiJpsi_load.cxx
	$(cpp_echo) $(src)PipiJpsi_load.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(PipiJpsiAlg_pp_cppflags) $(lib_PipiJpsiAlg_pp_cppflags) $(PipiJpsi_load_pp_cppflags) $(use_cppflags) $(PipiJpsiAlg_cppflags) $(lib_PipiJpsiAlg_cppflags) $(PipiJpsi_load_cppflags) $(PipiJpsi_load_cxx_cppflags)  $(src)PipiJpsi_load.cxx
endif
endif

else
$(bin)PipiJpsiAlg_dependencies.make : $(PipiJpsi_load_cxx_dependencies)

$(bin)PipiJpsiAlg_dependencies.make : $(src)PipiJpsi_load.cxx

$(bin)$(binobj)PipiJpsi_load.o : $(PipiJpsi_load_cxx_dependencies)
	$(cpp_echo) $(src)PipiJpsi_load.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(PipiJpsiAlg_pp_cppflags) $(lib_PipiJpsiAlg_pp_cppflags) $(PipiJpsi_load_pp_cppflags) $(use_cppflags) $(PipiJpsiAlg_cppflags) $(lib_PipiJpsiAlg_cppflags) $(PipiJpsi_load_cppflags) $(PipiJpsi_load_cxx_cppflags)  $(src)PipiJpsi_load.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),PipiJpsiAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PipiJpsi_entries.d

$(bin)$(binobj)PipiJpsi_entries.d :

$(bin)$(binobj)PipiJpsi_entries.o : $(cmt_final_setup_PipiJpsiAlg)

$(bin)$(binobj)PipiJpsi_entries.o : $(src)PipiJpsi_entries.cxx
	$(cpp_echo) $(src)PipiJpsi_entries.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(PipiJpsiAlg_pp_cppflags) $(lib_PipiJpsiAlg_pp_cppflags) $(PipiJpsi_entries_pp_cppflags) $(use_cppflags) $(PipiJpsiAlg_cppflags) $(lib_PipiJpsiAlg_cppflags) $(PipiJpsi_entries_cppflags) $(PipiJpsi_entries_cxx_cppflags)  $(src)PipiJpsi_entries.cxx
endif
endif

else
$(bin)PipiJpsiAlg_dependencies.make : $(PipiJpsi_entries_cxx_dependencies)

$(bin)PipiJpsiAlg_dependencies.make : $(src)PipiJpsi_entries.cxx

$(bin)$(binobj)PipiJpsi_entries.o : $(PipiJpsi_entries_cxx_dependencies)
	$(cpp_echo) $(src)PipiJpsi_entries.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(PipiJpsiAlg_pp_cppflags) $(lib_PipiJpsiAlg_pp_cppflags) $(PipiJpsi_entries_pp_cppflags) $(use_cppflags) $(PipiJpsiAlg_cppflags) $(lib_PipiJpsiAlg_cppflags) $(PipiJpsi_entries_cppflags) $(PipiJpsi_entries_cxx_cppflags)  $(src)PipiJpsi_entries.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: PipiJpsiAlgclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(PipiJpsiAlg.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

PipiJpsiAlgclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library PipiJpsiAlg
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)PipiJpsiAlg$(library_suffix).a $(library_prefix)PipiJpsiAlg$(library_suffix).s? PipiJpsiAlg.stamp PipiJpsiAlg.shstamp
#-- end of cleanup_library ---------------
