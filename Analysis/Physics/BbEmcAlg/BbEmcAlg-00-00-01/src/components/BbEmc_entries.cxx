#include "GaudiKernel/DeclareFactoryEntries.h"
#include "BbEmcAlg/BbEmc.h"
#include "BbEmcAlg/MdcBbEmcEff.h"

DECLARE_ALGORITHM_FACTORY( BbEmc )
DECLARE_ALGORITHM_FACTORY( MdcBbEmcEff )

DECLARE_FACTORY_ENTRIES( BbEmcAlg ) {
  DECLARE_ALGORITHM(BbEmc);
  DECLARE_ALGORITHM(MdcBbEmcEff);
}

