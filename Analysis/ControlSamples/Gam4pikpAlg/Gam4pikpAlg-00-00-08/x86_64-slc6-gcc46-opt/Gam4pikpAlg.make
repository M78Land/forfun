#-- start of make_header -----------------

#====================================
#  Library Gam4pikpAlg
#
#   Generated Thu Nov 11 08:11:44 2021  by bes3pub
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_Gam4pikpAlg_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_Gam4pikpAlg_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_Gam4pikpAlg

Gam4pikpAlg_tag = $(tag)

#cmt_local_tagfile_Gam4pikpAlg = $(Gam4pikpAlg_tag)_Gam4pikpAlg.make
cmt_local_tagfile_Gam4pikpAlg = $(bin)$(Gam4pikpAlg_tag)_Gam4pikpAlg.make

else

tags      = $(tag),$(CMTEXTRATAGS)

Gam4pikpAlg_tag = $(tag)

#cmt_local_tagfile_Gam4pikpAlg = $(Gam4pikpAlg_tag).make
cmt_local_tagfile_Gam4pikpAlg = $(bin)$(Gam4pikpAlg_tag).make

endif

include $(cmt_local_tagfile_Gam4pikpAlg)
#-include $(cmt_local_tagfile_Gam4pikpAlg)

ifdef cmt_Gam4pikpAlg_has_target_tag

cmt_final_setup_Gam4pikpAlg = $(bin)setup_Gam4pikpAlg.make
cmt_dependencies_in_Gam4pikpAlg = $(bin)dependencies_Gam4pikpAlg.in
#cmt_final_setup_Gam4pikpAlg = $(bin)Gam4pikpAlg_Gam4pikpAlgsetup.make
cmt_local_Gam4pikpAlg_makefile = $(bin)Gam4pikpAlg.make

else

cmt_final_setup_Gam4pikpAlg = $(bin)setup.make
cmt_dependencies_in_Gam4pikpAlg = $(bin)dependencies.in
#cmt_final_setup_Gam4pikpAlg = $(bin)Gam4pikpAlgsetup.make
cmt_local_Gam4pikpAlg_makefile = $(bin)Gam4pikpAlg.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)Gam4pikpAlgsetup.make

#Gam4pikpAlg :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'Gam4pikpAlg'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = Gam4pikpAlg/
#Gam4pikpAlg::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

Gam4pikpAlglibname   = $(bin)$(library_prefix)Gam4pikpAlg$(library_suffix)
Gam4pikpAlglib       = $(Gam4pikpAlglibname).a
Gam4pikpAlgstamp     = $(bin)Gam4pikpAlg.stamp
Gam4pikpAlgshstamp   = $(bin)Gam4pikpAlg.shstamp

Gam4pikpAlg :: dirs  Gam4pikpAlgLIB
	$(echo) "Gam4pikpAlg ok"

#-- end of libary_header ----------------

Gam4pikpAlgLIB :: $(Gam4pikpAlglib) $(Gam4pikpAlgshstamp)
	@/bin/echo "------> Gam4pikpAlg : library ok"

$(Gam4pikpAlglib) :: $(bin)Gam4pikp.o $(bin)Gam4pikp_load.o $(bin)Gam4pikp_entries.o
	$(lib_echo) library
	$(lib_silent) cd $(bin); \
	  $(ar) $(Gam4pikpAlglib) $?
	$(lib_silent) $(ranlib) $(Gam4pikpAlglib)
	$(lib_silent) cat /dev/null >$(Gam4pikpAlgstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

$(Gam4pikpAlglibname).$(shlibsuffix) :: $(Gam4pikpAlglib) $(Gam4pikpAlgstamps)
	$(lib_silent) cd $(bin); QUIET=$(QUIET); $(make_shlib) "$(tags)" Gam4pikpAlg $(Gam4pikpAlg_shlibflags)

$(Gam4pikpAlgshstamp) :: $(Gam4pikpAlglibname).$(shlibsuffix)
	@if test -f $(Gam4pikpAlglibname).$(shlibsuffix) ; then cat /dev/null >$(Gam4pikpAlgshstamp) ; fi

Gam4pikpAlgclean ::
	$(cleanup_echo) objects
	$(cleanup_silent) cd $(bin); /bin/rm -f $(bin)Gam4pikp.o $(bin)Gam4pikp_load.o $(bin)Gam4pikp_entries.o

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
Gam4pikpAlginstallname = $(library_prefix)Gam4pikpAlg$(library_suffix).$(shlibsuffix)

Gam4pikpAlg :: Gam4pikpAlginstall

install :: Gam4pikpAlginstall

Gam4pikpAlginstall :: $(install_dir)/$(Gam4pikpAlginstallname)
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

$(install_dir)/$(Gam4pikpAlginstallname) :: $(bin)$(Gam4pikpAlginstallname)
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test ! -d "$(install_dir)"; then \
	      mkdir -p $(install_dir); \
	    fi ; \
	    if test -d "$(install_dir)"; then \
	      echo "Installing library $(Gam4pikpAlginstallname) into $(install_dir)"; \
	      if test -e $(install_dir)/$(Gam4pikpAlginstallname); then \
	        $(cmt_uninstall_area_command) $(install_dir)/$(Gam4pikpAlginstallname); \
	        $(cmt_uninstall_area_command) $(install_dir)/$(Gam4pikpAlginstallname).cmtref; \
	      fi; \
	      $(cmt_install_area_command) `pwd`/$(Gam4pikpAlginstallname) $(install_dir)/$(Gam4pikpAlginstallname); \
	      echo `pwd`/$(Gam4pikpAlginstallname) >$(install_dir)/$(Gam4pikpAlginstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot install library $(Gam4pikpAlginstallname), no installation directory specified"; \
	  fi; \
	fi

Gam4pikpAlgclean :: Gam4pikpAlguninstall

uninstall :: Gam4pikpAlguninstall

Gam4pikpAlguninstall ::
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test -d "$(install_dir)"; then \
	      echo "Removing installed library $(Gam4pikpAlginstallname) from $(install_dir)"; \
	      $(cmt_uninstall_area_command) $(install_dir)/$(Gam4pikpAlginstallname); \
	      $(cmt_uninstall_area_command) $(install_dir)/$(Gam4pikpAlginstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot uninstall library $(Gam4pikpAlginstallname), no installation directory specified"; \
	  fi; \
	fi




#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),Gam4pikpAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Gam4pikp.d

$(bin)$(binobj)Gam4pikp.d :

$(bin)$(binobj)Gam4pikp.o : $(cmt_final_setup_Gam4pikpAlg)

$(bin)$(binobj)Gam4pikp.o : $(src)Gam4pikp.cxx
	$(cpp_echo) $(src)Gam4pikp.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(Gam4pikpAlg_pp_cppflags) $(lib_Gam4pikpAlg_pp_cppflags) $(Gam4pikp_pp_cppflags) $(use_cppflags) $(Gam4pikpAlg_cppflags) $(lib_Gam4pikpAlg_cppflags) $(Gam4pikp_cppflags) $(Gam4pikp_cxx_cppflags)  $(src)Gam4pikp.cxx
endif
endif

else
$(bin)Gam4pikpAlg_dependencies.make : $(Gam4pikp_cxx_dependencies)

$(bin)Gam4pikpAlg_dependencies.make : $(src)Gam4pikp.cxx

$(bin)$(binobj)Gam4pikp.o : $(Gam4pikp_cxx_dependencies)
	$(cpp_echo) $(src)Gam4pikp.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(Gam4pikpAlg_pp_cppflags) $(lib_Gam4pikpAlg_pp_cppflags) $(Gam4pikp_pp_cppflags) $(use_cppflags) $(Gam4pikpAlg_cppflags) $(lib_Gam4pikpAlg_cppflags) $(Gam4pikp_cppflags) $(Gam4pikp_cxx_cppflags)  $(src)Gam4pikp.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),Gam4pikpAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Gam4pikp_load.d

$(bin)$(binobj)Gam4pikp_load.d :

$(bin)$(binobj)Gam4pikp_load.o : $(cmt_final_setup_Gam4pikpAlg)

$(bin)$(binobj)Gam4pikp_load.o : $(src)components/Gam4pikp_load.cxx
	$(cpp_echo) $(src)components/Gam4pikp_load.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(Gam4pikpAlg_pp_cppflags) $(lib_Gam4pikpAlg_pp_cppflags) $(Gam4pikp_load_pp_cppflags) $(use_cppflags) $(Gam4pikpAlg_cppflags) $(lib_Gam4pikpAlg_cppflags) $(Gam4pikp_load_cppflags) $(Gam4pikp_load_cxx_cppflags) -I../src/components $(src)components/Gam4pikp_load.cxx
endif
endif

else
$(bin)Gam4pikpAlg_dependencies.make : $(Gam4pikp_load_cxx_dependencies)

$(bin)Gam4pikpAlg_dependencies.make : $(src)components/Gam4pikp_load.cxx

$(bin)$(binobj)Gam4pikp_load.o : $(Gam4pikp_load_cxx_dependencies)
	$(cpp_echo) $(src)components/Gam4pikp_load.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(Gam4pikpAlg_pp_cppflags) $(lib_Gam4pikpAlg_pp_cppflags) $(Gam4pikp_load_pp_cppflags) $(use_cppflags) $(Gam4pikpAlg_cppflags) $(lib_Gam4pikpAlg_cppflags) $(Gam4pikp_load_cppflags) $(Gam4pikp_load_cxx_cppflags) -I../src/components $(src)components/Gam4pikp_load.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),Gam4pikpAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Gam4pikp_entries.d

$(bin)$(binobj)Gam4pikp_entries.d :

$(bin)$(binobj)Gam4pikp_entries.o : $(cmt_final_setup_Gam4pikpAlg)

$(bin)$(binobj)Gam4pikp_entries.o : $(src)components/Gam4pikp_entries.cxx
	$(cpp_echo) $(src)components/Gam4pikp_entries.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(Gam4pikpAlg_pp_cppflags) $(lib_Gam4pikpAlg_pp_cppflags) $(Gam4pikp_entries_pp_cppflags) $(use_cppflags) $(Gam4pikpAlg_cppflags) $(lib_Gam4pikpAlg_cppflags) $(Gam4pikp_entries_cppflags) $(Gam4pikp_entries_cxx_cppflags) -I../src/components $(src)components/Gam4pikp_entries.cxx
endif
endif

else
$(bin)Gam4pikpAlg_dependencies.make : $(Gam4pikp_entries_cxx_dependencies)

$(bin)Gam4pikpAlg_dependencies.make : $(src)components/Gam4pikp_entries.cxx

$(bin)$(binobj)Gam4pikp_entries.o : $(Gam4pikp_entries_cxx_dependencies)
	$(cpp_echo) $(src)components/Gam4pikp_entries.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(Gam4pikpAlg_pp_cppflags) $(lib_Gam4pikpAlg_pp_cppflags) $(Gam4pikp_entries_pp_cppflags) $(use_cppflags) $(Gam4pikpAlg_cppflags) $(lib_Gam4pikpAlg_cppflags) $(Gam4pikp_entries_cppflags) $(Gam4pikp_entries_cxx_cppflags) -I../src/components $(src)components/Gam4pikp_entries.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: Gam4pikpAlgclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(Gam4pikpAlg.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

Gam4pikpAlgclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library Gam4pikpAlg
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)Gam4pikpAlg$(library_suffix).a $(library_prefix)Gam4pikpAlg$(library_suffix).s? Gam4pikpAlg.stamp Gam4pikpAlg.shstamp
#-- end of cleanup_library ---------------
