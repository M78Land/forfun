#-- start of make_header -----------------

#====================================
#  Library PpjrhopiAlg
#
#   Generated Thu Nov 11 08:11:38 2021  by bes3pub
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_PpjrhopiAlg_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PpjrhopiAlg_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_PpjrhopiAlg

PpjrhopiAlg_tag = $(tag)

#cmt_local_tagfile_PpjrhopiAlg = $(PpjrhopiAlg_tag)_PpjrhopiAlg.make
cmt_local_tagfile_PpjrhopiAlg = $(bin)$(PpjrhopiAlg_tag)_PpjrhopiAlg.make

else

tags      = $(tag),$(CMTEXTRATAGS)

PpjrhopiAlg_tag = $(tag)

#cmt_local_tagfile_PpjrhopiAlg = $(PpjrhopiAlg_tag).make
cmt_local_tagfile_PpjrhopiAlg = $(bin)$(PpjrhopiAlg_tag).make

endif

include $(cmt_local_tagfile_PpjrhopiAlg)
#-include $(cmt_local_tagfile_PpjrhopiAlg)

ifdef cmt_PpjrhopiAlg_has_target_tag

cmt_final_setup_PpjrhopiAlg = $(bin)setup_PpjrhopiAlg.make
cmt_dependencies_in_PpjrhopiAlg = $(bin)dependencies_PpjrhopiAlg.in
#cmt_final_setup_PpjrhopiAlg = $(bin)PpjrhopiAlg_PpjrhopiAlgsetup.make
cmt_local_PpjrhopiAlg_makefile = $(bin)PpjrhopiAlg.make

else

cmt_final_setup_PpjrhopiAlg = $(bin)setup.make
cmt_dependencies_in_PpjrhopiAlg = $(bin)dependencies.in
#cmt_final_setup_PpjrhopiAlg = $(bin)PpjrhopiAlgsetup.make
cmt_local_PpjrhopiAlg_makefile = $(bin)PpjrhopiAlg.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)PpjrhopiAlgsetup.make

#PpjrhopiAlg :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'PpjrhopiAlg'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = PpjrhopiAlg/
#PpjrhopiAlg::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

PpjrhopiAlglibname   = $(bin)$(library_prefix)PpjrhopiAlg$(library_suffix)
PpjrhopiAlglib       = $(PpjrhopiAlglibname).a
PpjrhopiAlgstamp     = $(bin)PpjrhopiAlg.stamp
PpjrhopiAlgshstamp   = $(bin)PpjrhopiAlg.shstamp

PpjrhopiAlg :: dirs  PpjrhopiAlgLIB
	$(echo) "PpjrhopiAlg ok"

#-- end of libary_header ----------------

PpjrhopiAlgLIB :: $(PpjrhopiAlglib) $(PpjrhopiAlgshstamp)
	@/bin/echo "------> PpjrhopiAlg : library ok"

$(PpjrhopiAlglib) :: $(bin)Ppjrhopi.o $(bin)Ppjrhopi_load.o $(bin)Ppjrhopi_entries.o
	$(lib_echo) library
	$(lib_silent) cd $(bin); \
	  $(ar) $(PpjrhopiAlglib) $?
	$(lib_silent) $(ranlib) $(PpjrhopiAlglib)
	$(lib_silent) cat /dev/null >$(PpjrhopiAlgstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

$(PpjrhopiAlglibname).$(shlibsuffix) :: $(PpjrhopiAlglib) $(PpjrhopiAlgstamps)
	$(lib_silent) cd $(bin); QUIET=$(QUIET); $(make_shlib) "$(tags)" PpjrhopiAlg $(PpjrhopiAlg_shlibflags)

$(PpjrhopiAlgshstamp) :: $(PpjrhopiAlglibname).$(shlibsuffix)
	@if test -f $(PpjrhopiAlglibname).$(shlibsuffix) ; then cat /dev/null >$(PpjrhopiAlgshstamp) ; fi

PpjrhopiAlgclean ::
	$(cleanup_echo) objects
	$(cleanup_silent) cd $(bin); /bin/rm -f $(bin)Ppjrhopi.o $(bin)Ppjrhopi_load.o $(bin)Ppjrhopi_entries.o

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
PpjrhopiAlginstallname = $(library_prefix)PpjrhopiAlg$(library_suffix).$(shlibsuffix)

PpjrhopiAlg :: PpjrhopiAlginstall

install :: PpjrhopiAlginstall

PpjrhopiAlginstall :: $(install_dir)/$(PpjrhopiAlginstallname)
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

$(install_dir)/$(PpjrhopiAlginstallname) :: $(bin)$(PpjrhopiAlginstallname)
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test ! -d "$(install_dir)"; then \
	      mkdir -p $(install_dir); \
	    fi ; \
	    if test -d "$(install_dir)"; then \
	      echo "Installing library $(PpjrhopiAlginstallname) into $(install_dir)"; \
	      if test -e $(install_dir)/$(PpjrhopiAlginstallname); then \
	        $(cmt_uninstall_area_command) $(install_dir)/$(PpjrhopiAlginstallname); \
	        $(cmt_uninstall_area_command) $(install_dir)/$(PpjrhopiAlginstallname).cmtref; \
	      fi; \
	      $(cmt_install_area_command) `pwd`/$(PpjrhopiAlginstallname) $(install_dir)/$(PpjrhopiAlginstallname); \
	      echo `pwd`/$(PpjrhopiAlginstallname) >$(install_dir)/$(PpjrhopiAlginstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot install library $(PpjrhopiAlginstallname), no installation directory specified"; \
	  fi; \
	fi

PpjrhopiAlgclean :: PpjrhopiAlguninstall

uninstall :: PpjrhopiAlguninstall

PpjrhopiAlguninstall ::
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test -d "$(install_dir)"; then \
	      echo "Removing installed library $(PpjrhopiAlginstallname) from $(install_dir)"; \
	      $(cmt_uninstall_area_command) $(install_dir)/$(PpjrhopiAlginstallname); \
	      $(cmt_uninstall_area_command) $(install_dir)/$(PpjrhopiAlginstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot uninstall library $(PpjrhopiAlginstallname), no installation directory specified"; \
	  fi; \
	fi




#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),PpjrhopiAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Ppjrhopi.d

$(bin)$(binobj)Ppjrhopi.d :

$(bin)$(binobj)Ppjrhopi.o : $(cmt_final_setup_PpjrhopiAlg)

$(bin)$(binobj)Ppjrhopi.o : $(src)Ppjrhopi.cxx
	$(cpp_echo) $(src)Ppjrhopi.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(PpjrhopiAlg_pp_cppflags) $(lib_PpjrhopiAlg_pp_cppflags) $(Ppjrhopi_pp_cppflags) $(use_cppflags) $(PpjrhopiAlg_cppflags) $(lib_PpjrhopiAlg_cppflags) $(Ppjrhopi_cppflags) $(Ppjrhopi_cxx_cppflags)  $(src)Ppjrhopi.cxx
endif
endif

else
$(bin)PpjrhopiAlg_dependencies.make : $(Ppjrhopi_cxx_dependencies)

$(bin)PpjrhopiAlg_dependencies.make : $(src)Ppjrhopi.cxx

$(bin)$(binobj)Ppjrhopi.o : $(Ppjrhopi_cxx_dependencies)
	$(cpp_echo) $(src)Ppjrhopi.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(PpjrhopiAlg_pp_cppflags) $(lib_PpjrhopiAlg_pp_cppflags) $(Ppjrhopi_pp_cppflags) $(use_cppflags) $(PpjrhopiAlg_cppflags) $(lib_PpjrhopiAlg_cppflags) $(Ppjrhopi_cppflags) $(Ppjrhopi_cxx_cppflags)  $(src)Ppjrhopi.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),PpjrhopiAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Ppjrhopi_load.d

$(bin)$(binobj)Ppjrhopi_load.d :

$(bin)$(binobj)Ppjrhopi_load.o : $(cmt_final_setup_PpjrhopiAlg)

$(bin)$(binobj)Ppjrhopi_load.o : $(src)components/Ppjrhopi_load.cxx
	$(cpp_echo) $(src)components/Ppjrhopi_load.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(PpjrhopiAlg_pp_cppflags) $(lib_PpjrhopiAlg_pp_cppflags) $(Ppjrhopi_load_pp_cppflags) $(use_cppflags) $(PpjrhopiAlg_cppflags) $(lib_PpjrhopiAlg_cppflags) $(Ppjrhopi_load_cppflags) $(Ppjrhopi_load_cxx_cppflags) -I../src/components $(src)components/Ppjrhopi_load.cxx
endif
endif

else
$(bin)PpjrhopiAlg_dependencies.make : $(Ppjrhopi_load_cxx_dependencies)

$(bin)PpjrhopiAlg_dependencies.make : $(src)components/Ppjrhopi_load.cxx

$(bin)$(binobj)Ppjrhopi_load.o : $(Ppjrhopi_load_cxx_dependencies)
	$(cpp_echo) $(src)components/Ppjrhopi_load.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(PpjrhopiAlg_pp_cppflags) $(lib_PpjrhopiAlg_pp_cppflags) $(Ppjrhopi_load_pp_cppflags) $(use_cppflags) $(PpjrhopiAlg_cppflags) $(lib_PpjrhopiAlg_cppflags) $(Ppjrhopi_load_cppflags) $(Ppjrhopi_load_cxx_cppflags) -I../src/components $(src)components/Ppjrhopi_load.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),PpjrhopiAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Ppjrhopi_entries.d

$(bin)$(binobj)Ppjrhopi_entries.d :

$(bin)$(binobj)Ppjrhopi_entries.o : $(cmt_final_setup_PpjrhopiAlg)

$(bin)$(binobj)Ppjrhopi_entries.o : $(src)components/Ppjrhopi_entries.cxx
	$(cpp_echo) $(src)components/Ppjrhopi_entries.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(PpjrhopiAlg_pp_cppflags) $(lib_PpjrhopiAlg_pp_cppflags) $(Ppjrhopi_entries_pp_cppflags) $(use_cppflags) $(PpjrhopiAlg_cppflags) $(lib_PpjrhopiAlg_cppflags) $(Ppjrhopi_entries_cppflags) $(Ppjrhopi_entries_cxx_cppflags) -I../src/components $(src)components/Ppjrhopi_entries.cxx
endif
endif

else
$(bin)PpjrhopiAlg_dependencies.make : $(Ppjrhopi_entries_cxx_dependencies)

$(bin)PpjrhopiAlg_dependencies.make : $(src)components/Ppjrhopi_entries.cxx

$(bin)$(binobj)Ppjrhopi_entries.o : $(Ppjrhopi_entries_cxx_dependencies)
	$(cpp_echo) $(src)components/Ppjrhopi_entries.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(PpjrhopiAlg_pp_cppflags) $(lib_PpjrhopiAlg_pp_cppflags) $(Ppjrhopi_entries_pp_cppflags) $(use_cppflags) $(PpjrhopiAlg_cppflags) $(lib_PpjrhopiAlg_cppflags) $(Ppjrhopi_entries_cppflags) $(Ppjrhopi_entries_cxx_cppflags) -I../src/components $(src)components/Ppjrhopi_entries.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: PpjrhopiAlgclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(PpjrhopiAlg.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

PpjrhopiAlgclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library PpjrhopiAlg
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)PpjrhopiAlg$(library_suffix).a $(library_prefix)PpjrhopiAlg$(library_suffix).s? PpjrhopiAlg.stamp PpjrhopiAlg.shstamp
#-- end of cleanup_library ---------------
