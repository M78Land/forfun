#-- start of make_header -----------------

#====================================
#  Library ParticleID
#
#   Generated Wed Nov 10 16:04:06 2021  by bes3pub
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_ParticleID_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_ParticleID_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_ParticleID

ParticleID_tag = $(tag)

#cmt_local_tagfile_ParticleID = $(ParticleID_tag)_ParticleID.make
cmt_local_tagfile_ParticleID = $(bin)$(ParticleID_tag)_ParticleID.make

else

tags      = $(tag),$(CMTEXTRATAGS)

ParticleID_tag = $(tag)

#cmt_local_tagfile_ParticleID = $(ParticleID_tag).make
cmt_local_tagfile_ParticleID = $(bin)$(ParticleID_tag).make

endif

include $(cmt_local_tagfile_ParticleID)
#-include $(cmt_local_tagfile_ParticleID)

ifdef cmt_ParticleID_has_target_tag

cmt_final_setup_ParticleID = $(bin)setup_ParticleID.make
cmt_dependencies_in_ParticleID = $(bin)dependencies_ParticleID.in
#cmt_final_setup_ParticleID = $(bin)ParticleID_ParticleIDsetup.make
cmt_local_ParticleID_makefile = $(bin)ParticleID.make

else

cmt_final_setup_ParticleID = $(bin)setup.make
cmt_dependencies_in_ParticleID = $(bin)dependencies.in
#cmt_final_setup_ParticleID = $(bin)ParticleIDsetup.make
cmt_local_ParticleID_makefile = $(bin)ParticleID.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)ParticleIDsetup.make

#ParticleID :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'ParticleID'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = ParticleID/
#ParticleID::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

ParticleIDlibname   = $(bin)$(library_prefix)ParticleID$(library_suffix)
ParticleIDlib       = $(ParticleIDlibname).a
ParticleIDstamp     = $(bin)ParticleID.stamp
ParticleIDshstamp   = $(bin)ParticleID.shstamp

ParticleID :: dirs  ParticleIDLIB
	$(echo) "ParticleID ok"

#-- end of libary_header ----------------

ParticleIDLIB :: $(ParticleIDlib) $(ParticleIDshstamp)
	@/bin/echo "------> ParticleID : library ok"

$(ParticleIDlib) :: $(bin)DedxPID.o $(bin)EmcPID.o $(bin)MucPID.o $(bin)ParticleID.o $(bin)ParticleIDBase.o $(bin)Tof1PID.o $(bin)Tof2PID.o $(bin)TofCPID.o $(bin)TofCorrPID.o $(bin)TofEPID.o $(bin)TofPID.o $(bin)TofQPID.o $(bin)calg.o
	$(lib_echo) library
	$(lib_silent) cd $(bin); \
	  $(ar) $(ParticleIDlib) $?
	$(lib_silent) $(ranlib) $(ParticleIDlib)
	$(lib_silent) cat /dev/null >$(ParticleIDstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

$(ParticleIDlibname).$(shlibsuffix) :: $(ParticleIDlib) $(ParticleIDstamps)
	$(lib_silent) cd $(bin); QUIET=$(QUIET); $(make_shlib) "$(tags)" ParticleID $(ParticleID_shlibflags)

$(ParticleIDshstamp) :: $(ParticleIDlibname).$(shlibsuffix)
	@if test -f $(ParticleIDlibname).$(shlibsuffix) ; then cat /dev/null >$(ParticleIDshstamp) ; fi

ParticleIDclean ::
	$(cleanup_echo) objects
	$(cleanup_silent) cd $(bin); /bin/rm -f $(bin)DedxPID.o $(bin)EmcPID.o $(bin)MucPID.o $(bin)ParticleID.o $(bin)ParticleIDBase.o $(bin)Tof1PID.o $(bin)Tof2PID.o $(bin)TofCPID.o $(bin)TofCorrPID.o $(bin)TofEPID.o $(bin)TofPID.o $(bin)TofQPID.o $(bin)calg.o

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
ParticleIDinstallname = $(library_prefix)ParticleID$(library_suffix).$(shlibsuffix)

ParticleID :: ParticleIDinstall

install :: ParticleIDinstall

ParticleIDinstall :: $(install_dir)/$(ParticleIDinstallname)
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

$(install_dir)/$(ParticleIDinstallname) :: $(bin)$(ParticleIDinstallname)
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test ! -d "$(install_dir)"; then \
	      mkdir -p $(install_dir); \
	    fi ; \
	    if test -d "$(install_dir)"; then \
	      echo "Installing library $(ParticleIDinstallname) into $(install_dir)"; \
	      if test -e $(install_dir)/$(ParticleIDinstallname); then \
	        $(cmt_uninstall_area_command) $(install_dir)/$(ParticleIDinstallname); \
	        $(cmt_uninstall_area_command) $(install_dir)/$(ParticleIDinstallname).cmtref; \
	      fi; \
	      $(cmt_install_area_command) `pwd`/$(ParticleIDinstallname) $(install_dir)/$(ParticleIDinstallname); \
	      echo `pwd`/$(ParticleIDinstallname) >$(install_dir)/$(ParticleIDinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot install library $(ParticleIDinstallname), no installation directory specified"; \
	  fi; \
	fi

ParticleIDclean :: ParticleIDuninstall

uninstall :: ParticleIDuninstall

ParticleIDuninstall ::
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test -d "$(install_dir)"; then \
	      echo "Removing installed library $(ParticleIDinstallname) from $(install_dir)"; \
	      $(cmt_uninstall_area_command) $(install_dir)/$(ParticleIDinstallname); \
	      $(cmt_uninstall_area_command) $(install_dir)/$(ParticleIDinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot uninstall library $(ParticleIDinstallname), no installation directory specified"; \
	  fi; \
	fi




#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ParticleIDclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)DedxPID.d

$(bin)$(binobj)DedxPID.d :

$(bin)$(binobj)DedxPID.o : $(cmt_final_setup_ParticleID)

$(bin)$(binobj)DedxPID.o : $(src)DedxPID.cxx
	$(cpp_echo) $(src)DedxPID.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(DedxPID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(DedxPID_cppflags) $(DedxPID_cxx_cppflags)  $(src)DedxPID.cxx
endif
endif

else
$(bin)ParticleID_dependencies.make : $(DedxPID_cxx_dependencies)

$(bin)ParticleID_dependencies.make : $(src)DedxPID.cxx

$(bin)$(binobj)DedxPID.o : $(DedxPID_cxx_dependencies)
	$(cpp_echo) $(src)DedxPID.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(DedxPID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(DedxPID_cppflags) $(DedxPID_cxx_cppflags)  $(src)DedxPID.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ParticleIDclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)EmcPID.d

$(bin)$(binobj)EmcPID.d :

$(bin)$(binobj)EmcPID.o : $(cmt_final_setup_ParticleID)

$(bin)$(binobj)EmcPID.o : $(src)EmcPID.cxx
	$(cpp_echo) $(src)EmcPID.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(EmcPID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(EmcPID_cppflags) $(EmcPID_cxx_cppflags)  $(src)EmcPID.cxx
endif
endif

else
$(bin)ParticleID_dependencies.make : $(EmcPID_cxx_dependencies)

$(bin)ParticleID_dependencies.make : $(src)EmcPID.cxx

$(bin)$(binobj)EmcPID.o : $(EmcPID_cxx_dependencies)
	$(cpp_echo) $(src)EmcPID.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(EmcPID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(EmcPID_cppflags) $(EmcPID_cxx_cppflags)  $(src)EmcPID.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ParticleIDclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)MucPID.d

$(bin)$(binobj)MucPID.d :

$(bin)$(binobj)MucPID.o : $(cmt_final_setup_ParticleID)

$(bin)$(binobj)MucPID.o : $(src)MucPID.cxx
	$(cpp_echo) $(src)MucPID.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(MucPID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(MucPID_cppflags) $(MucPID_cxx_cppflags)  $(src)MucPID.cxx
endif
endif

else
$(bin)ParticleID_dependencies.make : $(MucPID_cxx_dependencies)

$(bin)ParticleID_dependencies.make : $(src)MucPID.cxx

$(bin)$(binobj)MucPID.o : $(MucPID_cxx_dependencies)
	$(cpp_echo) $(src)MucPID.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(MucPID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(MucPID_cppflags) $(MucPID_cxx_cppflags)  $(src)MucPID.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ParticleIDclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ParticleID.d

$(bin)$(binobj)ParticleID.d :

$(bin)$(binobj)ParticleID.o : $(cmt_final_setup_ParticleID)

$(bin)$(binobj)ParticleID.o : $(src)ParticleID.cxx
	$(cpp_echo) $(src)ParticleID.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(ParticleID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(ParticleID_cppflags) $(ParticleID_cxx_cppflags)  $(src)ParticleID.cxx
endif
endif

else
$(bin)ParticleID_dependencies.make : $(ParticleID_cxx_dependencies)

$(bin)ParticleID_dependencies.make : $(src)ParticleID.cxx

$(bin)$(binobj)ParticleID.o : $(ParticleID_cxx_dependencies)
	$(cpp_echo) $(src)ParticleID.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(ParticleID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(ParticleID_cppflags) $(ParticleID_cxx_cppflags)  $(src)ParticleID.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ParticleIDclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ParticleIDBase.d

$(bin)$(binobj)ParticleIDBase.d :

$(bin)$(binobj)ParticleIDBase.o : $(cmt_final_setup_ParticleID)

$(bin)$(binobj)ParticleIDBase.o : $(src)ParticleIDBase.cxx
	$(cpp_echo) $(src)ParticleIDBase.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(ParticleIDBase_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(ParticleIDBase_cppflags) $(ParticleIDBase_cxx_cppflags)  $(src)ParticleIDBase.cxx
endif
endif

else
$(bin)ParticleID_dependencies.make : $(ParticleIDBase_cxx_dependencies)

$(bin)ParticleID_dependencies.make : $(src)ParticleIDBase.cxx

$(bin)$(binobj)ParticleIDBase.o : $(ParticleIDBase_cxx_dependencies)
	$(cpp_echo) $(src)ParticleIDBase.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(ParticleIDBase_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(ParticleIDBase_cppflags) $(ParticleIDBase_cxx_cppflags)  $(src)ParticleIDBase.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ParticleIDclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Tof1PID.d

$(bin)$(binobj)Tof1PID.d :

$(bin)$(binobj)Tof1PID.o : $(cmt_final_setup_ParticleID)

$(bin)$(binobj)Tof1PID.o : $(src)Tof1PID.cxx
	$(cpp_echo) $(src)Tof1PID.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(Tof1PID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(Tof1PID_cppflags) $(Tof1PID_cxx_cppflags)  $(src)Tof1PID.cxx
endif
endif

else
$(bin)ParticleID_dependencies.make : $(Tof1PID_cxx_dependencies)

$(bin)ParticleID_dependencies.make : $(src)Tof1PID.cxx

$(bin)$(binobj)Tof1PID.o : $(Tof1PID_cxx_dependencies)
	$(cpp_echo) $(src)Tof1PID.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(Tof1PID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(Tof1PID_cppflags) $(Tof1PID_cxx_cppflags)  $(src)Tof1PID.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ParticleIDclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)Tof2PID.d

$(bin)$(binobj)Tof2PID.d :

$(bin)$(binobj)Tof2PID.o : $(cmt_final_setup_ParticleID)

$(bin)$(binobj)Tof2PID.o : $(src)Tof2PID.cxx
	$(cpp_echo) $(src)Tof2PID.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(Tof2PID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(Tof2PID_cppflags) $(Tof2PID_cxx_cppflags)  $(src)Tof2PID.cxx
endif
endif

else
$(bin)ParticleID_dependencies.make : $(Tof2PID_cxx_dependencies)

$(bin)ParticleID_dependencies.make : $(src)Tof2PID.cxx

$(bin)$(binobj)Tof2PID.o : $(Tof2PID_cxx_dependencies)
	$(cpp_echo) $(src)Tof2PID.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(Tof2PID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(Tof2PID_cppflags) $(Tof2PID_cxx_cppflags)  $(src)Tof2PID.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ParticleIDclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TofCPID.d

$(bin)$(binobj)TofCPID.d :

$(bin)$(binobj)TofCPID.o : $(cmt_final_setup_ParticleID)

$(bin)$(binobj)TofCPID.o : $(src)TofCPID.cxx
	$(cpp_echo) $(src)TofCPID.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(TofCPID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(TofCPID_cppflags) $(TofCPID_cxx_cppflags)  $(src)TofCPID.cxx
endif
endif

else
$(bin)ParticleID_dependencies.make : $(TofCPID_cxx_dependencies)

$(bin)ParticleID_dependencies.make : $(src)TofCPID.cxx

$(bin)$(binobj)TofCPID.o : $(TofCPID_cxx_dependencies)
	$(cpp_echo) $(src)TofCPID.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(TofCPID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(TofCPID_cppflags) $(TofCPID_cxx_cppflags)  $(src)TofCPID.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ParticleIDclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TofCorrPID.d

$(bin)$(binobj)TofCorrPID.d :

$(bin)$(binobj)TofCorrPID.o : $(cmt_final_setup_ParticleID)

$(bin)$(binobj)TofCorrPID.o : $(src)TofCorrPID.cxx
	$(cpp_echo) $(src)TofCorrPID.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(TofCorrPID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(TofCorrPID_cppflags) $(TofCorrPID_cxx_cppflags)  $(src)TofCorrPID.cxx
endif
endif

else
$(bin)ParticleID_dependencies.make : $(TofCorrPID_cxx_dependencies)

$(bin)ParticleID_dependencies.make : $(src)TofCorrPID.cxx

$(bin)$(binobj)TofCorrPID.o : $(TofCorrPID_cxx_dependencies)
	$(cpp_echo) $(src)TofCorrPID.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(TofCorrPID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(TofCorrPID_cppflags) $(TofCorrPID_cxx_cppflags)  $(src)TofCorrPID.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ParticleIDclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TofEPID.d

$(bin)$(binobj)TofEPID.d :

$(bin)$(binobj)TofEPID.o : $(cmt_final_setup_ParticleID)

$(bin)$(binobj)TofEPID.o : $(src)TofEPID.cxx
	$(cpp_echo) $(src)TofEPID.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(TofEPID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(TofEPID_cppflags) $(TofEPID_cxx_cppflags)  $(src)TofEPID.cxx
endif
endif

else
$(bin)ParticleID_dependencies.make : $(TofEPID_cxx_dependencies)

$(bin)ParticleID_dependencies.make : $(src)TofEPID.cxx

$(bin)$(binobj)TofEPID.o : $(TofEPID_cxx_dependencies)
	$(cpp_echo) $(src)TofEPID.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(TofEPID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(TofEPID_cppflags) $(TofEPID_cxx_cppflags)  $(src)TofEPID.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ParticleIDclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TofPID.d

$(bin)$(binobj)TofPID.d :

$(bin)$(binobj)TofPID.o : $(cmt_final_setup_ParticleID)

$(bin)$(binobj)TofPID.o : $(src)TofPID.cxx
	$(cpp_echo) $(src)TofPID.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(TofPID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(TofPID_cppflags) $(TofPID_cxx_cppflags)  $(src)TofPID.cxx
endif
endif

else
$(bin)ParticleID_dependencies.make : $(TofPID_cxx_dependencies)

$(bin)ParticleID_dependencies.make : $(src)TofPID.cxx

$(bin)$(binobj)TofPID.o : $(TofPID_cxx_dependencies)
	$(cpp_echo) $(src)TofPID.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(TofPID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(TofPID_cppflags) $(TofPID_cxx_cppflags)  $(src)TofPID.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ParticleIDclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TofQPID.d

$(bin)$(binobj)TofQPID.d :

$(bin)$(binobj)TofQPID.o : $(cmt_final_setup_ParticleID)

$(bin)$(binobj)TofQPID.o : $(src)TofQPID.cxx
	$(cpp_echo) $(src)TofQPID.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(TofQPID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(TofQPID_cppflags) $(TofQPID_cxx_cppflags)  $(src)TofQPID.cxx
endif
endif

else
$(bin)ParticleID_dependencies.make : $(TofQPID_cxx_dependencies)

$(bin)ParticleID_dependencies.make : $(src)TofQPID.cxx

$(bin)$(binobj)TofQPID.o : $(TofQPID_cxx_dependencies)
	$(cpp_echo) $(src)TofQPID.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(TofQPID_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(TofQPID_cppflags) $(TofQPID_cxx_cppflags)  $(src)TofQPID.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ParticleIDclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)calg.d

$(bin)$(binobj)calg.d :

$(bin)$(binobj)calg.o : $(cmt_final_setup_ParticleID)

$(bin)$(binobj)calg.o : $(src)calg.cxx
	$(cpp_echo) $(src)calg.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(calg_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(calg_cppflags) $(calg_cxx_cppflags)  $(src)calg.cxx
endif
endif

else
$(bin)ParticleID_dependencies.make : $(calg_cxx_dependencies)

$(bin)ParticleID_dependencies.make : $(src)calg.cxx

$(bin)$(binobj)calg.o : $(calg_cxx_dependencies)
	$(cpp_echo) $(src)calg.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ParticleID_pp_cppflags) $(lib_ParticleID_pp_cppflags) $(calg_pp_cppflags) $(use_cppflags) $(ParticleID_cppflags) $(lib_ParticleID_cppflags) $(calg_cppflags) $(calg_cxx_cppflags)  $(src)calg.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: ParticleIDclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(ParticleID.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

ParticleIDclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library ParticleID
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)ParticleID$(library_suffix).a $(library_prefix)ParticleID$(library_suffix).s? ParticleID.stamp ParticleID.shstamp
#-- end of cleanup_library ---------------
